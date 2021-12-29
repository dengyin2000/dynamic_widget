import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/drop_cap_text.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class DropCapTextParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return DropCapText(
      data: toStr(map['data'], null),
      selectable: toBool(map['selectable'], false),
      mode: map.containsKey('mode')
          ? parseDropCapMode(map['mode'])
          : DropCapMode.inside,
      style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
      dropCapStyle: map.containsKey('dropCapStyle')
          ? parseTextStyle(map['dropCapStyle'])
          : null,
      textAlign: map.containsKey('textAlign')
          ? parseTextAlign(map['textAlign'])
          : TextAlign.start,
      dropCap: map.containsKey('dropCap')
          ? parseDropCap(map['dropCap'], buildContext, listener)
          : null,
      dropCapPadding: map.containsKey('dropCapPadding')
          ? parseEdgeInsetsGeometry(map['dropCapPadding']) as EdgeInsets?
          : EdgeInsets.zero,
      indentation: Offset.zero,
      //todo: actually add this
      dropCapChars: toInt(map['dropCapChars'], 1),
      forceNoDescent: toBool(map['forceNoDescent'], false),
      parseInlineMarkdown: toBool(map['parseInlineMarkdown'], false),
      textDirection: map.containsKey('textDirection')
          ? parseTextDirection(map['textDirection'])
          : TextDirection.ltr,
      overflow: map.containsKey('overflow')
          ? parseTextOverflow(map['overflow'])
          : TextOverflow.clip,
      maxLines: toInt(map['maxLines'], null),
      dropCapPosition: map.containsKey('dropCapPosition')
          ? parseDropCapPosition(map['dropCapPosition'])
          : null,
    );
  }

  @override
  String get widgetName => "DropCapText";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as DropCapText;
    var dropCapPadding = realWidget.dropCapPadding;
    return <String, dynamic>{
      "type": widgetName,
      "data": realWidget.data,
      "selectable": realWidget.selectable,
      "mode": exportDropCapMod(realWidget.mode),
      "style": exportTextStyle(realWidget.style),
      "dropCapStyle": exportTextStyle(realWidget.dropCapStyle),
      "textAlign": exportTextAlign(realWidget.textAlign),
      "dropCap": exportDropCap(realWidget.dropCap, buildContext),
      "dropCapPadding": dropCapPadding != null
          ? "${dropCapPadding.left},${dropCapPadding.top},${dropCapPadding.right},${dropCapPadding.bottom}"
          : null,
      "dropCapChars": realWidget.dropCapChars,
      "forceNoDescent": realWidget.forceNoDescent,
      "parseInlineMarkdown": realWidget.parseInlineMarkdown != null
          ? realWidget.parseInlineMarkdown
          : false,
      "textDirection": exportTextDirection(realWidget.textDirection),
      "overflow": exportTextOverflow(realWidget.overflow),
      "maxLines": realWidget.maxLines,
      "dropCapPosition": realWidget.dropCapPosition != null
          ? exportDropCapPosition(realWidget.dropCapPosition)
          : null
    };
  }

  @override
  Type get widgetType => DropCapText;
}
