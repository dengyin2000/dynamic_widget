import 'package:dynamic_widget/apnaklub_widgets/readmoretext.dart';
import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

import '../../new_widget_parser.dart';
import '../utils.dart';

class ReadMoreTextParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    typeAssertionDriver(map: map, attribute: 'data', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'trimExpandedText', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'trimCollapsedText', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'colorClickableText', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'trimLength', expectedType: TYPE_INT);
    typeAssertionDriver(map: map, attribute: 'trimLines', expectedType: TYPE_INT);
    typeAssertionDriver(map: map, attribute: 'trimMode', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textAlign', expectedType: TYPE_STRING);
    //typeAssertionDriver(map: map, attribute: 'delimiterStyle', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'moreStyle', expectedType: TYPE_MAP);
    typeAssertionDriver(map: map, attribute: 'lessStyle', expectedType: TYPE_MAP);
    typeAssertionDriver(map: map, attribute: 'textDirection', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'locale', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'textScaleFactor', expectedType: TYPE_DOUBLE);
    typeAssertionDriver(map: map, attribute: 'semanticsLabel', expectedType: TYPE_STRING);
    typeAssertionDriver(map: map, attribute: 'style', expectedType: TYPE_MAP);
  }

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var readMoreText = widget as ReadMoreText;
    return {
      'type': widgetName,
      'data': readMoreText.data,
      'trimExpandedText': readMoreText.trimExpandedText,
      'trimCollapsedText': readMoreText.trimCollapsedText,
      'trimLength': readMoreText.trimLength,
      'trimLines': readMoreText.trimLines,
      'colorClickableText': readMoreText.colorClickableText,
      'trimMode': exportTrimMode(readMoreText.trimMode),
      'textAlign': readMoreText.textAlign,
      'delimiterStyle': readMoreText.delimiterStyle,
      'moreStyle': readMoreText.moreStyle,
      'lessStyle': readMoreText.lessStyle,
      'textDirection': readMoreText.textDirection,
      'locale': readMoreText.locale,
      'textScaleFactor': readMoreText.textScaleFactor,
      'semanticsLabel': readMoreText.semanticsLabel,
      'style': exportTextStyle(readMoreText.style),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    // delimiter not implemented
    // delimiter = _kEllipsis + ' ', is default

    String data = map['data'] ?? '';
    String trimExpandedText = map['trimExpandedText'] ?? 'show less';
    String trimCollapsedText = map['trimCollapsedText'] ?? 'read more';
    Color? colorClickableText =
        parseHexColor(map['colorClickableText']) ?? null;
    int trimLength = map['trimLength'] ?? 240;
    int trimLines = map['trimLines'] ?? 2;

    return ReadMoreText(
      data,
      trimExpandedText: trimExpandedText,
      trimCollapsedText: trimCollapsedText,
      trimLength: trimLength,
      trimLines: trimLines,
      colorClickableText: colorClickableText,
      trimMode: parseTrimMode(map['trimMode']),
      textAlign: parseTextAlign(map['textAlign']),
      // delimiter: ,
      // TODO - @Surya, why map is getting assigned to TextStyle type param.
      delimiterStyle: map['delimiterStyle'],
      moreStyle: parseTextStyle(map['moreStyle']),
      lessStyle: parseTextStyle(map['lessStyle']),
      textDirection: parseTextDirection(map['textDirection']),
      locale: parseLocale(map['locale']),
      textScaleFactor:
          map['textScaleFactor'] ?? MediaQuery.of(buildContext).textScaleFactor,
      semanticsLabel: map['semanticsLabel'],
      style: map.containsKey('style') ? parseTextStyle(map['style']) : null,
    );
  }

  @override
  String get widgetName => 'ReadMoreText';

  @override
  Type get widgetType => ReadMoreText;
}
