import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:dynamic_widget/dynamic_widget/icons_helper.dart';
import 'package:flutter/material.dart';

class IconWidgetParser extends WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Icon" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    return Icon(
      map.containsKey('data') ? getIconUsingPrefix(name: map['data']) : Icons.android,
      size: map.containsKey("size") ? map['size'] : null,
      color: map.containsKey('color') ? parseHexColor(map['color']) : null,
      semanticLabel: map.containsKey('semanticLabel') ? map['semanticLabel'] : null,
      textDirection: map.containsKey('textDirection') ? parseTextDirection(map['textDirection']) : null,
    );
  }
}
