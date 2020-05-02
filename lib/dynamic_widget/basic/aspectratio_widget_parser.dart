import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class AspectRatioWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    return AspectRatio(
      aspectRatio: map["aspectRatio"],
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "AspectRatio";
}
