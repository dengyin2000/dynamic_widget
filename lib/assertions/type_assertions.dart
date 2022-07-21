import 'assert_constants.dart';

class TypeAssertions {
  String widgetName;
  String subWidget = '';

  TypeAssertions(this.widgetName);

  /// convert a string to be logged in red color
  String toWarning(String s) {
    return '\x1B[31m$s\x1B[0m';
  }

  void assertInt(dynamic v) {
    String msg =
      "$widgetName:$subWidget: Expecting int as type, but found ${v.runtimeType}";

  bool condition = true;
    try {
      if(v==null) {
        condition = true;
      } else {
        if (v is String) {
          int.parse(v);
        } else {
          condition = v is int;
        }
      }
    } catch (e) {
      condition = false;
    }
    assert(condition, toWarning(msg));
  }

  void assertDouble(dynamic v) {
    String msg =
        "$widgetName:$subWidget: Expecting double as type, but found ${v.runtimeType}";

    bool condition = true;
    try {
      if(v==null) {
        condition = true;
      } else {
        if (v is String) {
          double.parse(v);
        } else {
          condition = v is double;
        }
      }
    } catch (e) {
      condition = false;
    }
    assert(condition, toWarning(msg));
  }

  /// Assert type check of values of [map] at current level
  /// runs assertions on given [map].
  /// [attribute] is key of [map] on which assertion has to be performed
  /// [expectedType] is expected runtime type
  /// [allowNull] should allow null for this [attribute]
  void run(
      {required Map<String, dynamic> map,
      required String attribute,
      required String expectedType,
      bool allowNull = true}) {
    if (!allowNull && map[attribute] == null) {
      assert(
          false,
          toWarning(
              "${widgetName}WidgetParser:$subWidget: For $attribute null is not allowed"));
      return;
    }

    String msg =
        "${widgetName}WidgetParser:$subWidget: Expecting $attribute as type of $expectedType but found ${map[attribute].runtimeType}";
    bool condition = true;

    switch (expectedType) {
      case TYPE_BOOL:
        condition = map[attribute] == null || map[attribute] is bool;
        break;
      case TYPE_STRING:
        condition = map[attribute] == null || map[attribute] is String;
        break;
      case TYPE_MAP:
        condition = map[attribute] == null || map[attribute] is Map;
        break;
      case TYPE_LIST:
        condition = map[attribute] == null || map[attribute] is List;
        break;
      case TYPE_INT:
        condition = map[attribute] == null || map[attribute] is int;
        break;
      case TYPE_DOUBLE:
        condition = map[attribute] == null || map[attribute] is double;
        break;
      case TYPE_STRINGED_MAP:
        condition = map[attribute] == null ||
            map[attribute] is String ||
            map[attribute] is Map;
        break;
      case TYPE_STRINGED_INT:
        try {
          if(map[attribute]==null) {
            condition = true;
          } else {
            if (map[attribute] is String) {
              int.parse(map[attribute]);
            } else {
              condition = map[attribute] is int;
            }
          }
        } catch (e) {
          condition = false;
        }
        break;
      case TYPE_STRINGED_DOUBLE:
        try {
          if(map[attribute]==null) {
            condition = true;
          } else {
            if (map[attribute] is String) {
              double.parse(map[attribute]).toDouble();
            } else {
              condition = map[attribute] is double;
            }
          }
        } catch (e) {
          condition = false;
        }
        break;
    }
    assert(condition, toWarning(msg));
  }
}
