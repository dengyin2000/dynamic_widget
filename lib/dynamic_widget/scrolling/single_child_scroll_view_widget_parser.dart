import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class SingleChildScrollViewParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SingleChildScrollView;
    String scrollDirection = "vertical";
    if (realWidget.scrollDirection == Axis.horizontal) {
      scrollDirection = "horizontal";
    }

    var padding = realWidget.padding as EdgeInsets?;

    return <String, dynamic>{
      "type": widgetName,
      "scrollDirection": scrollDirection,
      "reverse": realWidget.reverse,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") &&
        "horizontal" == map["scrollDirection"]) {
      scrollDirection = Axis.horizontal;
    }

    var clipBehaviorString = map['clipBehavior'];
    return SingleChildScrollView(
      reverse: toBool(map['reverse'], false),
      clipBehavior: parseClipBehavior(clipBehaviorString),
      padding: map.containsKey("padding")
          ? parseEdgeInsetsGeometry(map["padding"])!
          : EdgeInsets.zero,
      scrollDirection: scrollDirection,
      child: DynamicWidgetBuilder.buildFromMap(
        map['child'],
        buildContext,
        listener,
      ),
    );
  }

  @override
  String get widgetName => "SingleChildScrollView";

  @override
  Type get widgetType => SingleChildScrollView;
}
