import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Creates a box that will become as large as its parent allows.
class ExpandedSizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return SizedBox.expand(
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "ExpandedSizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    throw UnimplementedError();
  }

  /// user SizedBoxWidgetParser for ExpandedSizedBox
  @override
  Type get widgetType => UnimplementedType;
}

class SizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      ClickListener? listener) {
    return SizedBox(
      width: map["width"] != null ? (map["width"] as double).w : 0.0,
      height: map["height"] != null ? (map["height"] as double).w : 0.0,
      child: DynamicWidgetBuilder.buildFromMap(
          map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "SizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox;
    final sw = ScreenUtil().scaleWidth;
    return <String, dynamic>{
      "type": "SizedBox",
      "width": realWidget.width != null ? realWidget.width! / sw : 0.0,
      "height": realWidget.height != null ? realWidget.height! / sw : 0.0,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SizedBox;
}

class UnimplementedType {}
