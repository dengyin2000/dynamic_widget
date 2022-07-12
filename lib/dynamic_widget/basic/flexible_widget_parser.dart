import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class FlexibleWidgetParser extends NewWidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    Map<String, dynamic>? childMap = map['child'];
    Widget? child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    var flexibleWidget = Flexible(
      child: child ?? SizedBox.shrink(),
      fit: parseFlexFit(map['fit']),
    );

    return flexibleWidget;
  }

  @override
  String get widgetName => "Flexible";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Flexible;
    return <String, dynamic>{
      "type": widgetName,
      "flex": realWidget.flex,
      "fit": exportFlexFit(realWidget.fit),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Flexible;
}
