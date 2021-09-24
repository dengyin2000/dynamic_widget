import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LimitedBoxWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    LimitedBox realWidget = widget as LimitedBox;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": widgetName,
      "maxWidth": realWidget.maxWidth == double.infinity
          ? infinity
          : realWidget.maxWidth / sw,
      "maxHeight": realWidget.maxHeight == double.infinity
          ? infinity
          : realWidget.maxHeight / sw,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return LimitedBox(
      maxWidth:
          map.containsKey("maxWidth") ? map['maxWidth']?.w : double.infinity,
      maxHeight:
          map.containsKey("maxHeight") ? map['maxHeight']?.w : double.infinity,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "LimitedBox";

  @override
  Type get widgetType => LimitedBox;
}
