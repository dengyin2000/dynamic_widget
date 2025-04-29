import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

class ColoredBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    Color color = parseHexColor(map['color'])!;

    final String? clickEvent =
        map.containsKey("click_event") ? map['click_event'] : "";

    final widget = ColoredBox(
      color: color,
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
  String get widgetName => "ColoredBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as ColoredBox;
    return <String, dynamic>{
      "type": widgetName,
      "color": realWidget.color.toARGB32().toRadixString(16),
    };
  }

  @override
  Type get widgetType => ColoredBox;

  @override
  bool matchWidgetForExport(Widget? widget) {
    return widget is ColoredBox;
  }
}
