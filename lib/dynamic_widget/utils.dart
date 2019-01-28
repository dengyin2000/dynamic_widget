import 'dart:ui';

import 'package:flutter/widgets.dart';

TextAlign parseTextAlign(String textAlignString){
  TextAlign textAlign = TextAlign.left;
  switch(textAlignString){
    case "left":
      textAlign = TextAlign.left;
      break;
    case "right":
      textAlign = TextAlign.right;
      break;
    case "center":
      textAlign = TextAlign.right;
      break;
    case "justify":
      textAlign = TextAlign.justify;
      break;
    case "start":
      textAlign = TextAlign.start;
      break;
    case "end":
      textAlign = TextAlign.end;
      break;
    default:
      textAlign = TextAlign.left;
  }
  return textAlign;
}

TextOverflow parseTextOverflow(String textOverflowString){
  TextOverflow textOverflow = TextOverflow.ellipsis;
  switch(textOverflowString){
    case "ellipsis":
      textOverflow = TextOverflow.ellipsis;
      break;
    case "clip":
      textOverflow = TextOverflow.clip;
      break;
    case "fade":
      textOverflow = TextOverflow.fade;
      break;
    default:
      textOverflow = TextOverflow.fade;
  }
  return textOverflow;
}

TextDirection parseTextDirection(String textDirectionString){
  TextDirection textDirection = TextDirection.ltr;
  switch(textDirectionString){
    case 'ltr':
      textDirection = TextDirection.ltr;
      break;
    case 'rtl':
      textDirection = TextDirection.rtl;
      break;
    default:
      textDirection = TextDirection.ltr;
  }
  return textDirection;
}

Color parseHexColor(String hexColorString){
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


TextStyle parseTextStyle(Map<String, dynamic> map){
  String color = map['color'];
  String debugLabel = map['debugLabel'];
  String fontFamily = map['fontFamily'];
  double fontSize = map['fontSize'];
  FontStyle fontStyle = 'italic' == map['fontStyle'] ? FontStyle.italic: FontStyle.normal;

  return TextStyle(color: parseHexColor(color), debugLabel: debugLabel, fontSize: fontSize, fontFamily: fontFamily, fontStyle: fontStyle);
}

Alignment parseAlignment(String alignmentString){
  Alignment alignment = Alignment.topLeft;
  switch(alignmentString){
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

BoxConstraints parseBoxConstraints(Map<String, dynamic> map){
  double minWidth = 0.0;
  double maxWidth = double.infinity;
  double minHeight = 0.0;
  double maxHeight = double.infinity;

  if (map != null) {
    if (map.containsKey('minWidth')) {
      var minWidthValue = map['minWidth'];

      if (minWidthValue != null) {
        if (minWidthValue >= infinity) {
          minWidth = double.infinity;
        } else {
          minWidth = minWidthValue;
        }
      }
    }

    if (map.containsKey('maxWidth')) {
      var maxWidthValue = map['maxWidth'];

      if (maxWidthValue != null) {
        if (maxWidthValue >= infinity) {
          maxWidth = double.infinity;
        } else {
          maxWidth = maxWidthValue;
        }
      }
    }

    if (map.containsKey('minHeight')) {
      var minHeightValue = map['minHeight'];

      if (minHeightValue != null) {
        if (minHeightValue >= infinity) {
          minHeight = double.infinity;
        } else {
          minHeight = minHeightValue;
        }
      }
    }

    if (map.containsKey('maxHeight')) {
      var maxHeightValue = map['maxHeight'];

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

EdgeInsetsGeometry parseEdgeInsetsGeometry(String edgeInsetsGeometryString){
  //left,top,right,bottom
  if (edgeInsetsGeometryString == null || edgeInsetsGeometryString.trim() == '') {
    return null;
  }
  var values = edgeInsetsGeometryString.split(",");
  return EdgeInsets.only(left: double.parse(values[0]), top: double.parse(values[1]), right: double.parse(values[2]), bottom: double.parse(values[3]));
}


CrossAxisAlignment parseCrossAxisAlignment(String crossAxisAlignmentString){
  switch(crossAxisAlignmentString){
    case 'start':
      return CrossAxisAlignment.start;
    case 'end':
      return CrossAxisAlignment.end;
    case 'center':
      return CrossAxisAlignment.center;
    case 'stretch':
      return CrossAxisAlignment.stretch;
    case 'baseline':
      return CrossAxisAlignment.baseline;
  }
  return CrossAxisAlignment.center;
}

MainAxisAlignment parseMainAxisAlignment(String mainAxisAlignmentString){
  switch(mainAxisAlignmentString){
    case 'start':
      return MainAxisAlignment.start;
    case 'end':
      return MainAxisAlignment.end;
    case 'center':
      return MainAxisAlignment.center;
    case 'spaceBetween':
      return MainAxisAlignment.spaceBetween;
    case 'spaceAround':
      return MainAxisAlignment.spaceAround;
    case 'spaceEvenly':
      return MainAxisAlignment.spaceEvenly;
  }
  return MainAxisAlignment.start;
}

MainAxisSize parseMainAxisSize(String mainAxisSizeString) => mainAxisSizeString == 'min' ? MainAxisSize.min : MainAxisSize.max;

TextBaseline parseTextBaseline(String parseTextBaselineString) => 'alphabetic' == parseTextBaselineString ? TextBaseline.alphabetic : TextBaseline.ideographic;

VerticalDirection parseVerticalDirection(String verticalDirectionString) => 'up' ==verticalDirectionString? VerticalDirection.up : VerticalDirection.down;


