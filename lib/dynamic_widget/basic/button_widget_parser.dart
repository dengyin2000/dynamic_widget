import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class RaisedButtonParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    var raisedButton = RaisedButton(
      color: map.containsKey('color') ? parseHexColor(map['color']) : null,
      disabledColor: map.containsKey('disabledColor')
          ? parseHexColor(map['disabledColor'])
          : null,
      disabledElevation: map.containsKey('disabledElevation')
          ? map['disabledElevation']?.toDouble()
          : 0.0,
      disabledTextColor: map.containsKey('disabledTextColor')
          ? parseHexColor(map['disabledTextColor'])
          : null,
      elevation:
          map.containsKey('elevation') ? map['elevation']?.toDouble() : 0.0,
      padding: map.containsKey('padding')
          ? parseEdgeInsetsGeometry(map['padding'])
          : null,
      splashColor: map.containsKey('splashColor')
          ? parseHexColor(map['splashColor'])
          : null,
      textColor:
          map.containsKey('textColor') ? parseHexColor(map['textColor']) : null,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
      onPressed: () {
        listener.onClicked(clickEvent);
      },
    );

    return raisedButton;
  }

  @override
  String get widgetName => "RaisedButton";

  @override
  Map<String, dynamic> export(Widget widget, BuildContext buildContext) {
    var realWidget = widget as RaisedButton;
    var padding = realWidget.padding as EdgeInsets;

    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color != null
          ? realWidget.color.value.toRadixString(16)
          : null,
      "disabledColor": realWidget.disabledColor != null
          ? realWidget.disabledColor.value.toRadixString(16)
          : null,
      "disabledElevation": realWidget.disabledElevation,
      "disabledTextColor": realWidget.disabledTextColor != null
          ? realWidget.disabledTextColor.value.toRadixString(16)
          : null,
      "elevation": realWidget.elevation,
      "padding": padding != null
          ? "${padding.left},${padding.top},${padding.right},${padding.bottom}"
          : null,
      "splashColor": realWidget.splashColor != null
          ? realWidget.splashColor.value.toRadixString(16)
          : null,
      "textColor": realWidget.textColor != null
          ? realWidget.textColor.value.toRadixString(16)
          : null,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => RaisedButton;
}
