import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class BaselineWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Baseline" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Baseline(
      baseline: map["baseline"],
      baselineType: map["baselineType"] == "alphabetic"
          ? TextBaseline.alphabetic
          : TextBaseline.ideographic,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, widgetParserCompanion),
    );
  }
}
