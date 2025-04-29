import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';

class RepaintBoundaryWidgetParser extends WidgetParser {
  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    final String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    final widget = RepaintBoundary(
      child: DynamicWidgetBuilder.buildFromMap(
        map["child"],
        buildContext,
        listener,
      ),
    );

    if (listener != null && (clickEvent != null && clickEvent.isNotEmpty)) {
      return GestureDetector(
        onTap: () {
          listener.onClicked(clickEvent);
        },
        child: widget,
      );
    }
    return widget;
  }

  @override
  String get widgetName => "RepaintBoundary";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    return <String, dynamic>{"type": widgetName};
  }

  @override
  Type get widgetType => RepaintBoundary;

  @override
  bool matchWidgetForExport(Widget? widget) {
    return widget is RepaintBoundary;
  }
}
