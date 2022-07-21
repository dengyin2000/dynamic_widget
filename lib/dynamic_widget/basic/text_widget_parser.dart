import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/assertions/type_assertions.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';

class TextWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'data', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textAlign', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'overflow', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'maxLines', expectedType: TYPE_INT);
    typeAssertionDriver(map: map, attribute: 'semanticsLabel', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'softWrap', expectedType: TYPE_BOOL);
    typeAssertionDriver(map: map, attribute: 'textDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textScaleFactor', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'textSpan', expectedType: TYPE_MAP);
    typeAssertionDriver(map: map, attribute: 'style', expectedType: TYPE_MAP);
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    String? data = map['data'];
    String? textAlignString = map['textAlign'];
    String? overflow = map['overflow'];
    int? maxLines = map['maxLines'];
    String? semanticsLabel = map['semanticsLabel'];
    bool? softWrap = map['softWrap'];
    String? textDirectionString = map['textDirection'];
    double? textScaleFactor = map['textScaleFactor']?.toDouble();
    var textSpan;
    var textSpanParser = TextSpanParser();
    if (map.containsKey("textSpan")) {
      textSpan = textSpanParser.parse(map['textSpan'], listener);
    }

    try {
      if (textSpan == null) {
        return Text(
          data!,
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
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "Text";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Text;
    if (realWidget.textSpan == null) {
      return <String, dynamic>{
        "type": "Text",
        "data": realWidget.data,
        "textAlign": realWidget.textAlign != null
            ? exportTextAlign(realWidget.textAlign)
            : "start",
        "overflow": exportTextOverflow(realWidget.overflow),
        "maxLines": realWidget.maxLines,
        "semanticsLabel": realWidget.semanticsLabel,
        "softWrap": realWidget.softWrap,
        "textDirection": exportTextDirection(realWidget.textDirection),
        "style": exportTextStyle(realWidget.style),
        "textScaleFactor": realWidget.textScaleFactor
      };
    } else {
      var parser = TextSpanParser();
      return <String, dynamic>{
        "type": "Text",
        "textSpan": parser.export(realWidget.textSpan as TextSpan),
        "textAlign": realWidget.textAlign != null
            ? exportTextAlign(realWidget.textAlign)
            : "start",
        "overflow": exportTextOverflow(realWidget.overflow),
        "maxLines": realWidget.maxLines,
        "semanticsLabel": realWidget.semanticsLabel,
        "softWrap": realWidget.softWrap,
        "textDirection": exportTextDirection(realWidget.textDirection),
        "style": exportTextStyle(realWidget.style),
        "textScaleFactor": realWidget.textScaleFactor
      };
    }
  }

  @override
  Type get widgetType => Text;

  @override
  bool matchWidgetForExport(Widget? widget) => widget is Text;
}

class TextSpanParser {
  TextSpan parse(Map<String, dynamic> map, EventListener? listener) {

    var typeAssertions = TypeAssertions('TextSpanParser');
    typeAssertions.run(map: map, attribute: 'text', expectedType: TYPE_STRING);
    typeAssertions.run(map: map, attribute: 'style', expectedType: TYPE_MAP);
    typeAssertions.run(map: map, attribute: 'children', expectedType: TYPE_LIST);

    String? clickEvent = map.containsKey("recognizer") ? map['recognizer'] : "";
    var textSpan = TextSpan(
        text: map['text'],
        style: parseTextStyle(map['style']),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            listener!.clickListener!.onClicked(clickEvent);
          },
        children: []);

    if (map.containsKey('children')) {
      parseChildren(textSpan, map['children'], listener);
    }

    return textSpan;
  }

  Map<String, dynamic> export(TextSpan textSpan) {
    return <String, dynamic>{
      "text": textSpan.text,
      "style": exportTextStyle(textSpan.style),
      "children": exportChildren(textSpan)
    };
  }

  void parseChildren(
      TextSpan textSpan, List<dynamic> childrenSpan, EventListener? listener) {
    for (var childmap in childrenSpan) {
      textSpan.children!.add(parse(childmap, listener));
    }
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
