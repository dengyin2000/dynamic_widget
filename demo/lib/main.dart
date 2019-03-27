import 'dart:io';
import 'package:dynamic_widget/dynamic_widget.dart';
import 'widget_json.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Widget',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dynamic Widget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: GridView.count(
        mainAxisSpacing:10,
        crossAxisCount: 3,
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        children: <Widget>[
          RaisedButton(
            child: Text("Container"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(container_json)));
            },
          ),
          RaisedButton(
            child: Text("Row"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(row_json)));
            },
          ),
          RaisedButton(
            child: Text("Column"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(column_json)));
            },
          ),
          RaisedButton(
            child: Text("Text"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(text_json)));
            },
          ),
          RaisedButton(
            child: Text("TextSpan"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(textSpan_json)));
            },
          ),
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(raisedButton_json)));
            },
          ),
          RaisedButton(
            child: Text("Asset Image"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(assetImage_json)));
            },
          ),
          RaisedButton(
            child: Text("Network Image"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(networkImage_json)));
            },
          ),
          RaisedButton(
            child: Text("Placeholder"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(placeholder_json)));
            },
          ),
          RaisedButton(
            child: Text("GridView"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(gridview_json)));
            },
          ),
          RaisedButton(
            child: Text("ListView"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(listview_json)));
            },
          ),
          RaisedButton(
            child: Text("PageView"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(pageview_json)));
            },
          ),
          RaisedButton(
            child: Text("Expanded"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(expanded_json)));
            },
          ),
          RaisedButton(
            child: Text("ListView Auto load more"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(listview_loadmore_json)));
            },
          ),
          RaisedButton(
            child: Text("GridView Auto load more"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CodeEditorPage(gridviewloadmore_json)));
            },
          ),


        ],
      )


    );
  }
}

class CodeEditorPage extends StatefulWidget{

  final String jsonString;
  CodeEditorPage(this.jsonString);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CodeEditorPageState(jsonString);
  }

}

class _CodeEditorPageState extends State<CodeEditorPage> {

  String jsonString;
  TextEditingController controller = TextEditingController();

  _CodeEditorPageState(this.jsonString);

  @override
  Widget build(BuildContext context) {
    var widget = Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Code Editor"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                constraints: BoxConstraints.expand(width: double.infinity, height: double.infinity),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: 'Enter json string'
                  ),
                  maxLines: 1000000,

                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              child: Text("Preview"),
              onPressed: (){
                setState(() {
                  jsonString = controller.text;
                });
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PreviewPage(controller.text)));
              },
            )
          ],
        )

    );
    controller.text = jsonString;
    return widget;
  }
}

class PreviewPage extends StatelessWidget{

  final String jsonString;

  PreviewPage(this.jsonString);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Preview"),
        ),
        body: FutureBuilder<Widget>(
          future: _buildWidget(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot){
            if (snapshot.hasError) {
              print(snapshot.error);
            }
            return snapshot.hasData?snapshot.data:Text("Loading...");
          },
        ),
    );
  }

  Future<Widget> _buildWidget() async{

    return DynamicWidgetBuilder().build(jsonString, new DefaultClickListener());
  }
}

class DefaultClickListener implements ClickListener{
  @override
  void onClicked(String event) {
    print("Receive click event: " + event);
  }

}