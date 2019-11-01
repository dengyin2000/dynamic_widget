import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class CenterWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Center" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Center(
      widthFactor: map.containsKey("widthFactor") ? map["widthFactor"] : null,
      heightFactor:
          map.containsKey("heightFactor") ? map["heightFactor"] : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, widgetParserCompanion),
    );
  }
}
