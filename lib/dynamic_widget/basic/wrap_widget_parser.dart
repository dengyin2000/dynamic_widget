import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../assertions/assert_constants.dart';
import '../../new_widget_parser.dart';

class WrapWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'direction', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'alignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'spacing', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'runAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'runSpacing', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'crossAxisAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'verticalDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'children', expectedType: TYPE_LIST);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return Wrap(
      direction: map.containsKey("direction")
          ? parseAxis(map["direction"])
          : Axis.horizontal,
      alignment: map.containsKey("alignment")
          ? parseWrapAlignment(map["alignment"])
          : WrapAlignment.start,
      spacing: map.containsKey("spacing") ? map["spacing"]?.toDouble() : 0.0,
      runAlignment: map.containsKey("runAlignment")
          ? parseWrapAlignment(map["runAlignment"])
          : WrapAlignment.start,
      runSpacing:
          map.containsKey("runSpacing") ? map["runSpacing"]?.toDouble() : 0.0,
      crossAxisAlignment: map.containsKey("crossAxisAlignment")
          ? parseWrapCrossAlignment(map["crossAxisAlignment"])
          : WrapCrossAlignment.start,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      verticalDirection: map.containsKey("verticalDirection")
          ? parseVerticalDirection(map["verticalDirection"])
          : VerticalDirection.down,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Wrap";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Wrap;
    return <String, dynamic>{
      "type": "Wrap",
      "direction":
          realWidget.direction == Axis.horizontal ? "horizontal" : "vertical",
      "alignment": exportWrapAlignment(realWidget.alignment),
      "spacing": realWidget.spacing,
      "runAlignment": exportWrapAlignment(realWidget.runAlignment),
      "runSpacing": realWidget.runSpacing,
      "crossAxisAlignment":
          exportWrapCrossAlignment(realWidget.crossAxisAlignment),
      "textDirection": realWidget.textDirection != null
          ? exportTextDirection(realWidget.textDirection)
          : null,
      "verticalDirection":
          realWidget.verticalDirection == VerticalDirection.up ? "up" : "down",
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext)
    };
  }

  @override
  Type get widgetType => Wrap;
}
