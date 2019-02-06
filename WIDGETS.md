# Dynamic Widget Manual
> Dynamic Widget Manual

## Table of contents
* [Container Widget](#container-widget)
* [Text Widget](#text-widget)
* [TextSpan](#textspan)
* [TextStyle](#textstyle)
* [RaisedButton Widget](#raisedbutton-widget)
* [Row Widget](#row-widget)
* [Column Widget](#column-widget)
* [AssetImage Widget](#assetimage-widget)
* [NetworkImage Widget](#networkimage-widget)
* [FileImage Widget](#fileimage-widget)
* [Placeholder Widget](#placeholder-widget)

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

## Text Widget
Text widget, here to see flutter [Text widget](https://docs.flutter.io/flutter/widgets/Text-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| data|The text to display|String| |"I am a text"|
| textAlign|How the text should be aligned horizontally.|String|One of the following string:<br>left (default)<br>right<br>center<br>justify<br>start<br>end|"left"|
| overflow|How visual overflow should be handled.|String|One of the following string:<br>ellipsis (default)<br>clip<br>fade|"ellipsis"|
| maxLines|An optional maximum number of lines for the text to span, wrapping if necessary. If the text exceeds the given number of lines, it will be truncated according to overflow. |int| |3|
| semanticsLabel|An alternative semantics label for this text.|String|  ||
| softWrap|Whether the text should break at soft line breaks.|bool|  |true|
| textDirection|The directionality of the text.|String| One of the following string:<br>ltr (default) <br>rtl |"ltr"|
| textScaleFactor|The number of font pixels for each logical pixel.|double|  | |
| textSpan|The text to display as a TextSpan. |TextSpan|  | |

## TextSpan
TextSpan, here to see flutter [TextSpan](https://docs.flutter.io/flutter/painting/TextSpan-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| text|The text contained in the span.|String| |"I am a text"|
| style|The style to apply to the text and the children.|TextStyle| | {"color": "#00FFFF", "fontSize": 26.0}|
| children|Additional spans to include as children. |List&#60;TextSpan&#62;| | |

## TextStyle
TextStyle, here to see flutter [TextStyle](https://docs.flutter.io/flutter/painting/TextStyle-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| color|The color to use when painting the text.|String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| debugLabel|A human-readable description of this text style. |String| |  |
| fontFamily|The name of the font to use when painting the text (e.g., Roboto). If the font is defined in a package, this will be prefixed with 'packages/package_name/' (e.g. 'packages/cool_fonts/Roboto'). The prefixing is done by the constructor when the package argument is provided.|String| | |
| fontSize|The size of glyphs (in logical pixels) to use when painting the text. |double| |  |
| fontStyle|The typeface variant to use when drawing the letters (e.g., italics). |String|One of the following string: italic (default)<br> normal | "italic" |

## RaisedButton Widget
RaisedButton widget, here to see flutter [RaisedButton widget](https://docs.flutter.io/flutter/widgets/Text-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| color|The button's fill color, displayed by its Material, while it is in its default (unpressed, enabled) state. |String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| disabledColor|The fill color of the button when the button is disabled. |String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| disabledElevation|The elevation for the button's Material when the button is not enabled.|double| | |
| disabledTextColor|The color to use for this button's text when the button is disabled.|String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| elevation|The z-coordinate at which to place this button. This controls the size of the shadow below the raised button.|double| | |
| padding|The internal padding for the button's child.|String|left,top,right,bottom|"8,10,12,8"|
| splashColor|The splash color of the button's InkWell.|String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| textColor|The color to use for this button's text.|String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| child|The button's label.|Widget| | |

## Row Widget
Row widget, here to see flutter [Row widget](https://docs.flutter.io/flutter/widgets/Row-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| crossAxisAlignment|How the children should be placed along the cross axis.|String|One of the following string:<br>center (default)<br>start<br>end<br>stretch<br>baseline| |
| mainAxisAlignment|How the children should be placed along the main axis. |String|One of the following string:<br>start (default)<br>end<br>center<br>spaceBetween<br>spaceAround<br>spaceEvenly| |
| mainAxisSize|How much space should be occupied in the main axis.|String| One of the following string:<br>max (default)<br>min | |
| textBaseline|If aligning items according to their baseline, which baseline to use.|String|One of the following string:<br>ideographic (default)<br>alphabetic| |
| textDirection|Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction.|String| One of the following string:<br>ltr (default)<br>rtl | |
| verticalDirection|Determines the order to lay children out vertically and how to interpret start and end in the vertical direction.|String|One of the following string:<br>down (default)<br>up| |
| children|The widgets below this widget in the tree. |List&#60;TextSpan&#62;| | |

## Column Widget
Column widget, here to see flutter [Column widget](https://docs.flutter.io/flutter/widgets/Column-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| crossAxisAlignment|How the children should be placed along the cross axis.|String|One of the following string:<br>center (default)<br>start<br>end<br>stretch<br>baseline| |
| mainAxisAlignment|How the children should be placed along the main axis. |String|One of the following string:<br>start (default)<br>end<br>center<br>spaceBetween<br>spaceAround<br>spaceEvenly| |
| mainAxisSize|How much space should be occupied in the main axis.|String| One of the following string:<br>max (default)<br>min | |
| textBaseline|If aligning items according to their baseline, which baseline to use.|String|One of the following string:<br>ideographic (default)<br>alphabetic| |
| textDirection|Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction.|String| One of the following string:<br>ltr (default)<br>rtl | |
| verticalDirection|Determines the order to lay children out vertically and how to interpret start and end in the vertical direction.|String|One of the following string:<br>down (default)<br>up| |
| children|The widgets below this widget in the tree. |List&#60;TextSpan&#62;| | |

## AssetImage Widget
AssetImage widget, here to see flutter [Asset Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| name|The picture asset name|String||'images/cat.png' |
| semanticLabel|A Semantic description of the image.  |String|| |
| excludeFromSemantics|Whether to exclude this image from semantics. |bool|  | |
| scale||double| | |
| width|If non-null, require the image to have this width. |double| | |
| height|If non-null, require the image to have this height.|double| | |
| color|If non-null, this color is blended with each image pixel using colorBlendMode. |String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| blendMode|Used to combine color with this image. |String| enum values, please see enum BlendMode | 'srcIn' |
| boxFit|How to inscribe the image into the space allocated during layout. |String| enum values, please see enum BoxFit | 'none' |
| alignment|How to align the image within its bounds.|String|enum values, please see enum Alignment, default value is Alignment.center. |"center"|
| repeat|How to paint any portions of the layout bounds not covered by the image.|String| enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'|
| centerSlice|The center slice for a nine-patch image.|String|left,top,right,bottom|"8,10,12,8"|
| matchTextDirection|Whether to paint the image in the direction of the TextDirection.|bool| | |
| gaplessPlayback|Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes.|bool| | |
| filterQuality|Used to set the FilterQuality of the image.|String|enum values, please see enum FilterQuality, default value is FilterQuality.low. |"low"|

## NetworkImage Widget
NetworkImage widget, here to see flutter [Network Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| src|The picture url|String||'http://www.google.com/logo.png' |
| semanticLabel|A Semantic description of the image.  |String|| |
| excludeFromSemantics|Whether to exclude this image from semantics. |bool|  | |
| scale||double| | |
| width|If non-null, require the image to have this width. |double| | |
| height|If non-null, require the image to have this height.|double| | |
| color|If non-null, this color is blended with each image pixel using colorBlendMode. |String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| blendMode|Used to combine color with this image. |String| enum values, please see enum BlendMode | 'srcIn' |
| boxFit|How to inscribe the image into the space allocated during layout. |String| enum values, please see enum BoxFit | 'none' |
| alignment|How to align the image within its bounds.|String|enum values, please see enum Alignment, default value is Alignment.center. |"center"|
| repeat|How to paint any portions of the layout bounds not covered by the image.|String| enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'|
| centerSlice|The center slice for a nine-patch image.|String|left,top,right,bottom|"8,10,12,8"|
| matchTextDirection|Whether to paint the image in the direction of the TextDirection.|bool| | |
| gaplessPlayback|Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes.|bool| | |
| filterQuality|Used to set the FilterQuality of the image.|String|enum values, please see enum FilterQuality, default value is FilterQuality.low. |"low"|

## FileImage Widget
FileImage widget, here to see flutter [File Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| filePath|The picture file path|String||'/sdcard/logo.png' |
| semanticLabel|A Semantic description of the image.  |String|| |
| excludeFromSemantics|Whether to exclude this image from semantics. |bool|  | |
| scale||double| | |
| width|If non-null, require the image to have this width. |double| | |
| height|If non-null, require the image to have this height.|double| | |
| color|If non-null, this color is blended with each image pixel using colorBlendMode. |String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| blendMode|Used to combine color with this image. |String| enum values, please see enum BlendMode | 'srcIn' |
| boxFit|How to inscribe the image into the space allocated during layout. |String| enum values, please see enum BoxFit | 'none' |
| alignment|How to align the image within its bounds.|String|enum values, please see enum Alignment, default value is Alignment.center. |"center"|
| repeat|How to paint any portions of the layout bounds not covered by the image.|String| enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'|
| centerSlice|The center slice for a nine-patch image.|String|left,top,right,bottom|"8,10,12,8"|
| matchTextDirection|Whether to paint the image in the direction of the TextDirection.|bool| | |
| gaplessPlayback|Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes.|bool| | |
| filterQuality|Used to set the FilterQuality of the image.|String|enum values, please see enum FilterQuality, default value is FilterQuality.low. |"low"|

## Placeholder Widget
Placeholder widget, here to see flutter [Placeholder widget](https://docs.flutter.io/flutter/widgets/Placeholder-class.html) definition. Supported json properties:

| property        | definition   | type  | value  | sample |
| ---| ---| ---   | ---| ---|
| color|The color to draw the placeholder box.|String|"#AARRGGBB" or "#RRGGBB"|"#FF00FF"<br>"#00FF00FF"|
| strokeWidth|The width of the lines in the placeholder box. |double|| |
| fallbackWidth|The width to use when the placeholder is in a situation with an unbounded width.|double|  | |
| fallbackHeight|The height to use when the placeholder is in a situation with an unbounded height. |double| | |
