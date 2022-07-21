import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class RowWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'crossAxisAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'mainAxisAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'mainAxisSize', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textBaseline', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'verticalDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'children', expectedType: TYPE_LIST);
  }


  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    try {
      return Row(
        crossAxisAlignment: map.containsKey('crossAxisAlignment')
            ? parseCrossAxisAlignment(map['crossAxisAlignment'])
            : CrossAxisAlignment.center,
        mainAxisAlignment: map.containsKey('mainAxisAlignment')
            ? parseMainAxisAlignment(map['mainAxisAlignment'])
            : MainAxisAlignment.start,
        mainAxisSize: map.containsKey('mainAxisSize')
            ? parseMainAxisSize(map['mainAxisSize'])
            : MainAxisSize.max,
        textBaseline: map.containsKey('textBaseline')
            ? parseTextBaseline(map['textBaseline'])
            : null,
        textDirection: map.containsKey('textDirection')
            ? parseTextDirection(map['textDirection'])
            : null,
        verticalDirection: map.containsKey('verticalDirection')
            ? parseVerticalDirection(map['verticalDirection'])
            : VerticalDirection.down,
        children: DynamicWidgetBuilder.buildWidgets(
            map['children'], buildContext, listener),
      );
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "Row";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Row;
    return <String, dynamic>{
      "type": "Row",
      "crossAxisAlignment":
          exportCrossAxisAlignment(realWidget.crossAxisAlignment),
      "mainAxisAlignment":
          exportMainAxisAlignment(realWidget.mainAxisAlignment),
      "mainAxisSize":
          realWidget.mainAxisSize == MainAxisSize.max ? "max" : "min",
      "textBaseline": realWidget.textBaseline == TextBaseline.alphabetic
          ? "alphabetic"
          : "ideographic",
      "textDirection": realWidget.textDirection != null
          ? exportTextDirection(realWidget.textDirection)
          : null,
      "verticalDirection":
          realWidget.verticalDirection == VerticalDirection.down
              ? "down"
              : "up",
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext),
    };
  }

  @override
  Type get widgetType => Row;
}

class ColumnWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'crossAxisAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'mainAxisAlignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'mainAxisSize', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textBaseline', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'verticalDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'children', expectedType: TYPE_LIST);
  }


  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    try {
      return Column(
        crossAxisAlignment: map.containsKey('crossAxisAlignment')
            ? parseCrossAxisAlignment(map['crossAxisAlignment'])
            : CrossAxisAlignment.center,
        mainAxisAlignment: map.containsKey('mainAxisAlignment')
            ? parseMainAxisAlignment(map['mainAxisAlignment'])
            : MainAxisAlignment.start,
        mainAxisSize: map.containsKey('mainAxisSize')
            ? parseMainAxisSize(map['mainAxisSize'])
            : MainAxisSize.max,
        textBaseline: map.containsKey('textBaseline')
            ? parseTextBaseline(map['textBaseline'])
            : null,
        textDirection: map.containsKey('textDirection')
            ? parseTextDirection(map['textDirection'])
            : null,
        verticalDirection: map.containsKey('verticalDirection')
            ? parseVerticalDirection(map['verticalDirection'])
            : VerticalDirection.down,
        children: DynamicWidgetBuilder.buildWidgets(
            map['children'], buildContext, listener),
      );
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "Column";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Column;
    return <String, dynamic>{
      "type": "Column",
      "crossAxisAlignment":
          exportCrossAxisAlignment(realWidget.crossAxisAlignment),
      "mainAxisAlignment":
          exportMainAxisAlignment(realWidget.mainAxisAlignment),
      "mainAxisSize":
          realWidget.mainAxisSize == MainAxisSize.max ? "max" : "min",
      "textBaseline": realWidget.textBaseline == TextBaseline.alphabetic
          ? "alphabetic"
          : "ideographic",
      "textDirection": realWidget.textDirection != null
          ? exportTextDirection(realWidget.textDirection)
          : null,
      "verticalDirection":
          realWidget.verticalDirection == VerticalDirection.down
              ? "down"
              : "up",
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext),
    };
  }

  @override
  Type get widgetType => Column;
}
