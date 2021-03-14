import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class PaddingWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Padding(
      padding: map.containsKey("padding")
          ? parseEdgeInsetsGeometry(map["padding"])!
          : EdgeInsets.zero,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Padding";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Padding;
    var padding = realWidget.padding as EdgeInsets;
    return <String, dynamic>{
      "type": widgetName,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Padding;
}
