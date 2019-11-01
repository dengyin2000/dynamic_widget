import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class IndexedStackWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "IndexedStack" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return IndexedStack(
      index: map.containsKey("index") ? map["index"] : 0,
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])
          : AlignmentDirectional.topStart,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, widgetParserCompanion),
    );
  }
}
