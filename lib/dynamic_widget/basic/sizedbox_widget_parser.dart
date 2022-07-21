import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

//Creates a box that will become as large as its parent allows.
class ExpandedSizedBoxWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    // TODO: implement assertionChecks
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    try {
      return SizedBox.expand(
        child: DynamicWidgetBuilder.buildFromMap(
            map["child"], buildContext, listener),
      );
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "ExpandedSizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    throw UnimplementedError();
  }

  /// user SizedBoxWidgetParser for ExpandedSizedBox
  @override
  Type get widgetType => UnimplementedType;
}

class SizedBoxWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'width', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'height', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return SizedBox(
      width: map["width"],
      height: map["height"],
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "SizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox;
    return <String, dynamic>{
      "type": "SizedBox",
      "width": realWidget.width,
      "height": realWidget.height,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SizedBox;
}

class UnimplementedType {}
