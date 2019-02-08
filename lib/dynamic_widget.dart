library dynamic_widget;


import 'package:dynamic_widget/dynamic_widget/basic/button_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/container_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/image_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/placeholder_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/row_column_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/text_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/gridview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/listview_widget_parser.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:logging/logging.dart';

class DynamicWidgetBuilder{

  static final Logger log = Logger('DynamicWidget');

  static final parsers = [
    ContainerWidgetParser(),
    TextWidgetParser(),
    RaisedButtonParser(),
    RowWidgetParser(),
    ColumnWidgetParser(),
    AssetImageWidgetParser(),
    NetworkImageWidgetParser(),
    FileImageWidgetParser(),
    PlaceholderWidgetParser(),
    GridViewWidgetParser(),
    ListViewWidgetParser()
  ];


  Widget build(String json){

    var map = jsonDecode(json);
    return buildFromMap(map);
  }

  static Widget buildFromMap(Map<String, dynamic> map){
    String widgetName = map['type'];

    for (var parser in parsers) {
      if (parser.forWidget(widgetName)) {
        return parser.parse(map);
      }
    }

    log.warning("Not support type: $widgetName");
    return null;
  }

  static List<Widget> buildWidgets(List<dynamic> values){
    List<Widget> rt = [];
    for (var value in values) {
      rt.add(buildFromMap(value));
    }
    return rt;
  }
}


/// extends this class to make a Flutter widget parser.
abstract class WidgetParser{

  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map);

  /// check the matched widget type. for example:
  /// {"type" : "Text", "data" : "Denny"}
  /// if you want to make a flutter Text widget, you should implement this
  /// method as "Text" == widgetName, for more details, please see
  /// @TextWidgetParser
  bool forWidget(String widgetName);
}