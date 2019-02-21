
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FittedBoxWidgetParser extends WidgetParser{
  @override
  bool forWidget(String widgetName) {
    return "FittedBox" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, ClickListener listener){
    return FittedBox(
      alignment: map.containsKey("alignment") ? parseAlignment(map["alignment"]) : Alignment.center,
      fit: map.containsKey("fit") ? parseBoxFit(map["fit"]) : BoxFit.contain,
      child: DynamicWidgetBuilder.buildFromMap(map["child"], listener),
    );
  }

}