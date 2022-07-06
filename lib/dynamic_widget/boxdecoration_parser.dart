import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

/// BoxDecoration currently only supports network image
BoxDecoration? parseBoxDecoration(String? boxDecoration) {
  if (boxDecoration == null) {
    return null;
  }
  Map<String, dynamic> map = json.decode(boxDecoration);
  List border = map['border'].split(',');

  return BoxDecoration(
      color: parseHexColor(map['color']),
      // TODO: Implement image in decoration when needed
      // image: map['image'] == null ? null : NetworkImage(src),
      border: Border(
        left: parseBorderSide(map),
        top: parseBorderSide(map),
        right: parseBorderSide(map),
        bottom: parseBorderSide(map),
      ),
      borderRadius: parseBorderRadius(map['borderRadius']));
}

String? exportBoxDecoration(BoxDecoration? decoration) {
  if (decoration == null) {
    return null;
  }
  var border = decoration.border as Border;
  BorderSide? bottom = decoration.border?.bottom;
  BorderSide? top = decoration.border?.top;
  BorderSide? left = border.left;
  BorderSide? right = border.right;
  // TODO: Implement Image when needed
  // NetworkImage image = decoration.image as NetworkImage;
  // var right = decoration.border?.;
  Map<String, dynamic> map = {
    "color": decoration.color != null
        ? decoration.color!.value.toRadixString(16)
        : null,
    // "image": image.url,
    "border": decoration.border != null
        ? {
            "bottom": bottom != null ? exportBorderSide(bottom) : null,
            "top": top != null ? exportBorderSide(top) : null,
            "left": bottom != null ? exportBorderSide(left) : null,
            "right": bottom != null ? exportBorderSide(right) : null,
          }
        : null,
    "borderRadius": exportBorderRadius(decoration.borderRadius as BorderRadius)
  };

  {}
  return json.encode(map);
}
