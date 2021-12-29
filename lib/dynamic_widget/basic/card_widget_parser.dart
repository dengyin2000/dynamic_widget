import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/common/rounded_rectangle_border_parser.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class CardParser extends WidgetParser {
  @override
  String get widgetName => 'Card';

  @override
  Type get widgetType => Card;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    if (widget != null && widget is Card) {
      final EdgeInsets? margin = widget.margin as EdgeInsets?;
      final String? color =
          widget.color != null ? widget.color!.value.toRadixString(16) : null;
      final String? shadowColor = widget.shadowColor != null
          ? widget.shadowColor!.value.toRadixString(16)
          : null;
      final double? elevation = widget.elevation;
      final bool borderOnForeground = widget.borderOnForeground;
      final String? clipBehavior = widget.clipBehavior != null
          ? exportClipBehavior(widget.clipBehavior!)
          : null;
      final String? strMargin = margin != null
          ? "${margin.left},${margin.top},${margin.right},${margin.bottom},"
          : null;
      final bool semanticContainer = widget.semanticContainer;
      final Map<String, dynamic>? childMap =
          DynamicWidgetBuilder.export(widget.child, buildContext);
      final Map<String, dynamic>? shape;
      if (widget.shape != null && widget.shape is RoundedRectangleBorder) {
        shape = RoundedRectangleBorderParser.export(
            widget.shape as RoundedRectangleBorder);
      } else
        shape = null;

      final Map<String, dynamic> map = {
        "type": widgetName,
      };
      if (color != null) map['color'] = color;
      if (shadowColor != null) map['shadowColor'] = shadowColor;
      if (elevation != null) map['elevation'] = toDouble(elevation);
      map['borderOnForeground'] = borderOnForeground;
      if (clipBehavior != null) map['clipBehavior'] = clipBehavior;
      if (strMargin != null) map['margin'] = strMargin;
      map['semanticContainer'] = semanticContainer;
      if (childMap != null) map['child'] = childMap;
      if (shape != null) map['shape'] = shape;

      return map;
    }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    final Color? color = parseHexColor(map['color']);
    final Color? shadowColor = parseHexColor(map['shadowColor']);
    final double? elevation = toDouble(map['elevation'], null);
    final bool borderOnForeground = toBool(map['borderOnForeground']);
    final EdgeInsetsGeometry? margin = parseEdgeInsetsGeometry(map['margin']);
    final bool semanticContainer = toBool(map['semanticContainer']);
    final Clip clipBehavior = parseClipBehavior(map['clipBehavior']);
    final Map<String, dynamic>? childMap = map['child'];
    final Widget? child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);
    final RoundedRectangleBorder? shape =
        RoundedRectangleBorderParser.parse(map['shape']);

    var card = Card(
      color: color,
      shadowColor: shadowColor,
      elevation: elevation,
      shape: shape,
      borderOnForeground: borderOnForeground,
      margin: margin,
      semanticContainer: semanticContainer,
      clipBehavior: clipBehavior,
      child: child,
    );
    return card;
  }
}
