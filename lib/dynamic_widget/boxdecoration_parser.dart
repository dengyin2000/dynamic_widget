import 'dart:convert';

import 'package:dynamic_widget/assertions/assert_constants.dart';
import 'package:dynamic_widget/assertions/type_assertions.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

/// BoxDecoration currently only supports network image
BoxDecoration? parseBoxDecoration(Map<String, dynamic>? boxDecoration) {
  if (boxDecoration == null) {
    return null;
  }

  var typeAssertions = TypeAssertions('BoxDecoration');
  typeAssertions.run(map: boxDecoration, attribute: 'border', expectedType: TYPE_MAP);
  typeAssertions.run(map: boxDecoration, attribute: 'color', expectedType: TYPE_STRING);
  typeAssertions.run(map: boxDecoration, attribute: 'borderRadius', expectedType: TYPE_STRING);

  var border = boxDecoration['border'];

  typeAssertions.run(map: border, attribute: 'left', expectedType: TYPE_MAP);
  typeAssertions.run(map: border, attribute: 'top', expectedType: TYPE_MAP);
  typeAssertions.run(map: border, attribute: 'right', expectedType: TYPE_MAP);
  typeAssertions.run(map: border, attribute: 'bottom', expectedType: TYPE_MAP);

  print(border);
  BoxDecoration _boxDecoration = BoxDecoration(
      color: parseHexColor(boxDecoration['color']),
      // TODO: Implement image in decoration when needed
      // image: map['image'] == null ? null : NetworkImage(src),
      border: Border(
        left: parseBorderSide(border['left']),
        top: parseBorderSide(border['top']),
        right: parseBorderSide(border['right']),
        bottom: parseBorderSide(border['bottom']),
      ),
      borderRadius: parseBorderRadius(boxDecoration['borderRadius']));
  return _boxDecoration;
}

Map<String, dynamic>? exportBoxDecoration(BoxDecoration? decoration) {
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

  return map;
}
