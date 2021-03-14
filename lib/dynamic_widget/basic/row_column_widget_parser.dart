import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class RowWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {

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

class ColumnWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {

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
