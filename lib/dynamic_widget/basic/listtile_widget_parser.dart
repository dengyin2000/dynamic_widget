import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils.dart';

class ListTileWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    bool isThreeLine =
        map.containsKey("isThreeLine") ? map["isThreeLine"] : false;
    EdgeInsetsGeometry? contentPadding = map.containsKey("contentPadding")
        ? parseEdgeInsetsGeometry(map["contentPadding"])
        : null;
    bool? dense = map.containsKey("dense") ? map["dense"] : false;
    bool enabled = map.containsKey("enabled") ? map["enabled"] : true;
    Widget? leading = map.containsKey("leading")
        ? DynamicWidgetBuilder.buildFromMap(
            map["leading"], buildContext, listener)
        : null;
    bool selected = map.containsKey("selected") ? map["selected"] : false;
    Widget? subtitle = map.containsKey("subtitle")
        ? DynamicWidgetBuilder.buildFromMap(
            map["subtitle"], buildContext, listener)
        : null;
    Widget? title = map.containsKey("title")
        ? DynamicWidgetBuilder.buildFromMap(
            map["title"], buildContext, listener)
        : null;
    Widget? trailing = map.containsKey("trailing")
        ? DynamicWidgetBuilder.buildFromMap(
            map["trailing"], buildContext, listener)
        : null;
    String? tapEvent = map.containsKey("tapEvent") ? map["tapEvent"] : null;

    return ListTile(
      isThreeLine: isThreeLine,
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      dense: dense,
      contentPadding: contentPadding,
      enabled: enabled,
      onTap: () {
        if (listener != null && tapEvent != null) {
          listener.onClicked(tapEvent);
        }
      },
      selected: selected,
    );
  }

  @override
  String get widgetName => "ListTile";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ListTile;
    var contentPadding = realWidget.contentPadding as EdgeInsets?;
    return <String, dynamic>{
      "type": widgetName,
      "isThreeLine": realWidget.isThreeLine,
      "leading": realWidget.leading != null
          ? DynamicWidgetBuilder.export(realWidget.leading, buildContext)
          : null,
      "title": realWidget.title != null
          ? DynamicWidgetBuilder.export(realWidget.title, buildContext)
          : null,
      "subtitle": realWidget.subtitle != null
          ? DynamicWidgetBuilder.export(realWidget.subtitle, buildContext)
          : null,
      "trailing": realWidget.trailing != null
          ? DynamicWidgetBuilder.export(realWidget.trailing, buildContext)
          : null,
      "dense": realWidget.dense,
      "contentPadding": contentPadding != null
          ? "${contentPadding.left},${contentPadding.top},${contentPadding.right},${contentPadding.bottom}"
          : null,
      "enabled": realWidget.enabled,
      "selected": realWidget.selected
    };
  }

  @override
  Type get widgetType => ListTile;
}
