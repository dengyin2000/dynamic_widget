import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceholderWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Placeholder(
      color: map.containsKey('color')
          ? parseHexColor(map['color'])!
          : const Color(0xFF455A64),
      strokeWidth: map.containsKey('strokeWidth')
          ? (map['strokeWidth'] as double).w
          : 2.0,
      fallbackWidth: map.containsKey('fallbackWidth')
          ? (map['fallbackWidth'] as double).w
          : 400.0,
      fallbackHeight: map.containsKey('fallbackHeight')
          ? map['fallbackHeight']?.toDouble()?.w
          : 400.0,
    );
  }

  @override
  String get widgetName => "Placeholder";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Placeholder;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : "0xFF455A64",
      "strokeWidth": realWidget.strokeWidth / sw,
      "fallbackWidth": realWidget.fallbackWidth / sw,
      "fallbackHeight": realWidget.fallbackHeight / sw
    };
  }

  @override
  Type get widgetType => Placeholder;
}
