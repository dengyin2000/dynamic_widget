var containerJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0
    }
  }
}

''';

var textJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "data": "Flutter dynamic widget",
    "maxLines": 3,
    "overflow": "ellipsis",
    "style": {
      "color": "#00FFFF",
      "fontSize": 20.0,
      "fontWeight": "bold",
      "decoration": "underline"
    }
  }
}

''';

var textSpanJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type": "Text",
    "maxLines": 3,
    "textSpan": {
      "text": "Flutter",
      "style": {
        "color": "#00FFFF",
        "fontSize": 26.0
      },
      "recognizer": "route://productDetail?goods_id=123",
      "children": [
        {
          "text": " dynamic",
          "style": {
            "fontSize": 22.0
          }
        },
        {
          "text": " widget",
          "style": {
            "color": "#00FF00",
            "fontSize": 18.0
          }
        }
      ]
    }
  }
}


''';

var raisedButtonJson = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type": "RaisedButton",
    "color": "##FF00FF",
    "padding": "8,8,8,8",
    "textColor": "#00FF00",
    "elevation" : 8.0,
    "splashColor" : "#00FF00",
    "click_event" : "route://productDetail?goods_id=123",
    "child" : {
      "type": "Text",
      "data": "I am a button"
    }  
  }
}


''';

var rowJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

var columnJson = '''
{
  "type": "Column",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "mainAxisSize": "max",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "verticalDirection": "down",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    }
  ]
}
''';

var assetImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "AssetImage",
    "name": "assets/vip.png"
  }
}

''';

var networkImageJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "NetworkImage",
    "src": "https://b.appsimg.com/upload/momin/2019/01/23/101/1548249269085.png"
  }
}

''';

var placeholderJson = '''
{
  "type": "Container",
  "color": "#FFFFFF",
  "alignment": "center",
  "child": {
    "type": "Placeholder",
    "color": "#00FF00",
    "strokeWidth": 6.0,
    "fallbackWidth": 100.0,
    "fallbackHeight": 200.0
  }
}

''';

var gridviewJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

var listviewJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

var pageviewJson = '''
{
  "type": "PageView",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

var expandedJson = '''
{
  "type": "Row",
  "crossAxisAlignment": "start",
  "mainAxisAlignment": "start",
  "textBaseline": "alphabetic",
  "textDirection": "ltr",
  "children":[
    {
      "type" : "Text",
      "data" : "Flutter"
    },
    {
      "type": "RaisedButton",
      "color": "##FF00FF",
      "padding": "8,8,8,8",
      "textColor": "#00FF00",
      "elevation" : 8.0,
      "splashColor" : "#00FF00",
      "child" : {
        "type": "Text",
        "data": "Widget"
      }
    },
    {
      "type" : "Text",
      "data" : "Demo"
    },
    {
      "type" : "Expanded",
      "child" : {
        "type" : "Container",
        "color" : "#FFFF00",
        "alignment" : "center",
        "child" : {
          "type" : "Text",
          "data" : "Expanded Widget"
        }
      }
    }
  ]
}
''';

var listviewLoadmoreJson = '''
{
  "type": "ListView",
  "padding": "10, 10, 10, 10",
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

var gridviewloadmoreJson = '''
{
  "type": "GridView",
  "crossAxisCount": 2,
  "padding": "10, 10, 10, 10",
  "mainAxisSpacing": 4.0,
  "crossAxisSpacing": 4.0,
  "childAspectRatio": 1.6,
  "pageSize": 10,
  "loadMoreUrl": "http://127.0.0.1:8080/list.json",
  "isDemo": true,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    }
    
  ]
}

''';

var stackJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "Positioned",
      "top": 50.0,
      "left": 50.0,
      "child":{
        "type": "AssetImage",
        "name": "assets/vip.png"
      }
    }
  ]
}

''';

var indexedstackJson = '''
{
  "type": "IndexedStack",
  "alignment": "topLeft",
  "index": 1,
  "children":[
    {
      "type": "AssetImage",
      "name": "assets/vip.png"
    },
    {
      "type": "Positioned",
      "top": 50.0,
      "left": 50.0,
      "child":{
        "type": "AssetImage",
        "name": "assets/vip.png"
      }
    }
  ]
}

''';

var sizedboxJson = '''
{
  "type": "Stack",
  "alignment": "topLeft",
  "children":[
    {
      "type": "ExpandedSizedBox",
      "child":{
        "type":"Container",
        "color": "#0000FF"
      }
    },
    {
      "type": "SizedBox",
      "width": 100.0,
      "height": 100.0,
      "child":{
        "type":"Container",
        "color": "#CC00FF"
      }
    }
  ]
}

''';

var opacityJson = '''
{
  "type": "Container",
  "color": "#FF00FF",
  "alignment": "center",
  "child": {
    "type":"Opacity",
    "opacity": 0.3,
    "child":{
        "type": "Text",
        "data": "Flutter dynamic widget",
        "maxLines": 3,
        "overflow": "ellipsis",
        "style": {
          "color": "#00FFFF",
          "fontSize": 20.0
        }
    }
  }
}
''';

var wrapJson = '''
{
  "type": "Wrap",
  "spacing" : 8.0,
  "runSpacing" : 8.0,
  "alignment":"center", 
  "runAlignment" : "start",
  "crossAxisAlignment":"center",
  "children": [
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XXL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "XL"
        }  
      }   
      ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "SSL"
        }  
      }   ,
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "L"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "LLL"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "GGG"
        }  
      },
    {
        "type": "RaisedButton",
        "padding": "8,8,8,8",
        "splashColor" : "#00FF00",
        "child" : {
          "type": "Text",
          "data": "AAA"
        }  
      }             
  ]
}
''';

var cliprrectJson = '''
{
  "type": "Container",
  "alignment": "center",
  "child": {
    "type":"ClipRRect",
    "borderRadius":"10,20,30,40",
    "child":{
      "type": "SizedBox",
      "width": 100.0,
      "height": 100.0,
      "child":{
        "type":"Container",
        "color": "#CC00FF"
      }
    }
  }
}
''';

var textFieldJson = '''
{
  "id": "text_field_test",
  "type": "TextField",
  "textColor": "#00FF00"
}
''';
