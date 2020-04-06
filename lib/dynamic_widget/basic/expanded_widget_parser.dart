import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class ExpandedWidgetParser extends WidgetParser {

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    return Expanded(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
      flex: map.containsKey("flex") ? map["flex"] : 1,
    );
  }

  @override
  String get widgetName => "Expanded";
}
