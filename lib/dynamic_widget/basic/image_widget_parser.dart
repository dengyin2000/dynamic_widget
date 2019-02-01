
import 'dart:ui';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class AssetImageWidgetParser extends WidgetParser{
  @override
  bool forWidget(String widgetName) {
    return "AssetImage" == widgetName;
  }

  @override
  Widget parse(Map<String, dynamic> map) {

    String name = map['name'];
    String semanticLabel = map.containsKey('semanticLabel') ? map['semanticLabel'] : null;
    double width = map.containsKey('width') ? map['width'] : null;
    double height = map.containsKey('height') ? map['height'] : null;
    Color color = map.containsKey('color') ? parseHexColor(map['color']):null;
    BlendMode blendMode = map.containsKey('blendMode') ? parseBlendMode(map['blendMode']) : null;
    BoxFit boxFit = map.containsKey('boxFit') ? parseBoxFit(map['boxFit']) : null;
    Alignment alignment = map.containsKey('alignment') ? parseAlignment(map['alignment']) : Alignment.center;
    ImageRepeat repeat = map.containsKey('repeat') ? parseImageRepeat(map['repeat']) : ImageRepeat.noRepeat;
    Rect centerSlice = map.containsKey('centerSlice') ? parseRect(map['centerSlice']) : null;
    bool matchTextDirection = map.containsKey('matchTextDirection') ? map['matchTextDirection'] : false;
    bool gaplessPlayback = map.containsKey('gaplessPlayback') ? map['gaplessPlayback'] : false;
    FilterQuality filterQuality = map.containsKey('filterQuality') ? parseFilterQuality(map['filterQuality']) : FilterQuality.low;
    return Image.asset(
      name,
      semanticLabel: semanticLabel,
      width: width,
      height: height,
      color: color,
      colorBlendMode: blendMode,
      fit: boxFit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      filterQuality: filterQuality,
    );
  }

}