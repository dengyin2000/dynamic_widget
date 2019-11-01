import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class PositionedWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Positioned" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Positioned(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, widgetParserCompanion),
      top: map.containsKey("top") ? map["top"] : null,
      right: map.containsKey("right") ? map["right"] : null,
      bottom: map.containsKey("bottom") ? map["bottom"] : null,
      left: map.containsKey("left") ? map["left"] : null,
      width: map.containsKey("width") ? map["width"] : null,
      height: map.containsKey("height") ? map["height"] : null,
    );
  }
}

class StackWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Stack" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    return Stack(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])
          : AlignmentDirectional.topStart,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      fit: map.containsKey("fit") ? parseStackFit(map["fit"]) : StackFit.loose,
      overflow: map.containsKey("overflow")
          ? parseOverflow(map["overflow"])
          : Overflow.clip,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, widgetParserCompanion),
    );
  }
}
