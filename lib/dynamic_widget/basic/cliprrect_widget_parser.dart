import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class ClipRRectWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'borderRadius', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'clipBehavior', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    var radius = map['borderRadius'].toString().split(",");
    double topLeft = double.parse(radius[0]);
    double topRight = double.parse(radius[1]);
    double bottomLeft = double.parse(radius[2]);
    double bottomRight = double.parse(radius[3]);
    var clipBehaviorString = map['clipBehavior'];
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight)),
      clipBehavior: parseClipBehavior(clipBehaviorString),
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ClipRRect";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ClipRRect;
    var borderRadius = realWidget.borderRadius!;
    return <String, dynamic>{
      "type": widgetName,
      "borderRadius":
          "${borderRadius.topLeft.x},${borderRadius.topRight.x},${borderRadius.bottomLeft.x},${borderRadius.bottomRight.x}",
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => ClipRRect;
}
