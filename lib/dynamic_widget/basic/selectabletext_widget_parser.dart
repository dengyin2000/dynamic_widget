import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SelectableTextWidgetParser implements WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener listener) {
    String data = map['data'];
    String textAlignString = map['textAlign'];
    int maxLines = map['maxLines'];
    String textDirectionString = map['textDirection'];
//    double textScaleFactor = map['textScaleFactor'];
    var textSpan;
    var textSpanParser = SelectableTextSpanParser();
    if (map.containsKey("textSpan")) {
      textSpan = textSpanParser.parse(map['textSpan'], listener);
    }

    if (textSpan == null) {
      return SelectableText(
        data,
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
}

class SelectableTextSpanParser {
  TextSpan parse(Map<String, dynamic> map, ClickListener listener) {
    String clickEvent = map.containsKey("recognizer") ? map['recognizer'] : "";
    var textSpan = TextSpan(
        text: map['text'],
        style: parseTextStyle(map['style']),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            listener.onClicked(clickEvent);
          },
        children: []);

    if (map.containsKey('children')) {
      parseChildren(textSpan, map['children'], listener);
    }

    return textSpan;
  }

  void parseChildren(
      TextSpan textSpan, List<dynamic> childrenSpan, ClickListener listener) {
    for (var childmap in childrenSpan) {
      textSpan.children.add(parse(childmap, listener));
    }
  }
}
