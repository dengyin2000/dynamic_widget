import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class SafeAreaWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'left', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'right', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'top', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'bottom', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'minimum', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'maintainBottomViewPadding', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    var left = map.containsKey("left") ? map["left"] : true;
    var right = map.containsKey("right") ? map["right"] : true;
    var top = map.containsKey("top") ? map["top"] : true;
    var bottom = map.containsKey("bottom") ? map["bottom"] : true;
    var edgeInsets = map.containsKey("minimum")
        ? parseEdgeInsetsGeometry(map['minimum'])!
        : EdgeInsets.zero;
    var maintainBottomViewPadding = map.containsKey("maintainBottomViewPadding")
        ? map["maintainBottomViewPadding"]
        : false;
    return SafeArea(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      minimum: edgeInsets as EdgeInsets,
      maintainBottomViewPadding: maintainBottomViewPadding,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener)!,
    );
  }

  @override
  String get widgetName => "SafeArea";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SafeArea;
    var minimum = realWidget.minimum;
    return <String, dynamic>{
      "type": "SafeArea",
      "left": realWidget.left,
      "right": realWidget.right,
      "top": realWidget.top,
      "bottom": realWidget.bottom,
      "minimum": minimum != null
          ? "${minimum.left},${minimum.top},${minimum.right},${minimum.bottom}"
          : null,
      "maintainBottomViewPadding": realWidget.maintainBottomViewPadding,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SafeArea;
}
