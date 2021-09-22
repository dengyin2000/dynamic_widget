import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionedWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Positioned(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener)!,
      top: map.containsKey("top") ? (map["top"] as double).w : null,
      right: map.containsKey("right") ? (map["right"] as double).w : null,
      bottom: map.containsKey("bottom") ? (map["bottom"] as double).w : null,
      left: map.containsKey("left") ? (map["left"] as double).w : null,
      width: map.containsKey("width") ? (map["width"] as double).w : null,
      height: map.containsKey("height") ? (map["height"] as double).w : null,
    );
  }

  @override
  String get widgetName => "Positioned";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Positioned;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": "Positioned",
      "top": realWidget.top != null ? realWidget.top! / sw : 0.0,
      "right": realWidget.right != null ? realWidget.right! / sw : 0.0,
      "bottom": realWidget.bottom != null ? realWidget.bottom! / sw : 0.0,
      "left": realWidget.left != null ? realWidget.left! / sw : 0.0,
      "width": realWidget.width != null ? realWidget.width! / sw : 0.0,
      "height": realWidget.height != null ? realWidget.height! / sw : 0.0,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Positioned;
}

class StackWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return Stack(
      alignment: map.containsKey("alignment")
          ? parseAlignment(map["alignment"])
          : AlignmentDirectional.topStart,
      textDirection: map.containsKey("textDirection")
          ? parseTextDirection(map["textDirection"])
          : null,
      fit: map.containsKey("fit") ? parseStackFit(map["fit"])! : StackFit.loose,
      clipBehavior: map.containsKey("clipBehavior")
          ? parseClip(map["clipBehavior"])!
          : Clip.hardEdge,
      children: DynamicWidgetBuilder.buildWidgets(
          map['children'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Stack";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Stack;
    return <String, dynamic>{
      "type": "Stack",
      "alignment": realWidget.alignment is AlignmentDirectional
          ? exportAlignmentDirectional(
              realWidget.alignment as AlignmentDirectional)
          : exportAlignment(realWidget.alignment as Alignment),
      "textDirection": exportTextDirection(realWidget.textDirection),
      "fit": exportStackFit(realWidget.fit),
      "clipBehavior": exportClipBehavior(realWidget.clipBehavior),
      "children":
          DynamicWidgetBuilder.exportWidgets(realWidget.children, buildContext)
    };
  }

  @override
  Type get widgetType => Stack;
}
