import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class ContainerWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Container" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    Alignment alignment = parseAlignment(map['alignment']);
    Color color = parseHexColor(map['color']);
    BoxConstraints constraints = parseBoxConstraints(map['constraints']);
    //TODO: decoration, foregroundDecoration and transform properties to be implemented.
    EdgeInsetsGeometry margin = parseEdgeInsetsGeometry(map['margin']);
    EdgeInsetsGeometry padding = parseEdgeInsetsGeometry(map['padding']);
    Map<String, dynamic> childMap = map['child'];
    Widget child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, widgetParserCompanion);

    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var containerWidget = Container(
      alignment: alignment,
      padding: padding,
      color: color,
      margin: margin,
      width: map['width'],
      height: map['height'],
      constraints: constraints,
      child: child,
    );

    if (widgetParserCompanion.clickListener != null && clickEvent != null) {
      return GestureDetector(
        onTap: () {
          widgetParserCompanion.clickListener.onClicked(clickEvent);
        },
        child: containerWidget,
      );
    } else {
      return containerWidget;
    }
  }
}
