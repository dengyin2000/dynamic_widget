import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverflowBoxWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    OverflowBox realWidget = widget as OverflowBox;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": exportAlignment(realWidget.alignment as Alignment?),
      "minWidth": realWidget.minWidth != null ? realWidget.minWidth! / sw : 0.0,
      "maxWidth": realWidget.maxWidth != null ? realWidget.maxWidth! / sw : 0.0,
      "minHeight":
          realWidget.minHeight != null ? realWidget.minHeight! / sw : 0.0,
      "maxHeight":
          realWidget.maxHeight != null ? realWidget.maxHeight! / sw : 0.0,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return OverflowBox(
      alignment: parseAlignment(map['alignment']),
      minWidth: map["minWidth"] != null ? (map['minWidth'] as double).w : null,
      maxWidth:
          map.containsKey("maxWidth") ? (map['maxWidth'] as double).w : null,
      minHeight:
          map.containsKey("minHeight") ? (map['minHeight'] as double).w : null,
      maxHeight:
          map.containsKey("maxHeight") ? (map['maxHeight'] as double).w : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "OverflowBox";

  @override
  Type get widgetType => OverflowBox;
}
