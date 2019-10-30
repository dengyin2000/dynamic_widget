import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class RowWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Row" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
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
          map['children'], buildContext, widgetParserCompanion),
    );
  }
}

class ColumnWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Column" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
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
          map['children'], buildContext, widgetParserCompanion),
    );
  }
}
