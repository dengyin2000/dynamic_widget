import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class TextWidgetParser implements WidgetParser {
  @override
  bool forWidget(String widgetName) {
    return "Text" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    String data = map['data'];
    String textAlignString = map['textAlign'];
    String overflow = map['overflow'];
    int maxLines = map['maxLines'] == null ? 1 : map['maxLines'];
    String semanticsLabel = map['semanticsLabel'];
    bool softWrap = map['softWrap'];
    String textDirectionString = map['textDirection'];
    double textScaleFactor = map['textScaleFactor'];
    var textSpan;
    var textSpanParser = TextSpanParser();
    if (map.containsKey("textSpan")) {
      textSpan = textSpanParser.parse(map['textSpan'], widgetParserCompanion);
    }

    if (textSpan == null) {
      return Text(
        data,
        textAlign: parseTextAlign(textAlignString),
        overflow: parseTextOverflow(overflow),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        textDirection: parseTextDirection(textDirectionString),
        style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
        textScaleFactor: textScaleFactor,
      );
    } else {
      return Text.rich(
        textSpan,
        textAlign: parseTextAlign(textAlignString),
        overflow: parseTextOverflow(overflow),
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        textDirection: parseTextDirection(textDirectionString),
        style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
        textScaleFactor: textScaleFactor,
      );
    }
  }
}

class TextSpanParser {
  TextSpan parse(Map<String, dynamic> map, WidgetParserCompanion widgetParserCompanion) {
    String clickEvent = map.containsKey("recognizer") ? map['recognizer'] : "";
    var textSpan = TextSpan(
        text: map['text'],
        style: parseTextStyle(map['style']),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            widgetParserCompanion.clickListener.onClicked(clickEvent);
          },
        children: []);

    if (map.containsKey('children')) {
      parseChildren(textSpan, map['children'], widgetParserCompanion);
    }

    return textSpan;
  }

  void parseChildren(
      TextSpan textSpan, List<dynamic> childrenSpan, WidgetParserCompanion widgetParserCompanion) {
    for (var childmap in childrenSpan) {
      textSpan.children.add(parse(childmap, widgetParserCompanion));
    }
  }
}
