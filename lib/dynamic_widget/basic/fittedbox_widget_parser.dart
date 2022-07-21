import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class FittedBoxWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: "alignment", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "fit", expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: "child", expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return FittedBox(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])!
          : Alignment.center,
      fit: map.containsKey("fit") ? parseBoxFit(map["fit"])! : BoxFit.contain,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "FittedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as FittedBox;
    return <String, dynamic>{
      "type": widgetName,
      "alignment": exportAlignment(realWidget.alignment as Alignment?),
      "fit": exportBoxFit(realWidget.fit),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => FittedBox;
}
