import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

import '../../new_widget_parser.dart';

class InkwellWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'splashColor', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'child', expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";
    try {
      var inkwell = InkWell(
        splashColor: map.containsKey('splashColor')
            ? parseHexColor(map['splashColor'])
            : null,
        child: DynamicWidgetBuilder.buildFromMap(
            map['child'], buildContext, listener),
        onTap: () {
          listener!.clickListener!.onClicked(clickEvent);
        },
      );

      return inkwell;
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "Inkwell";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as InkWell;

    return <String, dynamic>{
      "type": widgetName,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => InkWell;
}
