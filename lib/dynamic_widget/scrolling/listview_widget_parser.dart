
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ListViewWidgetParser extends WidgetParser{
  @override
  bool forWidget(String widgetName) {
    return "ListView" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map) {
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") && "horizontal" == map[""]) {
      scrollDirection = Axis.horizontal;
    }
    return ListView(
      scrollDirection: scrollDirection,
      reverse: map.containsKey("reverse")?map['reverse']:false,
      shrinkWrap: map.containsKey("shrinkWrap") ? map["shrinkWrap"]: false,
      cacheExtent: map.containsKey("cacheExtent") ? map["cacheExtent"] : 0.0,
      padding: map.containsKey('padding')?parseEdgeInsetsGeometry(map['padding']) : null,
      itemExtent:map.containsKey("itemExtent") ? map["itemExtent"] : null,
      children: DynamicWidgetBuilder.buildWidgets(map['children']),
    );
  }

}