import 'dart:async';
import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ListViewWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") &&
        "horizontal" == map["scrollDirection"]) {
      scrollDirection = Axis.horizontal;
    }

    var reverse = toBool(map['reverse'], false);
    var shrinkWrap = toBool(map["shrinkWrap"], false);
    var cacheExtent = toDouble(map["cacheExtent"], 0.0);
    var padding = map.containsKey('padding')
        ? parseEdgeInsetsGeometry(map['padding'])
        : null;
    var itemExtent = toDouble(map["itemExtent"], null);
    var children = DynamicWidgetBuilder.buildWidgets(
        map['children'], buildContext, listener);
    var pageSize = toInt(map["pageSize"], 10);
    var loadMoreUrl = toStr(map["loadMoreUrl"], null);
    var isDemo = toBool(map["isDemo"], false);

    var params = new ListViewParams(
        scrollDirection: scrollDirection,
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        cacheExtent: cacheExtent,
        padding: padding,
        itemExtent: itemExtent,
        children: children,
        pageSize: pageSize,
        loadMoreUrl: loadMoreUrl,
        isDemo: isDemo);

    return new ListViewWidget(params, buildContext);
  }

  @override
  String get widgetName => "ListView";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ListViewWidget;
    String scrollDirection = "vertical";
    if (realWidget._params.scrollDirection == Axis.horizontal) {
      scrollDirection = "horizontal";
    }

    var padding = realWidget._params.padding as EdgeInsets?;
    var tempChild =
        DynamicWidgetBuilder.export(widget._params.tempChild, buildContext);
    return <String, dynamic>{
      "type": "ListView",
      "scrollDirection": scrollDirection,
      "reverse": realWidget._params.reverse ?? false,
      "shrinkWrap": realWidget._params.shrinkWrap ?? false,
      "cacheExtent": realWidget._params.cacheExtent ?? 0.0,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "itemExtent": realWidget._params.itemExtent ?? null,
      "pageSize": realWidget._params.pageSize ?? 10,
      "loadMoreUrl": realWidget._params.loadMoreUrl ?? null,
      "isDemo": realWidget._params.isDemo ?? false,
      "children": DynamicWidgetBuilder.exportWidgets(
          realWidget._params.children ?? [], buildContext),
      "tempChild": tempChild,
      "dataKey": realWidget._params.dataKey,
    };
  }

  @override
  Type get widgetType => ListViewWidget;
}

class ListViewWidget extends StatefulWidget {
  final ListViewParams _params;
  final BuildContext _buildContext;

  ListViewWidget(this._params, this._buildContext);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState(_params);
}

class _ListViewWidgetState extends State<ListViewWidget> {
  ListViewParams _params;
  List<Widget?> _items = [];

  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  //If there are no more items, it should not try to load more data while scroll
  //to bottom.
  bool loadCompleted = false;

  _ListViewWidgetState(this._params) {
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
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isPerformingRequest ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: _params.scrollDirection ?? Axis.vertical,
      reverse: _params.reverse ?? false,
      shrinkWrap: _params.shrinkWrap ?? false,
      cacheExtent: _params.cacheExtent,
      padding: _params.padding,
      itemCount: loadCompleted ? _items.length : _items.length + 1,
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return _buildProgressIndicator();
        } else {
          return _items[index]!;
        }
      },
      controller: _scrollController,
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

class ListViewParams {
  Axis? scrollDirection;
  bool? reverse;
  bool? shrinkWrap;
  double? cacheExtent;
  EdgeInsetsGeometry? padding;
  double? itemExtent;
  List<Widget?>? children;

  /// use to data binding
  String? dataKey;

  /// use to data binding
  Widget? tempChild;

  int? pageSize;
  String? loadMoreUrl;

  //use for demo, if true, it will do the fake request.
  bool? isDemo;

  ListViewParams(
      {this.scrollDirection,
      this.reverse,
      this.shrinkWrap,
      this.cacheExtent,
      this.padding,
      this.itemExtent,
      this.children,
      this.pageSize,
      this.loadMoreUrl,
      this.isDemo,
      this.tempChild,
      this.dataKey}) {
    // assert(this.children != null || this.tempChild != null,
    //     "you must set one of [children] or [tempChild]");
    // if (this.tempChild != null) {
    //   assert(this.dataKey != null && this.children == null,
    //       "you must set [dataKey] and [children] not to set");
    // }
    // if (this.children != null) {
    //   assert(this.dataKey == null && this.tempChild == null,
    //       "do not set any dataKey and tempChild");
    // }
  }
}
