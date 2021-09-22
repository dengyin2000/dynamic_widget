import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils.dart';

class DividerWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    Divider realWidget = widget as Divider;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": widgetName,
      "height": realWidget.height != null ? realWidget.height! / sw : 0.0,
      "thickness":
          realWidget.thickness != null ? realWidget.thickness! / sw : 0.0,
      "indent": realWidget.indent != null ? realWidget.indent! / sw : 0.0,
      "endIndent":
          realWidget.endIndent != null ? realWidget.endIndent! / sw : 0.0,
      "color": realWidget.color != null
          ? realWidget.color!.value.toRadixString(16)
          : null,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Divider(
      height: map["height"] != null ? (map['height'] as double).w : 0,
      thickness: map["thickness"] != null ? (map['thickness'] as double).w : 0,
      indent: map["indent"] != null ? (map['indent'] as double).w : 0,
      endIndent: map["endIndent"] != null ? (map['endIndent'] as double).w : 0,
      color: parseHexColor(map['color']),
    );
  }

  @override
  String get widgetName => "Divider";

  @override
  Type get widgetType => Divider;
}
