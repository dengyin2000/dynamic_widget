import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class BaselineWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Baseline(
      baseline: map["baseline"]?.toDouble(),
      baselineType: map["baselineType"] == "alphabetic"
          ? TextBaseline.alphabetic
          : TextBaseline.ideographic,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Baseline";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Baseline;
    return <String, dynamic>{
      "type": widgetName,
      "baseline": realWidget.baseline,
      "baselineType": realWidget.baselineType == TextBaseline.alphabetic
          ? "alphabetic"
          : "ideographic",
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Baseline;
}
