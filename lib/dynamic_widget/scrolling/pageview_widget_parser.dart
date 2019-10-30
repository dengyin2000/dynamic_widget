import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';


class PageViewWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "PageView" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    var scrollDirection = Axis.horizontal;
    if (map.containsKey("scrollDirection")) {
      scrollDirection = map["scrollDirection"];
    }
    return PageView(
      scrollDirection: scrollDirection,
      reverse: map.containsKey("reverse") ? map["reverse"] : false,
      pageSnapping:
          map.containsKey("pageSnapping") ? map["pageSnapping"] : true,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, widgetParserCompanion),
    );
  }
}
