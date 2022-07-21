import 'package:flutter/material.dart';

import '../../dynamic_widget.dart';
import '../../new_widget_parser.dart';

class ValueNotifierBuilderWidgetParser extends NewWidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    // TODO: implement export
    throw UnimplementedError();
  }

// Non performant
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    Map<String, dynamic>? childMap = map['child'];
    Map<String, dynamic>? builderMap = map['builder'];
    String value = map['value-id'];
    listener!.valueListenable?.putIfAbsent(value, () {
      return ValueNotifier(value);
    });
    Widget? child = childMap == null
        ? null
        : DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);

    return ValueListenableBuilder(
      valueListenable: listener.valueListenable!['value-id']!,
      builder: ((context, value, child) {
        return DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener, child: child) ?? Container();
      }),
      child:
          DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener),
    );
  }

  @override
  String get widgetName => 'ValueListenableBuilder';

  @override
  Type get widgetType => ValueListenableBuilder;
  
  @override
  void assertionChecks(Map<String, dynamic> map) {
    // TODO: implement assertionChecks
  }
}
