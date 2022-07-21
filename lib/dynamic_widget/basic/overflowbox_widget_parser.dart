import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/cupertino.dart';

import '../../new_widget_parser.dart';

class OverflowBoxWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'alignment', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'minWidth', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'maxWidth', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'minHeight', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'maxHeight', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
  }

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    OverflowBox realWidget = widget as OverflowBox;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": exportAlignment(realWidget.alignment as Alignment?),
      "minWidth": realWidget.minWidth,
      "maxWidth": realWidget.maxWidth,
      "minHeight": realWidget.minHeight,
      "maxHeight": realWidget.maxHeight,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return OverflowBox(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])!
          : Alignment.center,
      minWidth: map.containsKey("minWidth") ? map['minWidth'] : null,
      maxWidth: map.containsKey("maxWidth") ? map['maxWidth'] : null,
      minHeight: map.containsKey("minHeight") ? map['minHeight'] : null,
      maxHeight: map.containsKey("maxHeight") ? map['maxHeight'] : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "OverflowBox";

  @override
  Type get widgetType => OverflowBox;
}
