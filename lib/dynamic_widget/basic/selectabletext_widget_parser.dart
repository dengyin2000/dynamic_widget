import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SelectableTextWidgetParser implements WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    String? data = toStr(map['data']);
    String? textAlignString = toStr(map['textAlign']);
    int? maxLines = toInt(map['maxLines'], null);
    String? textDirectionString = toStr(map['textDirection']);
//    double textScaleFactor = map['textScaleFactor'];
    var textSpan;
    var textSpanParser = SelectableTextSpanParser();
    if (map.containsKey("textSpan")) {
      textSpan = textSpanParser.parse(map['textSpan'], listener);
    }

    if (textSpan == null) {
      return SelectableText(
        data!,
        textAlign: parseTextAlign(textAlignString),
        maxLines: maxLines,
        textDirection: parseTextDirection(textDirectionString),
        style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
//        textScaleFactor: textScaleFactor,
      );
    } else {
      return SelectableText.rich(
        textSpan,
        textAlign: parseTextAlign(textAlignString),
        maxLines: maxLines,
        textDirection: parseTextDirection(textDirectionString),
        style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
//        textScaleFactor: textScaleFactor,
      );
    }
  }

  @override
  String get widgetName => "SelectableText";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SelectableText;
    if (realWidget.textSpan == null) {
      return <String, dynamic>{
        "type": "SelectableText",
        "data": realWidget.data,
        "textAlign": realWidget.textAlign != null
            ? exportTextAlign(realWidget.textAlign)
            : "start",
        "maxLines": realWidget.maxLines,
        "textDirection": exportTextDirection(realWidget.textDirection),
        "style": exportTextStyle(realWidget.style),
      };
    } else {
      var parser = SelectableTextSpanParser();
      return <String, dynamic>{
        "type": "SelectableText",
        "textSpan": parser.export(realWidget.textSpan!),
        "textAlign": realWidget.textAlign != null
            ? exportTextAlign(realWidget.textAlign)
            : "start",
        "maxLines": realWidget.maxLines,
        "textDirection": exportTextDirection(realWidget.textDirection),
        "style": exportTextStyle(realWidget.style),
      };
    }
  }

  @override
  bool matchWidgetForExport(Widget? widget) => widget is SelectableText;

  @override
  Type get widgetType => SelectableText;
}

class SelectableTextSpanParser {
  TextSpan parse(Map<String, dynamic> map, ClickListener? listener) {
    String? clickEvent = map.containsKey("recognizer") ? map['recognizer'] : "";
    var textSpan = TextSpan(
        text: map['text'],
        style: parseTextStyle(map['style']),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            listener!.onClicked(clickEvent);
          },
        children: []);

    if (map.containsKey('children')) {
      parseChildren(textSpan, map['children'], listener);
    }

    return textSpan;
  }

  void parseChildren(
      TextSpan textSpan, List<dynamic> childrenSpan, ClickListener? listener) {
    for (var childmap in childrenSpan) {
      textSpan.children!.add(parse(childmap, listener));
    }
  }

  Map<String, dynamic> export(TextSpan textSpan) {
    return <String, dynamic>{
      "text": textSpan.text,
      "style": exportTextStyle(textSpan.style),
      "children": exportChildren(textSpan)
    };
  }

  List<Map<String, dynamic>> exportChildren(TextSpan textSpan) {
    List<Map<String, dynamic>> rt = [];
    if (textSpan.children != null && textSpan.children!.isNotEmpty) {
      for (var span in textSpan.children!) {
        rt.add(export(span as TextSpan));
      }
    }
    return rt;
  }
}
