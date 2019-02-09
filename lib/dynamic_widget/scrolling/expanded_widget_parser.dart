

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ExpandedWidgetParser extends WidgetParser{
  @override
  bool forWidget(String widgetName) {
    return "Expanded" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map) {
    return Expanded(
      child: DynamicWidgetBuilder.buildFromMap(map["child"]),
      flex: map.containsKey("flex") ? map["flex"] : 1,
    );
  }

}