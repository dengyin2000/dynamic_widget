import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class ElevatedButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ElevatedButton;
    var color = realWidget.style?.foregroundColor != null
        ? realWidget.style?.foregroundColor?.resolve(WidgetState.values.toSet())
        : null;
    var backgroundColor = realWidget.style?.backgroundColor != null
        ? realWidget.style?.backgroundColor?.resolve(WidgetState.values.toSet())
        : null;
    var overlayColor = realWidget.style?.overlayColor != null
        ? realWidget.style?.overlayColor?.resolve(WidgetState.values.toSet())
        : null;
    var shadowColor = realWidget.style?.shadowColor != null
        ? realWidget.style?.shadowColor?.resolve(WidgetState.values.toSet())
        : null;
    var elevation = realWidget.style?.elevation != null
        ? realWidget.style?.elevation?.resolve(WidgetState.values.toSet())
        : null;
    var edgeInsetsGeometry = realWidget.style?.padding != null
        ? realWidget.style?.padding?.resolve(WidgetState.values.toSet())
            as EdgeInsets?
        : null;
    var textStyle2 = realWidget.style?.textStyle != null
        ? realWidget.style?.textStyle?.resolve(WidgetState.values.toSet())
        : null;
    return <String, dynamic>{
      "type": widgetName,
      "foregroundColor":
          color != null ? color.toARGB32().toRadixString(16) : null,
      "backgroundColor": backgroundColor != null
          ? backgroundColor.toARGB32().toRadixString(16)
          : null,
      "overlayColor": overlayColor != null
          ? overlayColor.toARGB32().toRadixString(16)
          : null,
      "shadowColor":
          shadowColor != null ? shadowColor.toARGB32().toRadixString(16) : null,
      "elevation": elevation,
      "padding": edgeInsetsGeometry != null
          ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
          : null,
      "textStyle": exportTextStyle(textStyle2),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return ElevatedButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ButtonStyle(
        foregroundColor: map.containsKey("foregroundColor")
            ? WidgetStateProperty.all(parseHexColor(map["foregroundColor"]))
            : null,
        backgroundColor: map.containsKey("backgroundColor")
            ? WidgetStateProperty.all(parseHexColor(map["backgroundColor"]))
            : null,
        overlayColor: map.containsKey("overlayColor")
            ? WidgetStateProperty.all(parseHexColor(map["overlayColor"]))
            : null,
        shadowColor: map.containsKey("shadowColor")
            ? WidgetStateProperty.all(parseHexColor(map["shadowColor"]))
            : null,
        elevation: map.containsKey("elevation")
            ? WidgetStateProperty.all(map["elevation"])
            : null,
        padding: map.containsKey("padding")
            ? WidgetStateProperty.all(parseEdgeInsetsGeometry(map["padding"]))
            : null,
        textStyle: map.containsKey("textStyle")
            ? WidgetStateProperty.all(parseTextStyle(map["textStyle"]))
            : null,
        alignment: map.containsKey("alignment")
            ? parseAlignment(map["alignment"])
            : null,
      ),
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ElevatedButton";

  @override
  Type get widgetType => ElevatedButton;
}

class TextButtonParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as TextButton;
    var color = realWidget.style?.foregroundColor != null
        ? realWidget.style?.foregroundColor?.resolve(WidgetState.values.toSet())
        : null;
    var backgroundColor = realWidget.style?.backgroundColor != null
        ? realWidget.style?.backgroundColor?.resolve(WidgetState.values.toSet())
        : null;
    var overlayColor = realWidget.style?.overlayColor != null
        ? realWidget.style?.overlayColor?.resolve(WidgetState.values.toSet())
        : null;
    var shadowColor = realWidget.style?.shadowColor != null
        ? realWidget.style?.shadowColor?.resolve(WidgetState.values.toSet())
        : null;
    var elevation = realWidget.style?.elevation != null
        ? realWidget.style?.elevation?.resolve(WidgetState.values.toSet())
        : null;
    var edgeInsetsGeometry = realWidget.style?.padding != null
        ? realWidget.style?.padding?.resolve(WidgetState.values.toSet())
            as EdgeInsets?
        : null;
    var textStyle2 = realWidget.style?.textStyle != null
        ? realWidget.style?.textStyle?.resolve(WidgetState.values.toSet())
        : null;
    var map = <String, dynamic>{
      "type": widgetName,
      "foregroundColor":
          color != null ? color.toARGB32().toRadixString(16) : null,
      "backgroundColor": backgroundColor != null
          ? backgroundColor.toARGB32().toRadixString(16)
          : null,
      "overlayColor": overlayColor != null
          ? overlayColor.toARGB32().toRadixString(16)
          : null,
      "shadowColor":
          shadowColor != null ? shadowColor.toARGB32().toRadixString(16) : null,
      "elevation": elevation,
      "padding": edgeInsetsGeometry != null
          ? "${edgeInsetsGeometry.left},${edgeInsetsGeometry.top},${edgeInsetsGeometry.right},${edgeInsetsGeometry.bottom}"
          : null,
      "textStyle": exportTextStyle(textStyle2),
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
    return map;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    return TextButton(
      onPressed: () {
        listener!.onClicked(clickEvent);
      },
      style: ButtonStyle(
        foregroundColor: map.containsKey("foregroundColor")
            ? WidgetStateProperty.all(parseHexColor(map["foregroundColor"]))
            : null,
        backgroundColor: map.containsKey("backgroundColor")
            ? WidgetStateProperty.all(parseHexColor(map["backgroundColor"]))
            : null,
        overlayColor: map.containsKey("overlayColor")
            ? WidgetStateProperty.all(parseHexColor(map["overlayColor"]))
            : null,
        shadowColor: map.containsKey("shadowColor")
            ? WidgetStateProperty.all(parseHexColor(map["shadowColor"]))
            : null,
        elevation: map.containsKey("elevation")
            ? WidgetStateProperty.all(map["elevation"])
            : null,
        padding: map.containsKey("padding")
            ? WidgetStateProperty.all(parseEdgeInsetsGeometry(map["padding"]))
            : null,
        textStyle: map.containsKey("textStyle")
            ? WidgetStateProperty.all(parseTextStyle(map["textStyle"]))
            : null,
        alignment: map.containsKey("alignment")
            ? parseAlignment(map["alignment"])
            : null,
      ),
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener)!,
    );
  }

  @override
  String get widgetName => "TextButton";

  @override
  Type get widgetType => TextButton;
}
