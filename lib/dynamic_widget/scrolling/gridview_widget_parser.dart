import 'dart:async';
import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class GridViewWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") &&
        "horizontal" == map["scrollDirection"]) {
      scrollDirection = Axis.horizontal;
    }
    int? crossAxisCount = map['crossAxisCount'];
    bool? reverse = toBool(map['reverse'], false);
    bool? shrinkWrap = toBool(map["shrinkWrap"], false);
    double? cacheExtent = toDouble(map["cacheExtent"], 0.0);
    EdgeInsetsGeometry? padding = map.containsKey('padding')
        ? parseEdgeInsetsGeometry(map['padding'])
        : null;
    double? mainAxisSpacing = toDouble(map['mainAxisSpacing'], 0.0);
    double? crossAxisSpacing = toDouble(map['crossAxisSpacing'], 0.0);
    double? childAspectRatio = toDouble(map['childAspectRatio'], 1.0);
    var children = DynamicWidgetBuilder.buildWidgets(
        map['children'], buildContext, listener);

    var pageSize = toInt(map["pageSize"], 10);
    var loadMoreUrl = toStr(map["loadMoreUrl"], null);
    var isDemo = toBool(map["isDemo"], false);

    GridViewParams params = GridViewParams(
        crossAxisCount: crossAxisCount,
        scrollDirection: scrollDirection,
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        cacheExtent: cacheExtent,
        padding: padding,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
        children: children,
        pageSize: pageSize,
        loadMoreUrl: loadMoreUrl,
        isDemo: isDemo);
    return GridViewWidget(params, buildContext);
  }

  @override
  String get widgetName => "GridView";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as GridViewWidget;
    String scrollDirection = "vertical";
    if (realWidget._params.scrollDirection == Axis.horizontal) {
      scrollDirection = "horizontal";
    }

    var padding = realWidget._params.padding as EdgeInsets?;
    return <String, dynamic>{
      "type": "GridView",
      "scrollDirection": scrollDirection,
      "crossAxisCount": realWidget._params.crossAxisCount,
      "reverse": realWidget._params.reverse ?? false,
      "shrinkWrap": realWidget._params.shrinkWrap ?? false,
      "cacheExtent": realWidget._params.cacheExtent ?? 0.0,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "mainAxisSpacing": realWidget._params.mainAxisSpacing ?? 0.0,
      "crossAxisSpacing": realWidget._params.crossAxisSpacing ?? 0.0,
      "childAspectRatio": realWidget._params.childAspectRatio ?? 1.0,
      "pageSize": realWidget._params.pageSize ?? 10,
      "loadMoreUrl": realWidget._params.loadMoreUrl ?? null,
      "isDemo": realWidget._params.isDemo ?? false,
      "children": DynamicWidgetBuilder.exportWidgets(
          realWidget._params.children!, buildContext)
    };
  }

  @override
  Type get widgetType => GridViewWidget;
}

class GridViewWidget extends StatefulWidget {
  final GridViewParams _params;

  final BuildContext _buildContext;

  GridViewWidget(this._params, this._buildContext);

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState(_params);
}

class _GridViewWidgetState extends State<GridViewWidget> {
  GridViewParams _params;
  List<Widget?> _items = [];

  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  //If there are no more items, it should not try to load more data while scroll
  //to bottom.
  bool loadCompleted = false;

  _GridViewWidgetState(this._params) {
    if (_params.children != null) {
      _items.addAll(_params.children!);
    }
  }

  @override
  void initState() {
    super.initState();
    if (_params.loadMoreUrl == null || _params.loadMoreUrl!.isEmpty) {
      loadCompleted = true;
      return;
    }
    _scrollController.addListener(() {
      if (!loadCompleted &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() async {
    if (!isPerformingRequest) {
      setState(() => isPerformingRequest = true);
      var jsonString =
          _params.isDemo! ? await fakeRequest() : await doRequest();
      var buildWidgets = DynamicWidgetBuilder.buildWidgets(
          jsonDecode(jsonString), widget._buildContext, null);
      setState(() {
        if (buildWidgets.isEmpty) {
          loadCompleted = true;
        }
        _items.addAll(buildWidgets);
        isPerformingRequest = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildProgressIndicator() {
    return new SliverToBoxAdapter(
      child: Visibility(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Center(
            child: new Opacity(
              opacity: isPerformingRequest ? 1.0 : 0.0,
              child: new CircularProgressIndicator(),
            ),
          ),
        ),
        visible: !loadCompleted,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var footer = _buildProgressIndicator();
    var sliverGrid = SliverPadding(
      padding: _params.padding!,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _params.crossAxisCount!,
            mainAxisSpacing: _params.mainAxisSpacing!,
            crossAxisSpacing: _params.crossAxisSpacing!,
            childAspectRatio: _params.childAspectRatio!),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return _items[index];
          },
          childCount: _items.length,
        ),
      ),
    );

    return new CustomScrollView(
      slivers: <Widget>[sliverGrid, footer],
      controller: _scrollController,
      scrollDirection: _params.scrollDirection ?? Axis.vertical,
      reverse: _params.reverse ?? false,
      shrinkWrap: _params.shrinkWrap ?? false,
      cacheExtent: _params.cacheExtent,
    );
  }

  fakeRequest() async {
// 如果对Future不熟悉，可以参考 https://juejin.im/post/5b2c67a351882574a756f2eb
    return Future.delayed(Duration(seconds: 2), () {
      return """
[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
]          
      """;
    });
  }

  doRequest() async {
    // Await the http get response, then decode the json-formatted responce.
    try {
      var response = await http.get(Uri.parse(getLoadMoreUrl(
          _params.loadMoreUrl, _items.length, _params.pageSize)!));
      if (response.statusCode == 200) {
        return response.body;
      }
    } on Exception catch (e) {
      print(e);
    }
    return "";
  }
}

class GridViewParams {
  int? crossAxisCount;
  Axis? scrollDirection;
  bool? reverse;
  bool? shrinkWrap;
  double? cacheExtent;
  EdgeInsetsGeometry? padding;
  double? mainAxisSpacing;
  double? crossAxisSpacing;
  double? childAspectRatio;
  List<Widget?>? children;

  int? pageSize;
  String? loadMoreUrl;

  //use for demo, if true, it will do the fake request.
  bool? isDemo;

  GridViewParams(
      {this.crossAxisCount,
      this.scrollDirection,
      this.reverse,
      this.shrinkWrap,
      this.cacheExtent,
      this.padding,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      this.childAspectRatio,
      this.children,
      this.pageSize,
      this.loadMoreUrl,
      this.isDemo});
}
