library dynamic_widget;

import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget/basic/align_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/aspectratio_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/baseline_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/button_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/center_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/container_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/expanded_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/fittedbox_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/image_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/indexedstack_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/opacity_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/padding_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/placeholder_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/row_column_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/sizedbox_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/stack_positioned_widgets_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/text_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/wrap_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/gridview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/listview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/pageview_widget_parser.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import 'dynamic_widget/basic/cliprrect_widget_parser.dart';
import 'dynamic_widget/basic/text_field_widget_parser.dart';

class DynamicWidgetBuilder {
  static final Logger log = Logger('DynamicWidget');

  static final _parsers = [
    ContainerWidgetParser(),
    TextWidgetParser(),
    RaisedButtonParser(),
    RowWidgetParser(),
    ColumnWidgetParser(),
    AssetImageWidgetParser(),
    NetworkImageWidgetParser(),
    PlaceholderWidgetParser(),
    GridViewWidgetParser(),
    ListViewWidgetParser(),
    PageViewWidgetParser(),
    ExpandedWidgetParser(),
    PaddingWidgetParser(),
    CenterWidgetParser(),
    AlignWidgetParser(),
    AspectRatioWidgetParser(),
    FittedBoxWidgetParser(),
    BaselineWidgetParser(),
    StackWidgetParser(),
    PositionedWidgetParser(),
    IndexedStackWidgetParser(),
    ExpandedSizedBoxWidgetParser(),
    SizedBoxWidgetParser(),
    OpacityWidgetParser(),
    WrapWidgetParser(),
    ClipRRectWidgetParser(),
    TextFieldWidgetParser()
  ];

  // use this method for adding your custom widget parser
  static void addParser(WidgetParser parser) {
    log.info(
        "add custom widget parser, make sure you don't overwirte the widget type.");
    _parsers.add(parser);
  }

  Widget build(String json, BuildContext buildContext, WidgetParserCompanion widgetParserCompanion) {
    print("print widget 2");
    var map = jsonDecode(json);
    if(widgetParserCompanion == null) widgetParserCompanion = WidgetParserCompanion();
    widgetParserCompanion.clickListener =
        widgetParserCompanion.clickListener == null ? new NonResponseWidgetClickListener() : widgetParserCompanion.clickListener;
    var widget = buildFromMap(map, buildContext, widgetParserCompanion);
    return widget;
  }

  static Widget buildFromMap(Map<String, dynamic> map,
      BuildContext buildContext, WidgetParserCompanion widgetParserCompanion) {
    String widgetName = map['type'];

    for (var parser in _parsers) {
      if (parser.forWidget(widgetName)) {
        return parser.parse(map, buildContext, widgetParserCompanion);
      }
    }
    log.warning("Not support type: $widgetName");
    return null;
  }

  static List<Widget> buildWidgets(
      List<dynamic> values, BuildContext buildContext, WidgetParserCompanion widgetParserCompanion) {
    List<Widget> rt = [];
    for (var value in values) {
      rt.add(buildFromMap(value, buildContext, widgetParserCompanion));
    }
    return rt;
  }
}

/// extends this class to make a Flutter widget parser.
abstract class WidgetParser {
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      WidgetParserCompanion widgetParserCompanion);

  /// check the matched widget type. for example:
  /// {"type" : "Text", "data" : "Denny"}
  /// if you want to make a flutter Text widget, you should implement this
  /// method as "Text" == widgetName, for more details, please see
  /// @TextWidgetParser
  bool forWidget(String widgetName);
}

abstract class ClickListener {
  void onClicked(String event);
}

abstract class OnTextChangeListener {
  void onTextChange(String textFieldId, String text);
}

class NonResponseWidgetClickListener implements ClickListener {
  static final Logger log = Logger('NonResponseWidgetClickListener');

  @override
  void onClicked(String event) {
    log.info("receiver click event: " + event);
    print("receiver click event: " + event);
  }
}

class WidgetParserCompanion {
  ClickListener clickListener;
  Function(String,String) onTextChange;
  Map<String, TextEditingController> textEditingController;
}