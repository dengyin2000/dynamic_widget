
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class GridViewWidgetParser extends WidgetParser{
  @override
  bool forWidget(String widgetName) {
    return "GridView" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, ClickListener listener){
    var scrollDirection = Axis.vertical;
    if (map.containsKey("scrollDirection") && "horizontal" == map[""]) {
      scrollDirection = Axis.horizontal;
    }
    return GridView.count(
      crossAxisCount: map['crossAxisCount'],
      scrollDirection: scrollDirection,
      reverse: map.containsKey("reverse")?map['reverse']:false,
      shrinkWrap: map.containsKey("shrinkWrap") ? map["shrinkWrap"]: false,
      cacheExtent: map.containsKey("cacheExtent") ? map["cacheExtent"] : 0.0,
      padding: map.containsKey('padding')?parseEdgeInsetsGeometry(map['padding']) : null,
      mainAxisSpacing: map.containsKey('mainAxisSpacing') ? map['mainAxisSpacing']:0.0,
      crossAxisSpacing: map.containsKey('crossAxisSpacing') ? map['crossAxisSpacing']:0.0,
      childAspectRatio: map.containsKey('childAspectRatio') ? map['childAspectRatio']:1.0,
      children: DynamicWidgetBuilder.buildWidgets(map['children'], listener),
    );
  }

}