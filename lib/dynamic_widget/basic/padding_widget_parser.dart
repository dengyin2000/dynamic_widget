import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class PaddingWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Padding" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Padding(
      padding: map.containsKey("padding")
          ? parseEdgeInsetsGeometry(map["padding"])
          : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, widgetParserCompanion),
    );
  }
}
