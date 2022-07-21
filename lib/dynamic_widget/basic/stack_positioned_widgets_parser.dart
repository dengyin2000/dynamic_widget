import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class PositionedWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
    typeAssertionDriver(map: map, attribute: 'top', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'right', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'bottom', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'left', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'width', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'height', expectedType: TYPE_DOUBLE);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return Positioned(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener)!,
      top: map.containsKey("top") ? map["top"]?.toDouble() : null,
      right: map.containsKey("right") ? map["right"]?.toDouble() : null,
      bottom: map.containsKey("bottom") ? map["bottom"]?.toDouble() : null,
      left: map.containsKey("left") ? map["left"]?.toDouble() : null,
      width: map.containsKey("width") ? map["width"]?.toDouble() : null,
      height: map.containsKey("height") ? map["height"]?.toDouble() : null,
    );
  }

  @override
  String get widgetName => "Positioned";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Positioned;
    return <String, dynamic>{
      "type": "Positioned",
      "top": realWidget.top ?? null,
      "right": realWidget.right ?? null,
      "bottom": realWidget.bottom ?? null,
      "left": realWidget.left ?? null,
      "width": realWidget.width ?? null,
      "height": realWidget.height ?? null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Positioned;
}

class StackWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: "alignment", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "textDirection", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "fit", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "clipBehavior", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "children", expectedType: TYPE_LIST);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return Stack(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])!
          : AlignmentDirectional.topStart,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      fit: map.containsKey("fit") ? parseStackFit(map["fit"])! : StackFit.loose,
      clipBehavior: map.containsKey("clipBehavior")
          ? parseClip(map["clipBehavior"])!
          : Clip.hardEdge,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Stack";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Stack;
    return <String, dynamic>{
      "type": "Stack",
      "alignment": realWidget.alignment is AlignmentDirectional
          ? exportAlignmentDirectional(
              realWidget.alignment as AlignmentDirectional)
          : exportAlignment(realWidget.alignment as Alignment),
      "textDirection": exportTextDirection(realWidget.textDirection),
      "fit": exportStackFit(realWidget.fit),
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext)
    };
  }

  @override
  Type get widgetType => Stack;
}
