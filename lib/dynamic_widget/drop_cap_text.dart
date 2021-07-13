import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum DropCapMode {
  /// default
  inside,
  upwards,
  aside,

  /// Does not support dropCapPadding, indentation, dropCapPosition and custom dropCap.
  /// Try using DropCapMode.upwards in combination with dropCapPadding and forceNoDescent=true
  baseline
}

enum DropCapPosition {
  start,
  end,
}

class DropCap extends StatelessWidget {
  final Widget? child;
  final double width, height;

  DropCap({
    Key? key,
    this.child,
    required this.width,
    required this.height,
  })  : assert(width != null),
        assert(height != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: child, width: width, height: height);
  }
}

class DropCapText extends StatelessWidget {
  final String data;
  final bool? selectable;
  final DropCapMode? mode;
  final TextStyle? style, dropCapStyle;
  final TextAlign textAlign;
  final DropCap? dropCap;
  final EdgeInsets? dropCapPadding;
  final Offset indentation;
  final bool? forceNoDescent, parseInlineMarkdown;
  final TextDirection textDirection;
  final DropCapPosition? dropCapPosition;
  final int? dropCapChars;
  final int? maxLines;
  final TextOverflow? overflow;

  DropCapText(
      {Key? key,
      required this.data,
      this.selectable,
      this.mode,
      this.style,
      this.dropCapStyle,
      this.textAlign = TextAlign.start,
      this.dropCap,
      this.dropCapPadding = EdgeInsets.zero,
      this.indentation = Offset.zero,
      this.dropCapChars = 1,
      this.forceNoDescent = false,
      this.parseInlineMarkdown = false,
      this.textDirection = TextDirection.ltr,
      this.overflow,
      this.maxLines,
      this.dropCapPosition})
      : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyText2!.color,
      fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
      height: Theme.of(context).textTheme.bodyText2!.height,
      fontFamily: Theme.of(context).textTheme.bodyText2!.fontFamily,
    ).merge(style);

    if (data == '')
      return selectable!
          ? SelectableText(data, style: textStyle)
          : Text(data, style: textStyle);

    TextStyle capStyle = TextStyle(
      color: textStyle.color,
      fontSize: textStyle.fontSize! * 5.5,
      fontFamily: textStyle.fontFamily,
      fontWeight: textStyle.fontWeight,
      fontStyle: textStyle.fontStyle,
      height: 1,
    ).merge(dropCapStyle);

    double capWidth, capHeight;
    int? dropCapChars = dropCap != null ? 0 : this.dropCapChars;
    CrossAxisAlignment sideCrossAxisAlignment = CrossAxisAlignment.start;
    MarkdownParser? mdData = parseInlineMarkdown! ? MarkdownParser(data) : null;
    final String dropCapStr =
        (mdData?.plainText ?? data).substring(0, dropCapChars);

    if (mode == DropCapMode.baseline && dropCap == null)
      return _buildBaseline(context, textStyle, capStyle);

    // custom DropCap
    if (dropCap != null) {
      capWidth = dropCap!.width;
      capHeight = dropCap!.height;
    } else {
      TextPainter capPainter = TextPainter(
        text: TextSpan(
          text: dropCapStr,
          style: capStyle,
        ),
        textDirection: textDirection,
      );
      capPainter.layout();
      capWidth = capPainter.width;
      capHeight = capPainter.height;
      if (forceNoDescent!) {
        List<LineMetrics> ls = capPainter.computeLineMetrics();
        capHeight -=
            ls.isNotEmpty ? ls[0].descent * 0.95 : capPainter.height * 0.2;
      }
    }

    // compute drop cap padding
    capWidth += dropCapPadding!.left + dropCapPadding!.right;
    capHeight += dropCapPadding!.top + dropCapPadding!.bottom;

    MarkdownParser? mdRest =
        parseInlineMarkdown! ? mdData!.subchars(dropCapChars) : null;
    String restData = data.substring(dropCapChars!);

    TextSpan textSpan = TextSpan(
      text: parseInlineMarkdown! ? null : restData,
      children: parseInlineMarkdown! ? mdRest!.toTextSpanList() : null,
      style: textStyle.apply(
          fontSizeFactor: MediaQuery.of(context).textScaleFactor),
    );

    TextPainter textPainter = TextPainter(
        textDirection: textDirection, text: textSpan, textAlign: textAlign);
    double lineHeight = textPainter.preferredLineHeight;

    int rows = ((capHeight - indentation.dy) / lineHeight).ceil();

    // DROP CAP MODE - UPWARDS
    if (mode == DropCapMode.upwards) {
      rows = 1;
      sideCrossAxisAlignment = CrossAxisAlignment.end;
    }

    // BUILDER
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double boundsWidth = constraints.maxWidth - capWidth;
      if (boundsWidth < 1) boundsWidth = 1;

      int? charIndexEnd = data.length;

      //int startMillis = new DateTime.now().millisecondsSinceEpoch;
      if (rows > 0) {
        textPainter.layout(maxWidth: boundsWidth);
        double yPos = rows * lineHeight;
        int charIndex =
            textPainter.getPositionForOffset(Offset(0, yPos)).offset;
        textPainter.maxLines = rows;
        textPainter.layout(maxWidth: boundsWidth);
        if (textPainter.didExceedMaxLines) charIndexEnd = charIndex;
      } else {
        charIndexEnd = dropCapChars;
      }
      //int totMillis = new DateTime.now().millisecondsSinceEpoch - startMillis;

      // DROP CAP MODE - LEFT
      if (mode == DropCapMode.aside) charIndexEnd = data.length;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Text(totMillis.toString() + ' ms'),
          Row(
            textDirection: dropCapPosition == null ||
                    dropCapPosition == DropCapPosition.start
                ? textDirection
                : (textDirection == TextDirection.ltr
                    ? TextDirection.rtl
                    : TextDirection.ltr),
            crossAxisAlignment: sideCrossAxisAlignment,
            children: <Widget>[
              dropCap != null
                  ? Padding(padding: dropCapPadding!, child: dropCap)
                  : Container(
                      width: capWidth,
                      height: capHeight,
                      padding: dropCapPadding,
                      child: selectable!
                          ? SelectableText.rich(
                              TextSpan(
                                text: dropCapStr,
                                style: capStyle,
                              ),
                              textAlign: textAlign,
                              textDirection: textDirection,
                            )
                          : Text.rich(
                              TextSpan(
                                text: dropCapStr,
                                style: capStyle,
                              ),
                              textAlign: textAlign,
                              textDirection: textDirection,
                            ),
                    ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: indentation.dy),
                  height: (lineHeight * min(maxLines ?? rows, rows)) +
                      indentation.dy,
                  child: selectable!
                      ? SelectableText.rich(
                          textSpan,
                          maxLines: maxLines,
                          textAlign: textAlign,
                          textDirection: textDirection,
                          scrollPhysics: NeverScrollableScrollPhysics(),
                        )
                      : Text.rich(
                          textSpan,
                          maxLines: maxLines,
                          textAlign: textAlign,
                          textDirection: textDirection,
                          overflow: (maxLines == null ||
                                  (maxLines! > rows &&
                                      overflow == TextOverflow.fade))
                              ? TextOverflow.clip
                              : overflow,
                        ),
                ),
              ),
            ],
          ),
          if (maxLines == null || maxLines! > rows)
            Padding(
              padding: EdgeInsets.only(left: indentation.dx),
              child: selectable!
                  ? SelectableText.rich(
                      TextSpan(
                        text: parseInlineMarkdown!
                            ? null
                            : restData.substring(charIndexEnd),
                        children: parseInlineMarkdown!
                            ? mdRest!.subchars(charIndexEnd).toTextSpanList()
                            : null,
                        style: textStyle.apply(
                            fontSizeFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ),
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      maxLines: maxLines != null && maxLines! > rows
                          ? maxLines! - rows
                          : null,
                      textAlign: textAlign,
                      textDirection: textDirection,
                    )
                  : Text.rich(
                      TextSpan(
                        text: parseInlineMarkdown!
                            ? null
                            : restData.substring(charIndexEnd),
                        children: parseInlineMarkdown!
                            ? mdRest!.subchars(charIndexEnd).toTextSpanList()
                            : null,
                        style: textStyle.apply(
                            fontSizeFactor:
                                MediaQuery.of(context).textScaleFactor),
                      ),
                      overflow: overflow,
                      maxLines: maxLines != null && maxLines! > rows
                          ? maxLines! - rows
                          : null,
                      textAlign: textAlign,
                      textDirection: textDirection,
                    ),
            ),
        ],
      );
    });
  }

  _buildBaseline(
      BuildContext context, TextStyle textStyle, TextStyle capStyle) {
    MarkdownParser mdData = MarkdownParser(data);

    return selectable!
        ? SelectableText.rich(
            TextSpan(
              style: textStyle,
              children: <TextSpan>[
                TextSpan(
                  text: mdData.plainText!.substring(0, dropCapChars),
                  style: capStyle.merge(TextStyle(height: 0)),
                ),
                TextSpan(
                  children: mdData.subchars(dropCapChars).toTextSpanList(),
                  style: textStyle.apply(
                      fontSizeFactor: MediaQuery.of(context).textScaleFactor),
                ),
              ],
            ),
            textAlign: textAlign,
          )
        : Text.rich(
            TextSpan(
              style: textStyle,
              children: <TextSpan>[
                TextSpan(
                  text: mdData.plainText!.substring(0, dropCapChars),
                  style: capStyle.merge(TextStyle(height: 0)),
                ),
                TextSpan(
                  children: mdData.subchars(dropCapChars).toTextSpanList(),
                  style: textStyle.apply(
                      fontSizeFactor: MediaQuery.of(context).textScaleFactor),
                ),
              ],
            ),
            textAlign: textAlign,
          );
  }
}

class MarkdownParser {
  final String data;
  late List<MarkdownSpan> spans;
  String? plainText;

  List<TextSpan> toTextSpanList() {
    return spans.map((s) => s.toTextSpan()).toList();
  }

  MarkdownParser subchars(int? startIndex, [int? endIndex]) {
    final List<MarkdownSpan> subspans = [];
    int? skip = startIndex;
    for (int s = 0; s < spans.length; s++) {
      MarkdownSpan span = spans[s];
      if (skip! <= 0) {
        subspans.add(span);
      } else if (span.text.length < skip) {
        skip -= span.text.length;
      } else {
        subspans.add(
          MarkdownSpan(
            style: span.style,
            markups: span.markups,
            text: span.text.substring(skip, span.text.length),
          ),
        );
        skip = 0;
      }
    }

    return MarkdownParser(
      subspans
          .asMap()
          .map((int index, MarkdownSpan span) {
            String markup = index > 0
                ? (span.markups.isNotEmpty ? span.markups[0].code : '')
                : span.markups.map((m) => m.isActive ? m.code : '').join();
            return MapEntry(index, '$markup${span.text}');
          })
          .values
          .toList()
          .join(),
    );
  }

  MarkdownParser(this.data) {
    plainText = '';
    spans = [MarkdownSpan(text: '', markups: [], style: TextStyle())];

    bool bold = false;
    bool italic = false;
    bool underline = false;

    const String MARKUP_BOLD = '**';
    const String MARKUP_ITALIC = '_';
    const String MARKUP_UNDERLINE = '++';

    addSpan(String markup, bool isOpening) {
      final List<Markup> markups = [Markup(markup, isOpening)];

      if (bold && markup != MARKUP_BOLD) markups.add(Markup(MARKUP_BOLD, true));
      if (italic && markup != MARKUP_ITALIC)
        markups.add(Markup(MARKUP_ITALIC, true));
      if (underline && markup != MARKUP_UNDERLINE)
        markups.add(Markup(MARKUP_UNDERLINE, true));

      spans.add(
        MarkdownSpan(
          text: '',
          markups: markups,
          style: TextStyle(
            fontWeight: bold ? FontWeight.bold : null,
            fontStyle: italic ? FontStyle.italic : null,
            decoration: underline ? TextDecoration.underline : null,
          ),
        ),
      );
    }

    bool checkMarkup(int i, String markup) {
      return data.substring(i, min(i + markup.length, data.length)) == markup;
    }

    for (int c = 0; c < data.length; c++) {
      if (checkMarkup(c, MARKUP_BOLD)) {
        bold = !bold;
        addSpan(MARKUP_BOLD, bold);
        c += MARKUP_BOLD.length - 1;
      } else if (checkMarkup(c, MARKUP_ITALIC)) {
        italic = !italic;
        addSpan(MARKUP_ITALIC, italic);
        c += MARKUP_ITALIC.length - 1;
      } else if (checkMarkup(c, MARKUP_UNDERLINE)) {
        underline = !underline;
        addSpan(MARKUP_UNDERLINE, underline);
        c += MARKUP_UNDERLINE.length - 1;
      } else {
        spans[spans.length - 1].text += data[c];
        plainText = plainText ?? "" + data[c];
      }
    }
  }
}

class MarkdownSpan {
  final TextStyle style;
  final List<Markup> markups;
  String text;

  TextSpan toTextSpan() => TextSpan(text: text, style: style);

  MarkdownSpan({
    required this.text,
    required this.style,
    required this.markups,
  });
}

class Markup {
  final String code;
  final bool isActive;

  Markup(this.code, this.isActive);
}
