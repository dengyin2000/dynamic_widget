# Dynamic Widget Manual
> Dynamic Widget Manual

## Table of contents
* [Container Widget](#container_widget)

## Container Widget
Container widget, here to see flutter [Container widget](https://docs.flutter.io/flutter/widgets/Container-class.html) definition.
Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| alignment|Align the [child] within the container|String|One of the following string:<br>topLeft<br>topCenter<br>topRight<br>centerLeft<br>center<br>centerRight<br>bottomLeft<br>bottomCenter<br>bottomRight|"topLeft"| 
| margin|Empty space to surround the [decoration] and [child].|String|left,top,right,bottom|"8,10,12,8"| 
| padding|Empty space to inscribe inside the [decoration]. The [child], if any, isplaced inside this padding.|String|left,top,right,bottom|"8,10,12,8"|
| color|Container background color|String| "#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"| 
| width|Container width|double|  |200| 
| height|Container height|double|  |200| 
| constraints|Container constraints|BoxConstraints| {"minWidth":100, "maxWidth": 100, "minHeight": 100, "maxHeight": 100}<br> 9999999999 would be the value of **double.infinity** |200| 
| child|The [child] contained by the container.|Widget|  | | 
