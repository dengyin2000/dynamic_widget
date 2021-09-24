import 'dart:ui';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetImageWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String name = map['name'];
    String? semanticLabel =
        map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    double? scale = map.containsKey("scale") ? map['scale']?.toDouble() : null;
    double? width = map.containsKey('width') ? map['width']?.toDouble() : null;
    double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    Color? color =
        map.containsKey('color') ? parseHexColor(map['color']) : null;
    BlendMode? blendMode =
        map.containsKey('blendMode') ? parseBlendMode(map['blendMode']) : null;
    BoxFit? boxFit =
        map.containsKey('boxFit') ? parseBoxFit(map['boxFit']) : null;
    Alignment alignment = map.containsKey('alignment')
        ? parseAlignment(map['alignment'])
        : Alignment.center;
    ImageRepeat repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])!
        : ImageRepeat.noRepeat;
    Rect? centerSlice =
        map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    bool gaplessPlayback =
        map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    FilterQuality filterQuality = map.containsKey('filterQuality')
        ? parseFilterQuality(map['filterQuality'])!
        : FilterQuality.low;

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var widget = Image.asset(
      name,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width?.w,
      height: height?.w,
      color: color,
      colorBlendMode: blendMode,
      fit: boxFit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
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
  String get widgetName => "AssetImage";

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    if (_isMatchAssetImageType(widget)) {
      var realWidget = widget as Image;
      late AssetImage assetImage;
      if (realWidget.image is AssetImage) {
        assetImage = realWidget.image as AssetImage;
      } else if (realWidget.image is ResizeImage) {
        var t = realWidget.image as ResizeImage;
        assetImage = t.imageProvider as AssetImage;
      }
      final sw = ScreenUtil().scaleWidth;
      return <String, dynamic>{
        "type": widgetName,
        "name": assetImage.assetName,
        "semanticLabel": realWidget.semanticLabel,
        "width": realWidget.width != null ? realWidget.width! / sw : 0,
        "height": realWidget.height != null ? realWidget.height! / sw : 0,
        "color": realWidget.color != null
            ? realWidget.color!.value.toRadixString(16)
            : null,
        "colorBlendMode": realWidget.colorBlendMode != null
            ? exportBlendMode(realWidget.colorBlendMode)
            : null,
        "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
        "alignment": realWidget.alignment != null
            ? exportAlignment(realWidget.alignment as Alignment?)
            : null,
        "repeat": realWidget.repeat != null
            ? exportImageRepeat(realWidget.repeat)
            : null,
        "centerSlice": realWidget.centerSlice != null
            ? exportRect(realWidget.centerSlice!)
            : null,
        "matchTextDirection": realWidget.matchTextDirection,
        "gaplessPlayback": realWidget.gaplessPlayback,
        "filterQuality": realWidget.filterQuality != null
            ? exportFilterQuality(realWidget.filterQuality)
            : null
      };
    }

    if (_isMatchExactAssetImageType(widget)) {
      var realWidget = widget as Image;
      late ExactAssetImage exactAssetImage;
      if (realWidget.image is ExactAssetImage) {
        exactAssetImage = realWidget.image as ExactAssetImage;
      } else if (realWidget.image is ResizeImage) {
        var t = realWidget.image as ResizeImage;
        exactAssetImage = t.imageProvider as ExactAssetImage;
      }
      return <String, dynamic>{
        "type": widgetName,
        "name": exactAssetImage.assetName,
        "semanticLabel": realWidget.semanticLabel,
        "scale": exactAssetImage.scale,
        "width": realWidget.width,
        "height": realWidget.height,
        "color": realWidget.color != null
            ? realWidget.color!.value.toRadixString(16)
            : null,
        "colorBlendMode": realWidget.colorBlendMode != null
            ? exportBlendMode(realWidget.colorBlendMode)
            : null,
        "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
        "alignment": realWidget.alignment != null
            ? exportAlignment(realWidget.alignment as Alignment?)
            : null,
        "repeat": realWidget.repeat != null
            ? exportImageRepeat(realWidget.repeat)
            : null,
        "centerSlice": realWidget.centerSlice != null
            ? exportRect(realWidget.centerSlice!)
            : null,
        "matchTextDirection": realWidget.matchTextDirection,
        "gaplessPlayback": realWidget.gaplessPlayback,
        "filterQuality": realWidget.filterQuality != null
            ? exportFilterQuality(realWidget.filterQuality)
            : null
      };
    }

    return null;
  }

  @override
  Type get widgetType => AssetImage;

  bool _isMatchAssetImageType(Widget? widget) {
    if (widget is Image) {
      if (widget.image is AssetImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var resizeImage = widget.image as ResizeImage;
        return resizeImage.imageProvider is AssetImage;
      }
    }
    return false;
  }

  bool _isMatchExactAssetImageType(Widget? widget) {
    if (widget is Image) {
      if (widget.image is ExactAssetImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var resizeImage = widget.image as ResizeImage;
        return resizeImage.imageProvider is ExactAssetImage;
      }
    }
    return false;
  }

  @override
  bool matchWidgetForExport(Widget? widget) =>
      _isMatchAssetImageType(widget) || _isMatchExactAssetImageType(widget);
}

class NetworkImageWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String src = map['src'];
    String? semanticLabel =
        map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    bool excludeFromSemantics = map.containsKey('excludeFromSemantics')
        ? map['excludeFromSemantics']
        : false;
    double scale = map.containsKey("scale") ? map['scale']?.toDouble() : 1.0;
    double? width = map.containsKey('width') ? map['width']?.toDouble() : null;
    double? height =
        map.containsKey('height') ? map['height']?.toDouble() : null;
    Color? color =
        map.containsKey('color') ? parseHexColor(map['color']) : null;
    BlendMode? blendMode =
        map.containsKey('blendMode') ? parseBlendMode(map['blendMode']) : null;
    BoxFit? boxFit =
        map.containsKey('boxFit') ? parseBoxFit(map['boxFit']) : null;
    Alignment alignment = map.containsKey('alignment')
        ? parseAlignment(map['alignment'])
        : Alignment.center;
    ImageRepeat repeat = map.containsKey('repeat')
        ? parseImageRepeat(map['repeat'])!
        : ImageRepeat.noRepeat;
    Rect? centerSlice =
        map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection')
        ? map['matchTextDirection']
        : false;
    bool gaplessPlayback =
        map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    FilterQuality filterQuality = map.containsKey('filterQuality')
        ? parseFilterQuality(map['filterQuality'])!
        : FilterQuality.low;

    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var widget = Image.network(
      src,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width?.w,
      height: height?.w,
      color: color,
      colorBlendMode: blendMode,
      fit: boxFit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
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
  String get widgetName => "NetworkImage";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Image;
    late NetworkImage networkImage;
    if (realWidget.image is NetworkImage) {
      networkImage = realWidget.image as NetworkImage;
    } else if (realWidget.image is ResizeImage) {
      var t = realWidget.image as ResizeImage;
      networkImage = t.imageProvider as NetworkImage;
    }
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": widgetName,
      "src": networkImage.url,
      "semanticLabel": realWidget.semanticLabel,
      "width": realWidget.width != null ? realWidget.width! / sw : 0,
      "height": realWidget.height != null ? realWidget.height! / sw : 0,
      "color": realWidget.color != null
          ? realWidget.color!.value.toRadixString(16)
          : null,
      "colorBlendMode": realWidget.colorBlendMode != null
          ? exportBlendMode(realWidget.colorBlendMode)
          : null,
      "fit": realWidget.fit != null ? exportBoxFit(realWidget.fit) : null,
      "alignment": realWidget.alignment != null
          ? exportAlignment(realWidget.alignment as Alignment?)
          : null,
      "repeat": realWidget.repeat != null
          ? exportImageRepeat(realWidget.repeat)
          : null,
      "centerSlice": realWidget.centerSlice != null
          ? exportRect(realWidget.centerSlice!)
          : null,
      "matchTextDirection": realWidget.matchTextDirection,
      "gaplessPlayback": realWidget.gaplessPlayback,
      "filterQuality": realWidget.filterQuality != null
          ? exportFilterQuality(realWidget.filterQuality)
          : null
    };
  }

  @override
  Type get widgetType => NetworkImage;

  @override
  bool matchWidgetForExport(Widget? widget) {
    if (widget is Image) {
      if (widget.image is NetworkImage) {
        return true;
      }
      if (widget.image is ResizeImage) {
        var t = widget.image as ResizeImage;
        return t.imageProvider is NetworkImage;
      }
    }
    return false;
  }
}
