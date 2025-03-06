
import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/drop_cap_text.dart';
import 'package:flutter/widgets.dart';

Map<List<Enum>, Enum?> typeDefaultList = {
  TextAlign.values: TextAlign.start,
  TextOverflow.values: TextOverflow.fade,
  TextDecorationStyle.values: TextDecorationStyle.solid,
  TextDirection.values: TextDirection.ltr,
  CrossAxisAlignment.values: CrossAxisAlignment.center,
  MainAxisAlignment.values: MainAxisAlignment.start,
  MainAxisSize.values: MainAxisSize.max,
  TextBaseline.values: TextBaseline.ideographic,
  VerticalDirection.values: VerticalDirection.down,
  BlendMode.values: BlendMode.srcIn,
  BoxFit.values: BoxFit.contain,
  ImageRepeat.values: ImageRepeat.noRepeat,
  FilterQuality.values: FilterQuality.low,
  StackFit.values: StackFit.loose,
  Clip.values: Clip.hardEdge,
  Axis.values: Axis.horizontal,
  WrapAlignment.values: WrapAlignment.start,
  WrapCrossAlignment.values: WrapCrossAlignment.start,
  DropCapMode.values: DropCapMode.inside,
  DropCapPosition.values: DropCapPosition.start
};

extension ChangeCase on String {
  String get lowereCamelCase => substring(0, 1).toLowerCase() + substring(1);
  String get upperCamelCase => substring(0, 1).toUpperCase() + substring(1);
}

Enum? parseEnum(String type, String? input) {
  //find the correct type
  List<Enum> typeClass = typeDefaultList.keys.firstWhere(
      (element) => element[0].runtimeType.toString() == type.upperCamelCase,
      orElse: () => throw 'parseEnum($type) not found');
  // find correct enum
  for (Enum element in typeClass) {
    if (element.name == input) {
      return element;
    }
  }
  // else default
  return typeDefaultList[typeClass];
}

String exportEnum(Enum? input) {
  // find correct enum
  List<Enum> typeClass = typeDefaultList.keys.firstWhere(
      (element) => element[0].runtimeType == input.runtimeType,
      orElse: () => throw 'exportEnum($input) not found');

  for (Enum element in typeClass) {
    if (element == input) {
      return element.name;
    }
  }
  // else default
  return typeDefaultList[typeClass]!.name;
}

TextAlign parseTextAlign(String? textAlignString) =>
    parseEnum('TextAlign', textAlignString) as TextAlign;

String exportTextAlign(TextAlign? textAlign) => exportEnum(textAlign);

TextOverflow? parseTextOverflow(String? textOverflowString) =>
    parseEnum('TextOverflow', textOverflowString) as TextOverflow?;

String? exportTextOverflow(TextOverflow? textOverflow) =>
    exportEnum(textOverflow);

TextDecorationStyle? parseTextDecorationStyle(
        String? textDecorationStyleString) =>
    parseEnum('TextDecorationStyle', textDecorationStyleString)
        as TextDecorationStyle?;

String? exportTextDecorationStyle(TextDecorationStyle? textDecorationStyle) =>
    exportEnum(textDecorationStyle);

TextDecoration parseTextDecoration(String? textDecorationString) {
  TextDecoration textDecoration = TextDecoration.none;
  switch (textDecorationString) {
    case "lineThrough":
      textDecoration = TextDecoration.lineThrough;
      break;
    case "overline":
      textDecoration = TextDecoration.overline;
      break;
    case "underline":
      textDecoration = TextDecoration.underline;
      break;
    case "none":
    default:
      textDecoration = TextDecoration.none;
  }
  return textDecoration;
}

String exportTextDecoration(TextDecoration? decoration) {
  var rt = "none";
  if (decoration == TextDecoration.lineThrough) {
    rt = "lineThrough";
  }

  if (decoration == TextDecoration.overline) {
    rt = "overline";
  }

  if (decoration == TextDecoration.underline) {
    rt = "underline";
  }

  return rt;
}

TextDirection parseTextDirection(String? textDirectionString) =>
    parseEnum('TextDirection', textDirectionString) as TextDirection;

String exportTextDirection(TextDirection? textDirection) =>
    exportEnum(textDirection);

FontWeight parseFontWeight(String? textFontWeight) {
  FontWeight fontWeight = FontWeight.normal;
  switch (textFontWeight) {
    case 'w100':
      fontWeight = FontWeight.w100;
      break;
    case 'w200':
      fontWeight = FontWeight.w200;
      break;
    case 'w300':
      fontWeight = FontWeight.w300;
      break;
    case 'normal':
    case 'w400':
      fontWeight = FontWeight.w400;
      break;
    case 'w500':
      fontWeight = FontWeight.w500;
      break;
    case 'w600':
      fontWeight = FontWeight.w600;
      break;
    case 'bold':
    case 'w700':
      fontWeight = FontWeight.w700;
      break;
    case 'w800':
      fontWeight = FontWeight.w800;
      break;
    case 'w900':
      fontWeight = FontWeight.w900;
      break;
    default:
      fontWeight = FontWeight.normal;
  }
  return fontWeight;
}

String exportFontWeight(FontWeight? fontWeight) {
  String rt = "normal";
  if (fontWeight == FontWeight.w100) {
    rt = "w100";
  }
  if (fontWeight == FontWeight.w200) {
    rt = "w200";
  }
  if (fontWeight == FontWeight.w300) {
    rt = "w300";
  }
  if (fontWeight == FontWeight.w400) {
    rt = "w400";
  }
  if (fontWeight == FontWeight.w500) {
    rt = "w500";
  }
  if (fontWeight == FontWeight.w600) {
    rt = "w600";
  }
  if (fontWeight == FontWeight.w700) {
    rt = "w700";
  }
  if (fontWeight == FontWeight.w800) {
    rt = "w800";
  }
  if (fontWeight == FontWeight.w900) {
    rt = "w900";
  }
  return rt;
}

Color? parseHexColor(String? hexColorString) {
  if (hexColorString == null) {
    return null;
  }
  hexColorString = hexColorString.toUpperCase().replaceAll("#", "");
  if (hexColorString.length == 6) {
    hexColorString = "FF" + hexColorString;
  }
  int colorInt = int.parse(hexColorString, radix: 16);
  return Color(colorInt);
}

TextStyle? parseTextStyle(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  //TODO: more properties need to be implemented, such as decorationColor, decorationStyle, wordSpacing and so on.
  String? color = map['color'];
  String? debugLabel = map['debugLabel'];
  String? decoration = map['decoration'];
  String? fontFamily = map['fontFamily'];
  double? fontSize = map['fontSize']?.toDouble();
  String? fontWeight = map['fontWeight'];
  FontStyle fontStyle =
      'italic' == map['fontStyle'] ? FontStyle.italic : FontStyle.normal;

  return TextStyle(
    color: parseHexColor(color),
    debugLabel: debugLabel,
    decoration: parseTextDecoration(decoration),
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontStyle: fontStyle,
    fontWeight: parseFontWeight(fontWeight),
  );
}

Map<String, dynamic>? exportTextStyle(TextStyle? textStyle) {
  if (textStyle == null) {
    return null;
  }

  return <String, dynamic>{
    "color": textStyle.color != null
        ? textStyle.color!.value.toRadixString(16)
        : null,
    "debugLabel": textStyle.debugLabel,
    "decoration": exportTextDecoration(textStyle.decoration),
    "fontSize": textStyle.fontSize,
    "fontFamily": textStyle.fontFamily,
    "fontStyle": FontStyle.italic == textStyle.fontStyle ? "italic" : "normal",
    "fontWeight": exportFontWeight(textStyle.fontWeight),
  };
}

Alignment? parseAlignment(String? alignmentString) {
  Alignment? alignment;
  switch (alignmentString) {
    case 'topLeft':
      alignment = Alignment.topLeft;
      break;
    case 'topCenter':
      alignment = Alignment.topCenter;
      break;
    case 'topRight':
      alignment = Alignment.topRight;
      break;
    case 'centerLeft':
      alignment = Alignment.centerLeft;
      break;
    case 'center':
      alignment = Alignment.center;
      break;
    case 'centerRight':
      alignment = Alignment.centerRight;
      break;
    case 'bottomLeft':
      alignment = Alignment.bottomLeft;
      break;
    case 'bottomCenter':
      alignment = Alignment.bottomCenter;
      break;
    case 'bottomRight':
      alignment = Alignment.bottomRight;
      break;
  }
  return alignment;
}

const double infinity = 9999999999;

BoxConstraints parseBoxConstraints(Map<String, dynamic>? map) {
  double minWidth = 0.0;
  double maxWidth = double.infinity;
  double minHeight = 0.0;
  double maxHeight = double.infinity;

  if (map != null) {
    if (map.containsKey('minWidth')) {
      var minWidthValue = map['minWidth']?.toDouble();

      if (minWidthValue != null) {
        if (minWidthValue >= infinity) {
          minWidth = double.infinity;
        } else {
          minWidth = minWidthValue;
        }
      }
    }

    if (map.containsKey('maxWidth')) {
      var maxWidthValue = map['maxWidth']?.toDouble();

      if (maxWidthValue != null) {
        if (maxWidthValue >= infinity) {
          maxWidth = double.infinity;
        } else {
          maxWidth = maxWidthValue;
        }
      }
    }

    if (map.containsKey('minHeight')) {
      var minHeightValue = map['minHeight']?.toDouble();

      if (minHeightValue != null) {
        if (minHeightValue >= infinity) {
          minHeight = double.infinity;
        } else {
          minHeight = minHeightValue;
        }
      }
    }

    if (map.containsKey('maxHeight')) {
      var maxHeightValue = map['maxHeight']?.toDouble();

      if (maxHeightValue != null) {
        if (maxHeightValue >= infinity) {
          maxHeight = double.infinity;
        } else {
          maxHeight = maxHeightValue;
        }
      }
    }
  }

  return BoxConstraints(
    minWidth: minWidth,
    maxWidth: maxWidth,
    minHeight: minHeight,
    maxHeight: maxHeight,
  );
}

EdgeInsetsGeometry? parseEdgeInsetsGeometry(String? edgeInsetsGeometryString) {
  //left,top,right,bottom
  if (edgeInsetsGeometryString == null ||
      edgeInsetsGeometryString.trim() == '') {
    return null;
  }
  var values = edgeInsetsGeometryString.split(",");
  return EdgeInsets.only(
      left: double.parse(values[0]),
      top: double.parse(values[1]),
      right: double.parse(values[2]),
      bottom: double.parse(values[3]));
}

CrossAxisAlignment parseCrossAxisAlignment(String? crossAxisAlignmentString) =>
    parseEnum('crossAxisAlignment', crossAxisAlignmentString)
        as CrossAxisAlignment;

String exportCrossAxisAlignment(CrossAxisAlignment crossAxisAlignment) =>
    exportEnum(crossAxisAlignment);

MainAxisAlignment parseMainAxisAlignment(String? mainAxisAlignmentString) =>
    parseEnum('mainAxisAlignment', mainAxisAlignmentString)
        as MainAxisAlignment;

String exportMainAxisAlignment(MainAxisAlignment mainAxisAlignment) =>
    exportEnum(mainAxisAlignment);

MainAxisSize parseMainAxisSize(String? mainAxisSizeString) =>
    parseEnum('mainAxisSize', mainAxisSizeString) as MainAxisSize;

String exportMainAxisSize(MainAxisSize mainAxisSize) =>
    exportEnum(mainAxisSize);

TextBaseline parseTextBaseline(String? parseTextBaselineString) =>
    parseEnum('textBaseline', parseTextBaselineString) as TextBaseline;

String exportTextBaseline(TextBaseline textBaseline) =>
    exportEnum(textBaseline);

VerticalDirection parseVerticalDirection(String? verticalDirectionString) =>
    parseEnum('verticalDirection', verticalDirectionString)
        as VerticalDirection;

String exportVerticalDirection(VerticalDirection verticalDirection) =>
    exportEnum(verticalDirection);

BlendMode? parseBlendMode(String? blendModeString) {
  if (blendModeString == null || blendModeString.trim().length == 0) {
    return null;
  }
  return parseEnum('blendMode', blendModeString.trim()) as BlendMode;
}

String? exportBlendMode(BlendMode? blendMode) {
  if (blendMode == null) {
    return null;
  }
  return exportEnum(blendMode);
}

BoxFit? parseBoxFit(String? boxFitString) =>
    parseEnum('boxFit', boxFitString) as BoxFit;

String exportBoxFit(BoxFit? boxFit) => exportEnum(boxFit);

ImageRepeat? parseImageRepeat(String? imageRepeatString) {
  if (imageRepeatString == null) {
    return null;
  }
  return parseEnum('imageRepeat', imageRepeatString) as ImageRepeat;
}

String exportImageRepeat(ImageRepeat imageRepeat) => exportEnum(imageRepeat);

Rect? parseRect(String? fromLTRBString) {
  if (fromLTRBString == null) {
    return null;
  }
  var strings = fromLTRBString.split(',');
  return Rect.fromLTRB(double.parse(strings[0]), double.parse(strings[1]),
      double.parse(strings[2]), double.parse(strings[3]));
}

String exportRect(Rect rect) {
  return "${rect.left},${rect.top},${rect.right},${rect.bottom}";
}

FilterQuality? parseFilterQuality(String? filterQualityString) {
  if (filterQualityString == null) {
    return null;
  }
  return parseEnum('filterQuality', filterQualityString) as FilterQuality;
}

String exportFilterQuality(FilterQuality filterQuality) =>
    exportEnum(filterQuality);

String? getLoadMoreUrl(String? url, int currentNo, int? pageSize) {
  if (url == null) {
    return null;
  }

  url = url.trim();
  if (url.contains("?")) {
    url = url +
        "&startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  } else {
    url = url +
        "?startNo=" +
        currentNo.toString() +
        "&pageSize=" +
        pageSize.toString();
  }
  return url;
}

StackFit? parseStackFit(String? value) {
  if (value == null) return null;
  return parseEnum('stackFit', value) as StackFit;
}

String exportStackFit(StackFit stackFit) => exportEnum(stackFit);

Clip? parseClip(String? value) {
  if (value == null) {
    return null;
  }
  return parseEnum('clip', value) as Clip;
}

String exportClip(Clip clip) {
  return exportEnum(clip);
}

Axis parseAxis(String? axisString) => parseEnum('axis', axisString) as Axis;

String exportAxis(Axis axis) => exportEnum(axis);

//WrapAlignment
WrapAlignment parseWrapAlignment(String? wrapAlignmentString) =>
    parseEnum('wrapAlignment', wrapAlignmentString) as WrapAlignment;

String exportWrapAlignment(WrapAlignment wrapAlignment) =>
    exportEnum(wrapAlignment);

//WrapCrossAlignment
WrapCrossAlignment parseWrapCrossAlignment(String? wrapCrossAlignmentString) =>
    parseEnum('wrapCrossAlignment', wrapCrossAlignmentString)
        as WrapCrossAlignment;

String exportWrapCrossAlignment(WrapCrossAlignment wrapCrossAlignment) =>
    exportEnum(wrapCrossAlignment);

// TODO: duplicate
Clip parseClipBehavior(String? clipBehaviorString) {
  if (clipBehaviorString == null) {
    return Clip.antiAlias;
  }
  switch (clipBehaviorString) {
    case "antiAlias":
      return Clip.antiAlias;
    case "none":
      return Clip.none;
    case "hardEdge":
      return Clip.hardEdge;
    case "antiAliasWithSaveLayer":
      return Clip.antiAliasWithSaveLayer;
  }
  return Clip.antiAlias;
}

String exportClipBehavior(Clip clip) {
  if (clip == Clip.antiAliasWithSaveLayer) {
    return "antiAliasWithSaveLayer";
  }

  if (clip == Clip.hardEdge) {
    return "hardEdge";
  }

  if (clip == Clip.none) {
    return "none";
  }

  return "antiAlias";
}

DropCapMode? parseDropCapMode(String? value) {
  if (value == null) {
    return null;
  }
  return parseEnum('dropCapMode', value) as DropCapMode;
}

String? exportDropCapMod(DropCapMode? mode) {
  if (mode == null) return null;
  return exportEnum(mode);
}

DropCapPosition? parseDropCapPosition(String? value) {
  if (value == null) return null;
  return parseEnum('dropCapPosition', value) as DropCapPosition;
}

String exportDropCapPosition(DropCapPosition? dropCapPosition) =>
    exportEnum(dropCapPosition);

DropCap? parseDropCap(Map<String, dynamic>? map, BuildContext buildContext,
    ClickListener? listener) {
  if (map == null) {
    return null;
  }
  return DropCap(
    width: map['width']?.toDouble(),
    height: map['height']?.toDouble(),
    child:
        DynamicWidgetBuilder.buildFromMap(map["child"], buildContext, listener),
  );
}

Map<String, dynamic>? exportDropCap(
    DropCap? dropCap, BuildContext? buildContext) {
  if (dropCap == null) {
    return null;
  }
  return <String, dynamic>{
    "width": dropCap.width,
    "height": dropCap.height,
    "child": DynamicWidgetBuilder.export(dropCap.child, buildContext),
  };
}

String exportAlignmentDirectional(AlignmentDirectional alignmentDirectional) {
  if (alignmentDirectional == AlignmentDirectional.bottomCenter) {
    return "bottomCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.center) {
    return "center";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomEnd) {
    return "bottomEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomStart) {
    return "bottomStart";
  }

  if (alignmentDirectional == AlignmentDirectional.centerEnd) {
    return "centerEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.centerStart) {
    return "centerStart";
  }

  if (alignmentDirectional == AlignmentDirectional.bottomCenter) {
    return "bottomCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.topCenter) {
    return "topCenter";
  }

  if (alignmentDirectional == AlignmentDirectional.topEnd) {
    return "topEnd";
  }

  if (alignmentDirectional == AlignmentDirectional.topStart) {
    return "topStart";
  }

  return "topStart";
}

String exportAlignment(Alignment? alignment) {
  if (alignment == null) {
    return "center";
  }
  if (alignment == Alignment.center) {
    return "center";
  }
  if (alignment == Alignment.bottomRight) {
    return "bottomRight";
  }
  if (alignment == Alignment.bottomCenter) {
    return "bottomCenter";
  }
  if (alignment == Alignment.bottomLeft) {
    return "bottomLeft";
  }
  if (alignment == Alignment.centerLeft) {
    return "centerLeft";
  }
  if (alignment == Alignment.centerRight) {
    return "centerRight";
  }
  if (alignment == Alignment.topCenter) {
    return "topCenter";
  }
  if (alignment == Alignment.topLeft) {
    return "topLeft";
  }
  if (alignment == Alignment.topRight) {
    return "topRight";
  }
  if (alignment == Alignment.bottomRight) {
    return "bottomRight";
  }

  return "center";
}

Map<String, dynamic> exportConstraints(BoxConstraints constraints) {
  return {
    'minWidth': constraints.minWidth,
    'maxWidth': constraints.maxWidth == double.infinity
        ? infinity
        : constraints.maxWidth,
    'minHeight': constraints.minHeight,
    'maxHeight': constraints.maxHeight == double.infinity
        ? infinity
        : constraints.maxHeight,
  };
}

/// BorderSide
Map<String, dynamic>? exportBorderSide(BorderSide borderSide) {
  if (borderSide == BorderSide.none) {
    return null;
  }
  return <String, dynamic>{
    "color": borderSide.color.value.toRadixString(16),
    "width": borderSide.width,
    "style": borderSide.style.index,
  };
}

BorderSide parseBorderSide(Map<String, dynamic>? map) {
  if (map == null) return BorderSide.none;
  if (!map.containsKey('color')) return BorderSide.none;
  return BorderSide(
    color: parseHexColor(map['color'])!,
    width: map['width'] ?? 0,
    style: BorderStyle.values[map['style']],
  );
}

/// BorderRadius
String exportBorderRadius(BorderRadius radius) {
  return "${exportRadius(radius.topLeft)},${exportRadius(radius.topRight)},${exportRadius(radius.bottomRight)},${exportRadius(radius.bottomLeft)}";
}

BorderRadius parseBorderRadius(String radius) {
  final values = radius.split(',');
  if (values.length == 4) {
    return BorderRadius.only(
      topLeft: parseRadius(values[0]),
      topRight: parseRadius(values[1]),
      bottomRight: parseRadius(values[2]),
      bottomLeft: parseRadius(values[3]),
    );
  } else {
    return BorderRadius.zero;
  }
}

/// Radius
String exportRadius(Radius radius) {
  return "${radius.x}:${radius.y}";
}

Radius parseRadius(String radius) {
  final values = radius.split(':');
  if (values.length == 2) {
    return Radius.elliptical(double.parse(values[0]), double.parse(values[1]));
  } else {
    return Radius.zero;
  }
}
