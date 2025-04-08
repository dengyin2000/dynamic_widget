import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SvgPictureWidgetParser extends WidgetParser {
  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    final String assetName = map['assetName'];
    final String? package = map.containsKey('package') ? map['package'] : null;
    final bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    final double? width =
        map.containsKey('width') ? map['width']?.toDouble() : null;
    final double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    final BoxFit? fit = map.containsKey('fit') ? parseBoxFit(map['fit']) : null;
    final AlignmentGeometry alignment = map.containsKey('alignment')
        ? parseAlignmentGeometry(map['alignment'])!
        : Alignment.center;
    final bool allowDrawingOutsideViewBox =
        map.containsKey('allowDrawingOutsideViewBox')
            ? map['allowDrawingOutsideViewBox']
            : false;
    final String? semanticsLabel =
        map.containsKey('semanticsLabel') ? map['semanticsLabel'] : null;
    final bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    final Clip? clipBehavior = map.containsKey('clipBehavior')
        ? parseClipBehavior(map['clipBehavior'])
        : null;

    final String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    final widget = SvgPicture.asset(
      assetName,
      package: package,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
    );

    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent);
        },
        child: widget,
      );
    }
    return widget;
  }

  @override
  String get widgetName => "AssetSvgPicture";

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as SvgPicture;
    final AssetBytesLoader loader = realWidget.bytesLoader as AssetBytesLoader;
    return <String, dynamic>{
      "type": widgetName,
      "assetName": loader.assetName,
      "package": loader.packageName,
      "matchTextDirection": realWidget.matchTextDirection,
      "width": realWidget.width,
      "height": realWidget.height,
      "fit": exportBoxFit(realWidget.fit),
      "alignment": exportAlignment(realWidget.alignment),
      "allowDrawingOutsideViewBox": realWidget.allowDrawingOutsideViewBox,
      "semanticsLabel": realWidget.semanticsLabel,
      "excludeFromSemantics": realWidget.excludeFromSemantics,
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
    };
  }

  @override
  Type get widgetType => AssetBytesLoader;

  @override
  bool matchWidgetForExport(Widget? widget) {
    if (widget is SvgPicture && widget.bytesLoader is AssetBytesLoader) {
      return true;
    }
    return false;
  }
}

class NetworkSvgPictureWidgetParser extends WidgetParser {
  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    final String url = map['url'];
    final Map<String, String>? headers =
        map.containsKey('headers') ? map['headers'] : false;
    final bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    final double? width =
        map.containsKey('width') ? map['width']?.toDouble() : null;
    final double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    final BoxFit? fit = map.containsKey('fit') ? parseBoxFit(map['fit']) : null;
    final AlignmentGeometry alignment = map.containsKey('alignment')
        ? parseAlignmentGeometry(map['alignment'])!
        : Alignment.center;
    final bool allowDrawingOutsideViewBox =
        map.containsKey('allowDrawingOutsideViewBox')
            ? map['allowDrawingOutsideViewBox']
            : false;
    final String? semanticsLabel =
        map.containsKey('semanticsLabel') ? map['semanticsLabel'] : null;
    final bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    final Clip? clipBehavior = map.containsKey('clipBehavior')
        ? parseClipBehavior(map['clipBehavior'])
        : null;

    final String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    final widget = SvgPicture.network(
      url,
      headers: headers,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior ?? Clip.hardEdge,
    );

    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent);
        },
        child: widget,
      );
    }
    return widget;
  }

  @override
  String get widgetName => "NetworkSvgPicture";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as SvgPicture;
    final NetworkBytesLoader loader =
        realWidget.bytesLoader as NetworkBytesLoader;
    return <String, dynamic>{
      "type": widgetName,
      "url": loader.url,
      "headers": loader.headers,
      "matchTextDirection": realWidget.matchTextDirection,
      "width": realWidget.width,
      "height": realWidget.height,
      "fit": exportBoxFit(realWidget.fit),
      "alignment": exportAlignment(realWidget.alignment),
      "allowDrawingOutsideViewBox": realWidget.allowDrawingOutsideViewBox,
      "semanticsLabel": realWidget.semanticsLabel,
      "excludeFromSemantics": realWidget.excludeFromSemantics,
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
    };
  }

  @override
  Type get widgetType => NetworkBytesLoader;

  @override
  bool matchWidgetForExport(Widget? widget) {
    if (widget is SvgPicture) {
      if (widget.bytesLoader is NetworkBytesLoader) {
        return true;
      }
    }
    return false;
  }
}
