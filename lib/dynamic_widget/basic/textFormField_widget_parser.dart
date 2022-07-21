import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';

import '../../new_widget_parser.dart';

class TextFormFieldWidgetParser extends NewWidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    // TODO: implement assertionChecks
  }

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    try {
      print("======================== 1");
      TextFormField textFormField = widget as TextFormField;

      print("======================== 2");

      TextField realWidget =
          (textFormField.builder as UnmanagedRestorationScope).child
              as TextField;
      print("======================== 3");
      return {
        "type": widgetName,
        "id": "put-unique-id-here",
        "decoration": exportInputDecoration(realWidget.decoration),
        "textAlign": exportTextAlign(realWidget.textAlign),
        "cursorColor": exportHexColor(realWidget.cursorColor),
      };
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    String id = map['id'];
    Map<String, dynamic>? inputDecoration = map['inputDecoration'];
    TextEditingController textEditingController = TextEditingController();
    listener!.textEditingController?.putIfAbsent(id, () {
      return textEditingController;
    });
    try {
      return TextFormField(
        controller: listener.textEditingController![id],
        onChanged: (text) => listener.onTextChange!(id, text),

        // Key? key,
        // FocusNode? focusNode,
        // InputDecoration? decoration = const InputDecoration(),
        // TextInputType? keyboardType,
        // TextInputAction? textInputAction,
        // TextCapitalization textCapitalization = TextCapitalization.none,
        // TextStyle? style,
        // StrutStyle? strutStyle,
        // TextAlign textAlign = TextAlign.start,
        // TextAlignVertical? textAlignVertical,
        // TextDirection? textDirection,
        // bool readOnly = false,
        // ToolbarOptions? toolbarOptions,
        // bool? showCursor,
        // bool autofocus = false,
        // String obscuringCharacter = '•',
        // bool obscureText = false,
        // bool autocorrect = true,
        // SmartDashesType? smartDashesType,
        // SmartQuotesType? smartQuotesType,
        // bool enableSuggestions = true,
        // int? maxLines = 1,
        // int? minLines,
        // bool expands = false,
        // int? maxLength,
        // MaxLengthEnforcement? maxLengthEnforcement,
        // void Function()? onEditingComplete,
        // void Function(String)? onSubmitted,
        // void Function(String, Map<String, dynamic>)? onAppPrivateCommand,
        // List<TextInputFormatter>? inputFormatters,
        // bool? enabled,
        // double cursorWidth = 2.0,
        // double? cursorHeight,
        // Radius? cursorRadius,
        // BoxHeightStyle selectionHeightStyle = ui.BoxHeightStyle.tight,
        // BoxWidthStyle selectionWidthStyle = ui.BoxWidthStyle.tight,
        // Brightness? keyboardAppearance,
        // EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
        // DragStartBehavior dragStartBehavior = DragStartBehavior.start,
        // bool? enableInteractiveSelection,
        // TextSelectionControls? selectionControls,
        // void Function()? onTap,
        // MouseCursor? mouseCursor,
        // Widget? Function(BuildContext, {required int currentLength, required bool isFocused, required int? maxLength})? buildCounter,
        // ScrollController? scrollController,
        // ScrollPhysics? scrollPhysics,
        // Iterable<String>? autofillHints = const <String>[],
        // Clip clipBehavior = Clip.hardEdge,
        // String? restorationId,
        // bool scribbleEnabled = true,
        // bool enableIMEPersonalizedLearning = true,

        decoration: parseInputDecoration(inputDecoration),
        enabled: true,
        // ! make
        cursorColor: parseHexColor(map['cursorColor']),
        textAlign: parseTextAlign(map['textAlign']),
        // keyboardType: TextInputType.datetime,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        // ],
      );
    } catch (e) {
      print('--' * 100);
      print(map);
      print(e.toString());
      print('--' * 100);
      throw e;
    }
  }

  @override
  String get widgetName => "TextFormField";

  @override
  Type get widgetType => TextFormField;
}

/// !!!!!!!!! convert obejct to string or parseble
Map<String, dynamic>? exportInputDecoration(InputDecoration? inputDecoration) {
  if (inputDecoration == null) {
    return null;
  }
  return {
    // 'icon': inputDecoration.icon,
    'iconColor': inputDecoration.iconColor != null
        ? inputDecoration.iconColor!.value.toRadixString(16)
        : null,
    // 'label': inputDecoration.label,
    'labelText': inputDecoration.labelText, //! String
    // 'labelStyle': inputDecoration.labelStyle,
    // 'floatingLabelStyle': inputDecoration.floatingLabelStyle,
    'helperText': inputDecoration.helperText, //! String
    // 'helperStyle': inputDecoration.helperStyle,
    'helperMaxLines': inputDecoration.helperMaxLines, //! int
    'hintText': inputDecoration.hintText, //! String
    // 'hintStyle': inputDecoration.hintStyle,
    // 'hintTextDirection': inputDecoration.hintTextDirection,
    'hintMaxLines': inputDecoration.hintMaxLines,
    'errorText': inputDecoration.errorText, //! String
    // 'errorStyle': inputDecoration.errorStyle,
    'errorMaxLines': inputDecoration.errorMaxLines, //! int
    // 'floatingLabelBehavior': inputDecoration.floatingLabelBehavior,
    // 'floatingLabelAlignment': inputDecoration.floatingLabelAlignment,
    // 'isCollapsed': inputDecoration.isCollapsed,
    // 'isDense': inputDecoration.isDense,
    'contentPadding':
        exportEdgeInsetsGeometry(inputDecoration.contentPadding as EdgeInsets),
    'prefixIcon': inputDecoration.prefixIcon,
    // 'prefixIconConstraints': ,
    // 'prefix',
    'prefixText': inputDecoration.prefixText, //! String
    // 'prefixStyle',
    'prefixIconColor': inputDecoration.prefixIconColor != null
        ? inputDecoration.prefixIconColor!.value.toRadixString(16)
        : null,
    // 'suffixIcon',
    // 'suffix',
    'suffixText': inputDecoration.suffixText, //! String
    // 'suffixStyle',
    'suffixIconColor': inputDecoration.suffixIconColor != null
        ? inputDecoration.suffixIconColor!.value.toRadixString(16)
        : null,
    // 'suffixIconConstraints',
    // 'counter',
    'counterText': inputDecoration.counterText, //! String
    // 'counterStyle',
    // 'filled',
    'fillColor': inputDecoration.fillColor != null
        ? inputDecoration.fillColor!.value.toRadixString(16)
        : null,
    'focusColor': inputDecoration.focusColor != null
        ? inputDecoration.focusColor!.value.toRadixString(16)
        : null,
    'hoverColor': inputDecoration.hoverColor != null
        ? inputDecoration.hoverColor!.value.toRadixString(16)
        : null,
    // 'errorBorder',
    'focusedBorder':
        (inputDecoration.focusedBorder.runtimeType == OutlineInputBorder)
            ? exportOutlineInputBorder(
                inputDecoration.focusedBorder as OutlineInputBorder)
            : exportUnderlineInputBorder(
                inputDecoration.focusedBorder as UnderlineInputBorder),
    // 'focusedErrorBorder',
    // 'disabledBorder',
    'enabledBorder':
        (inputDecoration.enabledBorder.runtimeType == OutlineInputBorder)
            ? exportOutlineInputBorder(
                inputDecoration.enabledBorder as OutlineInputBorder)
            : exportUnderlineInputBorder(
                inputDecoration.enabledBorder as UnderlineInputBorder),
    // 'border',
    'semanticCounterText': inputDecoration.semanticCounterText, //! string
    'alignLabelWithHint': inputDecoration.alignLabelWithHint,
    // 'constraints': inputDecoration.constraints,
    'enabled': inputDecoration.enabled,
  };
}

InputDecoration? parseInputDecoration(Map<String, dynamic>? inputDecoration) {
  if (inputDecoration == null) {
    return null;
  }
  return InputDecoration(
    // icon: ,
    iconColor: parseHexColor(inputDecoration['iconColor']),
    // label,
    labelText: inputDecoration['labelText'],
    // labelStyle,
    // floatingLabelStyle,
    helperText: inputDecoration['helperText'],
    // helperStyle,
    // helperMaxLines,
    hintText: inputDecoration['helperText'],
    // hintStyle,
    // hintTextDirection,
    // hintMaxLines,
    errorText: inputDecoration['errorText'],
    // errorStyle,
    // errorMaxLines,
    // floatingLabelBehavior,
    // floatingLabelAlignment,
    // isCollapsed = false,
    // isDense,
    // contentPadding, //!
    // prefixIcon,
    // prefixIconConstraints,
    // prefix,
    prefixText: inputDecoration['prefixText'],
    // prefixStyle,
    prefixIconColor: parseHexColor(inputDecoration['prefixIconColor']),
    // suffixIcon,
    // suffix,
    suffixText: inputDecoration['suffixText'],
    // suffixStyle,
    suffixIconColor: parseHexColor(inputDecoration['suffixIconColor']),
    // suffixIconConstraints,
    // counter,
    counterText: inputDecoration['counterText'],
    // counterStyle,
    // filled,
    fillColor: parseHexColor(inputDecoration['fillColor']),
    focusColor: parseHexColor(inputDecoration['focusColor']),
    hoverColor: parseHexColor(inputDecoration['hoverColor']),
    // errorBorder,

    // default is UnderlineInputBorder
    focusedBorder:
        (inputDecoration['focusedBorder']['type'] == 'OutlineInputBorder')
            ? parseOutlineInputBorder(inputDecoration['focusedBorder'])
            : parseUnderlineInputBorder(inputDecoration['focusedBorder']),
    // focusedBorder: parseOutlineInputBorder(inputDecoration['focusedBorder']),
    // focusedErrorBorder,
    // disabledBorder,
    enabledBorder:
        (inputDecoration['focusedBorder']['type'] == 'OutlineInputBorder')
            ? parseOutlineInputBorder(inputDecoration['enabledBorder'])
            : parseUnderlineInputBorder(inputDecoration['enabledBorder']),
    // border,
    semanticCounterText: inputDecoration['semanticCounterText'],
    // alignLabelWithHint,
    // constraints,
    // enabled = true,
  );
}

OutlineInputBorder? parseOutlineInputBorder(
    Map<String, dynamic>? outlineInputBorder) {
  if (outlineInputBorder == null ||
      outlineInputBorder['type'] != 'OutlineInputBorder') {
    return null;
  }
  return OutlineInputBorder(
      borderRadius: parseBorderRadius(outlineInputBorder['borderRadius']),
      borderSide: parseBorderSide(outlineInputBorder['borderSide']),
      gapPadding: outlineInputBorder['gapPadding']);
}

Map<String, dynamic>? exportOutlineInputBorder(
    OutlineInputBorder? outlineInputBorder) {
  if (outlineInputBorder == null) {
    return null;
  }
  return {
    'type': 'OutlineInputBorder',
    'borderRadius': exportBorderRadius(outlineInputBorder.borderRadius),
    'borderSide': exportBorderSide(outlineInputBorder.borderSide),
    'gapPadding': outlineInputBorder.gapPadding
  };
}

UnderlineInputBorder? parseUnderlineInputBorder(
    Map<String, dynamic>? outlineInputBorder) {
  if (outlineInputBorder == null ||
      outlineInputBorder['type'] != 'UnderlineInputBorder') {
    return null;
  }
  return UnderlineInputBorder(
    borderRadius: parseBorderRadius(outlineInputBorder['borderRadius']),
    borderSide: parseBorderSide(outlineInputBorder['borderSide']),
  );
}

Map<String, dynamic>? exportUnderlineInputBorder(
    UnderlineInputBorder? outlineInputBorder) {
  if (outlineInputBorder == null) {
    return null;
  }
  return {
    'type': 'UnderlineInputBorder',
    'borderRadius': exportBorderRadius(outlineInputBorder.borderRadius),
    'borderSide': exportBorderSide(outlineInputBorder.borderSide),
  };
}
