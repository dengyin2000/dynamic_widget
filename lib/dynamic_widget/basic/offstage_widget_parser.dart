import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/cupertino.dart';

import '../utils.dart';

class OffstageWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    Offstage realWidget = widget as Offstage;
    return <String, dynamic>{
      "type": widgetName,
      "offstage": realWidget.offstage,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Offstage(
      offstage: toBool(map['offstage'], true),
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Offstage";

  @override
  Type get widgetType => Offstage;
}
