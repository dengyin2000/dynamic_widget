library dynamic_widget;

import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget/basic/align_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/appbar_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/aspectratio_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/baseline_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/button_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/card_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/center_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/container_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/divider_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dropcaptext_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/expanded_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/fittedbox_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/flex_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/flexible_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/icon_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/image_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/indexedstack_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/inkwell_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/limitedbox_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/listtile_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/offstage_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/opacity_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/padding_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/placeholder_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/readmoretext_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/row_column_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/safearea_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/scaffold_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/selectabletext_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/sizedbox_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/stack_positioned_widgets_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/textFormField_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/text_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/textfield_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/visiblity_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/basic/wrap_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/gridview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/listview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/pageview_widget_parser.dart';
import 'package:dynamic_widget/dynamic_widget/scrolling/single_child_scroll_view_widget_parser.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import 'dynamic_widget/basic/cliprrect_widget_parser.dart';
import 'dynamic_widget/basic/overflowbox_widget_parser.dart';
import 'dynamic_widget/basic/rotatedbox_widget_parser.dart';
import 'new_widget_parser.dart';

extension BoolParsing on String {
  bool parseBoolStrict() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw '"$this" can not be parsed to boolean.';
  }

  bool? parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    } else {
      return null;
    }
  }
}

class DynamicWidgetBuilder {
  static final Logger log = Logger('DynamicWidget');

  static final _parsers = [
    ContainerWidgetParser(),
    TextWidgetParser(),
    SelectableTextWidgetParser(),
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
    DropCapTextParser(),
    IconWidgetParser(),
    ClipRRectWidgetParser(),
    SafeAreaWidgetParser(),
    ListTileWidgetParser(),
    ScaffoldWidgetParser(),
    AppBarWidgetParser(),
    LimitedBoxWidgetParser(),
    OffstageWidgetParser(),
    OverflowBoxWidgetParser(),
    ElevatedButtonParser(),
    DividerWidgetParser(),
    TextButtonParser(),
    RotatedBoxWidgetParser(),
    CardParser(),
    SingleChildScrollViewParser(),
    ReadMoreTextParser(),
    InkwellWidgetParser(),
    FlexWidgetParser(),
    FlexibleWidgetParser(),
    TextFieldWidgetParser(),
    TextFormFieldWidgetParser(),
    VisibilityWidgetParser(),
  ];

  static final _widgetNameParserMap = <String, NewWidgetParser>{};

  static bool _defaultParserInited = false;

  // use this method for adding your custom widget parser
  static void addParser(NewWidgetParser parser) {
    log.info(
        "add custom widget parser, make sure you don't overwirte the widget type.");
    _parsers.add(parser);
    _widgetNameParserMap[parser.widgetName] = parser;
  }

  static void initDefaultParsersIfNess() {
    if (!_defaultParserInited) {
      for (var parser in _parsers) {
        _widgetNameParserMap[parser.widgetName] = parser;
      }
      _defaultParserInited = true;
    }
  }

  static Widget? build(
      String json, BuildContext buildContext, EventListener? listener) {
    initDefaultParsersIfNess();
    try {
      var map = jsonDecode(json);
      if (listener == null) listener = EventListener();
      listener.clickListener = listener.clickListener == null
          ? NonResponseWidgetClickListener()
          : listener.clickListener;
      var widget = buildFromMap(map, buildContext, listener);
      return widget;
    } on FormatException catch (e) {
      print("DynamicWidgetBuilder.build - Invalid JSON - $e");
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Widget? buildFromMap(Map<String, dynamic>? map,
      BuildContext buildContext, EventListener? listener,
      {Widget? child}) {
    initDefaultParsersIfNess();
    if (child != null) {
      return child;
    }
    try {
      if (map == null) {
        return null;
      }
      String? widgetName = map['type'];
      if (widgetName == null) {
        return null;
      }
      print('--' * 100);
      var parser = _widgetNameParserMap[widgetName];
      print(parser);
      if (parser != null) {
        return getParsedWidget(parser, map, buildContext, listener);
      }
      log.warning("Not support parser type: $widgetName");
      return null;
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  static Widget getParsedWidget(
      NewWidgetParser parser,
      Map<String, dynamic> map,
      BuildContext buildContext,
      EventListener? listener) {
    // assertion checks should be called before parse method of parser.
    parser.assertionChecks(map);
    return parser.parse(map, buildContext, listener);
  }

  static List<Widget> buildWidgets(List<dynamic> values,
      BuildContext buildContext, EventListener? listener) {
    initDefaultParsersIfNess();
    List<Widget> rt = [];
    for (var value in values) {
      assert(value == null || value is Map<String, dynamic>,
          "Build Widgets: Expecting Map<String, dynamic> but found ${value.runtimeType} at index ${values.indexOf(value)}");
      var buildFromMap2 = buildFromMap(value, buildContext, listener);
      if (buildFromMap2 != null) {
        rt.add(buildFromMap2);
      }
    }
    return rt;
  }

  static Map<String, dynamic>? export(
      Widget? widget, BuildContext? buildContext) {
    initDefaultParsersIfNess();
    var parser = _findMatchedWidgetParserForExport(widget);
    if (parser != null) {
      return parser.export(widget, buildContext);
    }
    log.warning(
        "Can't find NewWidgetParser for Type ${widget.runtimeType} to export.");
    return null;
  }

  static List<Map<String, dynamic>?> exportWidgets(
      List<Widget?> widgets, BuildContext? buildContext) {
    initDefaultParsersIfNess();
    List<Map<String, dynamic>?> rt = [];
    for (var widget in widgets) {
      rt.add(export(widget, buildContext));
    }
    return rt;
  }

  static NewWidgetParser? _findMatchedWidgetParserForExport(Widget? widget) {
    try {
      for (var parser in _parsers) {
        if (parser.matchWidgetForExport(widget)) {
          return parser;
        }
      }
      return null;
    } catch (e) {
      print('--' * 100);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }
}

/// extends this class to make a Flutter widget parser.
abstract class WidgetParser {
  /// parse the json map into a flutter widget.
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener listener);

  /// the widget type name for example:
  /// {"type" : "Text", "data" : "Denny"}
  /// if you want to make a flutter Text widget, you should implement this
  /// method return "Text", for more details, please see
  /// @TextWidgetParser
  String get widgetName;

  /// export the runtime widget to json
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext);

  /// match current widget
  Type get widgetType;

  bool matchWidgetForExport(Widget? widget) => widget.runtimeType == widgetType;
}

abstract class ClickListener {
  void onClicked(String? event);
}

class EventListener {
  ClickListener? clickListener;
  Function(String, String)? onTextChange;
  Map<String, TextEditingController>? textEditingController;
  Map<String, ValueNotifier<Object?>>? valueListenable;

  EventListener(
      {Map<String, TextEditingController>? textEditingController,
      Function(String, String)? onTextChange})
      : this.textEditingController = textEditingController ?? {} {
    this.onTextChange = onTextChange ?? f;
  }

  void f(String s, String v) {}
}

class NonResponseWidgetClickListener implements ClickListener {
  static final Logger log = Logger('NonResponseWidgetClickListener');

  @override
  void onClicked(String? event) {
    log.info("receiver click event: " + event!);
    print("receiver click event: " + event);
  }
}
