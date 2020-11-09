import 'package:flutter/widgets.dart';

class DynamicWidgetJsonBuilder extends StatelessWidget {

  Widget child;


  DynamicWidgetJsonBuilder({
    Key key,
    Widget child,
  }) :
    this.child = child, super(key: key);

  @override
  Widget build(BuildContext context) {
    context.visitChildElements((element) {
      var widget = element.widget;
      print(widget.runtimeType);
    });
    return child;
  }
}
