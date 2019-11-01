import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class AlignWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Align" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Align(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])
          : Alignment.center,
      widthFactor: map.containsKey("widthFactor") ? map["widthFactor"] : null,
      heightFactor:
          map.containsKey("heightFactor") ? map["heightFactor"] : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, widgetParserCompanion),
    );
  }
}
