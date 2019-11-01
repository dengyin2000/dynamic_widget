import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFieldWidgetParser implements WidgetParser {
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion) {
    String id = map['id'];
    TextEditingController textEditingController = TextEditingController();
    widgetParserCompanion.textEditingController.putIfAbsent(id, () {
      return textEditingController;
    });
    return TextField(
        controller: widgetParserCompanion.textEditingController[id],
        style: TextStyle(color: parseHexColor(map['textColor'])),
        onChanged: (text) => widgetParserCompanion?.onTextChange(id, text));
  }

  bool forWidget(String widgetName) {
    return "TextField" == widgetName;
  }
}
