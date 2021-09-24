import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';

class ClipRRectWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    // var radius = map['borderRadius'].toString().split(",");
    // double topLeft = double.parse(radius[0]);
    // double topRight = double.parse(radius[1]);
    // double bottomLeft = double.parse(radius[2]);
    // double bottomRight = double.parse(radius[3]);
    var clipBehaviorString = map['clipBehavior'];
    return ClipRRect(
      borderRadius: parseBorderRadius(map['borderRadius']),
      clipBehavior: parseClipBehavior(clipBehaviorString),
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ClipRRect";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ClipRRect;
    var borderRadius = realWidget.borderRadius!;
    return <String, dynamic>{
      "type": widgetName,
      "borderRadius": exportBorderRadius(borderRadius),
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => ClipRRect;
}
