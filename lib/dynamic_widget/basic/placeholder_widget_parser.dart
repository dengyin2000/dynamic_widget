import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class PlaceholderWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'color', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'strokeWidth', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'fallbackWidth', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'fallbackHeight', expectedType: TYPE_DOUBLE);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return Placeholder(
      color: map.containsKey('color')
          ? parseHexColor(map['color'])!
          : const Color(0xFF455A64),
      strokeWidth:
          map.containsKey('strokeWidth') ? map['strokeWidth']?.toDouble() : 2.0,
      fallbackWidth: map.containsKey('fallbackWidth')
          ? map['fallbackWidth']?.toDouble()
          : 400.0,
      fallbackHeight: map.containsKey('fallbackHeight')
          ? map['fallbackHeight']?.toDouble()
          : 400.0,
    );
  }

  @override
  String get widgetName => "Placeholder";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Placeholder;
    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : "0xFF455A64",
      "strokeWidth": realWidget.strokeWidth,
      "fallbackWidth": realWidget.fallbackWidth,
      "fallbackHeight": realWidget.fallbackHeight
    };
  }

  @override
  Type get widgetType => Placeholder;
}
