# Dynamic Widget Manual

> Dynamic Widget Manual

## Table of contents

- [Container Widget](#container-widget)
- [Text Widget](#text-widget)
- [TextSpan](#textspan)
- [TextStyle](#textstyle)
- [RaisedButton Widget](#raisedbutton-widget)
- [ElevatedButton Widget](#elevatedbutton-widget)
- [TextButton Widget](#textbutton-widget)
- [Row Widget](#row-widget)
- [Column Widget](#column-widget)
- [AssetImage Widget](#assetimage-widget)
- [NetworkImage Widget](#networkimage-widget)
- [FileImage Widget](#fileimage-widget)
- [Placeholder Widget](#placeholder-widget)
- [GridView Widget](#gridview-widget)
- [ListView Widget](#listview-widget)
- [PageView Widget](#pageview-widget)
- [Expanded Widget](#expanded-widget)
- [Padding Widget](#padding-widget)
- [Center Widget](#center-widget)
- [Align Widget](#align-widget)
- [AspectRatio Widget](#aspectratio-widget)
- [FittedBox Widget](#fittedbox-widget)
- [Baseline Widget](#baseline-widget)
- [Stack Widget](#stack-widget)
- [Positioned Widget](#positioned-widget)
- [IndexedStack Widget](#indexedstack-widget)
- [ExpandedSizedBox Widget](#expandedsizedbox-widget)
- [SizedBox Widget](#sizedbox-widget)
- [Opacity Widget](#opacity-widget)
- [Wrap Widget](#wrap-widget)
- [ClipRRect Widget](#cliprrect-widget)
- [SafeArea Widget](#safearea-widget)
- [ListTile Widget](#listtile-widget)
- [SelectableText Widget](#selectabletext-widget)
- [Icon Widget](#icon-widget)
- [DropCapText Widget](#dropcaptext-widget)
- [Scaffold Widget](#scaffold-widget)
- [AppBar Widget](#appbar-widget)
- [LimitedBox Widget](#limitedbox-widget)
- [Offstage Widget](#offstage-widget)
- [OverflowBox Widget](#overflowbox-widget)
- [Divider Widget](#divider-widget)
- [RotatedBox Widget](#rotatedbox-widget)
- [SingleChildScrollView Widget](#singlechildscrollview-widget)

## Container Widget

Container widget, here to see flutter [Container widget](https://docs.flutter.io/flutter/widgets/Container-class.html) definition.
Supported json properties:

| property    | definition                                                                                                 | type           | value                                                                                                                                                | sample                               |
| ----------- | ---------------------------------------------------------------------------------------------------------- | -------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| alignment   | Align the [child] within the container                                                                     | String         | One of the following string:<br>topLeft<br>topCenter<br>topRight<br>centerLeft<br>center<br>centerRight<br>bottomLeft<br>bottomCenter<br>bottomRight | "topLeft"                            |
| margin      | Empty space to surround the [decoration] and [child].                                                      | String         | left,top,right,bottom                                                                                                                                | "8,10,12,8"                          |
| padding     | Empty space to inscribe inside the [decoration]. The [child], if any, isplaced inside this padding.        | String         | left,top,right,bottom                                                                                                                                | "8,10,12,8"                          |
| color       | Container background color                                                                                 | String         | "#AARRGGBB" or "#RRGGBB"                                                                                                                             | "#FF00FF"<br>"#00FF00FF"             |
| width       | Container width                                                                                            | double         |                                                                                                                                                      | 200                                  |
| height      | Container height                                                                                           | double         |                                                                                                                                                      | 200                                  |
| constraints | Container constraints                                                                                      | BoxConstraints | {"minWidth":100, "maxWidth": 100, "minHeight": 100, "maxHeight": 100}<br> 9999999999 would be the value of **double.infinity**                       | 200                                  |
| child       | The [child] contained by the container.                                                                    | Widget         |                                                                                                                                                      |                                      |
| click_event | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page. | String         |                                                                                                                                                      | "route://productDetail?goods_id=123" |

## Text Widget

Text widget, here to see flutter [Text widget](https://docs.flutter.io/flutter/widgets/Text-class.html) definition. Supported json properties:

| property        | definition                                                                                                                                                                  | type     | value                                                                                        | sample        |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------------------------------------------------------------------------------- | ------------- |
| data            | The text to display                                                                                                                                                         | String   |                                                                                              | "I am a text" |
| textAlign       | How the text should be aligned horizontally.                                                                                                                                | String   | One of the following string:<br>left (default)<br>right<br>center<br>justify<br>start<br>end | "left"        |
| overflow        | How visual overflow should be handled.                                                                                                                                      | String   | One of the following string:<br>ellipsis (default)<br>clip<br>fade                           | "ellipsis"    |
| maxLines        | An optional maximum number of lines for the text to span, wrapping if necessary. If the text exceeds the given number of lines, it will be truncated according to overflow. | int      |                                                                                              | 3             |
| semanticsLabel  | An alternative semantics label for this text.                                                                                                                               | String   |                                                                                              |               |
| softWrap        | Whether the text should break at soft line breaks.                                                                                                                          | bool     |                                                                                              | true          |
| textDirection   | The directionality of the text.                                                                                                                                             | String   | One of the following string:<br>ltr (default) <br>rtl                                        | "ltr"         |
| textScaleFactor | The number of font pixels for each logical pixel.                                                                                                                           | double   |                                                                                              |               |
| textSpan        | The text to display as a TextSpan.                                                                                                                                          | TextSpan |                                                                                              |               |

## TextSpan

TextSpan, here to see flutter [TextSpan](https://docs.flutter.io/flutter/painting/TextSpan-class.html) definition. Supported json properties:

| property   | definition                                                                                                                                              | type                   | value | sample                                 |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ----- | -------------------------------------- |
| recognizer | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page. Currently only supports TapGestureRecognizer | String                 |       | "route://productDetail?goods_id=123"   |
| text       | The text contained in the span.                                                                                                                         | String                 |       | "I am a text"                          |
| style      | The style to apply to the text and the children.                                                                                                        | TextStyle              |       | {"color": "#00FFFF", "fontSize": 26.0} |
| children   | Additional spans to include as children.                                                                                                                | List&#60;TextSpan&#62; |       |                                        |

## TextStyle

TextStyle, here to see flutter [TextStyle](https://docs.flutter.io/flutter/painting/TextStyle-class.html) definition. Supported json properties:

| property   | definition                                                                                                                                                                                                                                                                       | type   | value                                                                                                                                   | sample                   |
| ---------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------- | ------------------------ |
| color      | The color to use when painting the text.                                                                                                                                                                                                                                         | String | "#AARRGGBB" or "#RRGGBB"                                                                                                                | "#FF00FF"<br>"#00FF00FF" |
| debugLabel | A human-readable description of this text style.                                                                                                                                                                                                                                 | String |                                                                                                                                         |                          |
| decoration | The name of the decoration.                                                                                                                                                                                                                                                      | String | One of the following string: none (default)<br>lineThrough<br>overline<br>underline                                                     | "underline"              |
| fontFamily | The name of the font to use when painting the text (e.g., Roboto). If the font is defined in a package, this will be prefixed with 'packages/package_name/' (e.g. 'packages/cool_fonts/Roboto'). The prefixing is done by the constructor when the package argument is provided. | String |                                                                                                                                         |                          |
| fontSize   | The size of glyphs (in logical pixels) to use when painting the text.                                                                                                                                                                                                            | double |                                                                                                                                         |                          |
| fontStyle  | The typeface variant to use when drawing the letters (e.g., italics).                                                                                                                                                                                                            | String | One of the following string: italic (default)<br> normal                                                                                | "italic"                 |
| fontWeight | The typeface thickness to use when painting the text (e.g., bold).                                                                                                                                                                                                               | String | One of the following string: w100<br> w200<br> w300<br> w400<br> w500<br> w600<br> w700<br> w800<br> w900<br> normal (default)<br> bold | "bold"                   |

## RaisedButton Widget

RaisedButton widget, here to see flutter [RaisedButton widget](https://docs.flutter.io/flutter/widgets/Text-class.html) definition. Supported json properties:

| property          | definition                                                                                                    | type   | value                    | sample                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------- | ------ | ------------------------ | ------------------------------------ |
| color             | The button's fill color, displayed by its Material, while it is in its default (unpressed, enabled) state.    | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| disabledColor     | The fill color of the button when the button is disabled.                                                     | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| disabledElevation | The elevation for the button's Material when the button is not enabled.                                       | double |                          |                                      |
| disabledTextColor | The color to use for this button's text when the button is disabled.                                          | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| elevation         | The z-coordinate at which to place this button. This controls the size of the shadow below the raised button. | double |                          |                                      |
| padding           | The internal padding for the button's child.                                                                  | String | left,top,right,bottom    | "8,10,12,8"                          |
| splashColor       | The splash color of the button's InkWell.                                                                     | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| textColor         | The color to use for this button's text.                                                                      | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| child             | The button's label.                                                                                           | Widget |                          |                                      |
| click_event       | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.    | String |                          | "route://productDetail?goods_id=123" |

## ElevatedButton Widget

ElevatedButton widget, here to see flutter [ElevatedButton widget](https://api.flutter.dev/flutter/material/ElevatedButton-class.html) definition. Supported json properties:

| property          | definition                                                                                                    | type   | value                    | sample                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------- | ------ | ------------------------ | ------------------------------------ |
| foregroundColor             | The color for the button's Text and Icon widget descendants.    | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| backgroundColor     | The button's background fill color.                                                   | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| overlayColor     | The highlight color that's typically used to indicate that the button is focused, hovered, or pressed.                                                | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| shadowColor     | The shadow color of the button's Material.                                                | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| elevation         | The z-coordinate at which to place this button. This controls the size of the shadow below the raised button. | double |                          |                                      |
| padding           | The internal padding for the button's child.                                                                  | String | left,top,right,bottom    | "8,10,12,8"                          |
| textStyle               | The style to apply to the text and the children.                                                                                                                            | TextStyle |                                                                                                                                                                                                                                                                                            | {"color": "#00FFFF", "fontSize": 26.0} |
| child             | The button's label.                                                                                           | Widget |                          |                                      |
| alignment            | How to align the image within its bounds.                                                                           | String | enum values, please see enum Alignment, default value is Alignment.center.       | "center"                             |
| click_event       | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.    | String |                          | "route://productDetail?goods_id=123" |

## TextButton Widget

TextButton widget, here to see flutter [TextButton widget](https://api.flutter.dev/flutter/material/TextButton-class.html) definition. Supported json properties:

| property          | definition                                                                                                    | type   | value                    | sample                               |
| ----------------- | ------------------------------------------------------------------------------------------------------------- | ------ | ------------------------ | ------------------------------------ |
| foregroundColor             | The color for the button's Text and Icon widget descendants.    | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| backgroundColor     | The button's background fill color.                                                   | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| overlayColor     | The highlight color that's typically used to indicate that the button is focused, hovered, or pressed.                                                | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| shadowColor     | The shadow color of the button's Material.                                                | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF"             |
| elevation         | The z-coordinate at which to place this button. This controls the size of the shadow below the raised button. | double |                          |                                      |
| padding           | The internal padding for the button's child.                                                                  | String | left,top,right,bottom    | "8,10,12,8"                          |
| textStyle               | The style to apply to the text and the children.                                                                                                                            | TextStyle |                                                                                                                                                                                                                                                                                            | {"color": "#00FFFF", "fontSize": 26.0} |
| child             | The button's label.                                                                                           | Widget |                          |                                      |
| alignment            | How to align the image within its bounds.                                                                           | String | enum values, please see enum Alignment, default value is Alignment.center.       | "center"                             |
| click_event       | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.    | String |                          | "route://productDetail?goods_id=123" |

## Row Widget

Row widget, here to see flutter [Row widget](https://docs.flutter.io/flutter/widgets/Row-class.html) definition. Supported json properties:

| property           | definition                                                                                                            | type                   | value                                                                                                          | sample |
| ------------------ | --------------------------------------------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------- | ------ |
| crossAxisAlignment | How the children should be placed along the cross axis.                                                               | String                 | One of the following string:<br>center (default)<br>start<br>end<br>stretch<br>baseline                        |        |
| mainAxisAlignment  | How the children should be placed along the main axis.                                                                | String                 | One of the following string:<br>start (default)<br>end<br>center<br>spaceBetween<br>spaceAround<br>spaceEvenly |        |
| mainAxisSize       | How much space should be occupied in the main axis.                                                                   | String                 | One of the following string:<br>max (default)<br>min                                                           |        |
| textBaseline       | If aligning items according to their baseline, which baseline to use.                                                 | String                 | One of the following string:<br>ideographic (default)<br>alphabetic                                            |        |
| textDirection      | Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction. | String                 | One of the following string:<br>ltr (default)<br>rtl                                                           |        |
| verticalDirection  | Determines the order to lay children out vertically and how to interpret start and end in the vertical direction.     | String                 | One of the following string:<br>down (default)<br>up                                                           |        |
| children           | The widgets below this widget in the tree.                                                                            | List&#60;TextSpan&#62; |                                                                                                                |        |

## Column Widget

Column widget, here to see flutter [Column widget](https://docs.flutter.io/flutter/widgets/Column-class.html) definition. Supported json properties:

| property           | definition                                                                                                            | type                   | value                                                                                                          | sample |
| ------------------ | --------------------------------------------------------------------------------------------------------------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------- | ------ |
| crossAxisAlignment | How the children should be placed along the cross axis.                                                               | String                 | One of the following string:<br>center (default)<br>start<br>end<br>stretch<br>baseline                        |        |
| mainAxisAlignment  | How the children should be placed along the main axis.                                                                | String                 | One of the following string:<br>start (default)<br>end<br>center<br>spaceBetween<br>spaceAround<br>spaceEvenly |        |
| mainAxisSize       | How much space should be occupied in the main axis.                                                                   | String                 | One of the following string:<br>max (default)<br>min                                                           |        |
| textBaseline       | If aligning items according to their baseline, which baseline to use.                                                 | String                 | One of the following string:<br>ideographic (default)<br>alphabetic                                            |        |
| textDirection      | Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction. | String                 | One of the following string:<br>ltr (default)<br>rtl                                                           |        |
| verticalDirection  | Determines the order to lay children out vertically and how to interpret start and end in the vertical direction.     | String                 | One of the following string:<br>down (default)<br>up                                                           |        |
| children           | The widgets below this widget in the tree.                                                                            | List&#60;TextSpan&#62; |                                                                                                                |        |

## AssetImage Widget

AssetImage widget, here to see flutter [Asset Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property             | definition                                                                                                          | type   | value                                                                            | sample                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------------------- | ------------------------------------ |
| name                 | The picture asset name                                                                                              | String |                                                                                  | 'images/cat.png'                     |
| semanticLabel        | A Semantic description of the image.                                                                                | String |                                                                                  |                                      |
| excludeFromSemantics | Whether to exclude this image from semantics.                                                                       | bool   |                                                                                  |                                      |
| scale                |                                                                                                                     | double |                                                                                  |                                      |
| width                | If non-null, require the image to have this width.                                                                  | double |                                                                                  |                                      |
| height               | If non-null, require the image to have this height.                                                                 | double |                                                                                  |                                      |
| color                | If non-null, this color is blended with each image pixel using colorBlendMode.                                      | String | "#AARRGGBB" or "#RRGGBB"                                                         | "#FF00FF"<br>"#00FF00FF"             |
| blendMode            | Used to combine color with this image.                                                                              | String | enum values, please see enum BlendMode                                           | 'srcIn'                              |
| boxFit               | How to inscribe the image into the space allocated during layout.                                                   | String | enum values, please see enum BoxFit                                              | 'none'                               |
| alignment            | How to align the image within its bounds.                                                                           | String | enum values, please see enum Alignment, default value is Alignment.center.       | "center"                             |
| repeat               | How to paint any portions of the layout bounds not covered by the image.                                            | String | enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'                           |
| centerSlice          | The center slice for a nine-patch image.                                                                            | String | left,top,right,bottom                                                            | "8,10,12,8"                          |
| matchTextDirection   | Whether to paint the image in the direction of the TextDirection.                                                   | bool   |                                                                                  |                                      |
| gaplessPlayback      | Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes. | bool   |                                                                                  |                                      |
| filterQuality        | Used to set the FilterQuality of the image.                                                                         | String | enum values, please see enum FilterQuality, default value is FilterQuality.low.  | "low"                                |
| click_event          | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.          | String |                                                                                  | "route://productDetail?goods_id=123" |

## NetworkImage Widget

NetworkImage widget, here to see flutter [Network Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property             | definition                                                                                                          | type   | value                                                                            | sample                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------------------- | ------------------------------------ |
| src                  | The picture url                                                                                                     | String |                                                                                  | 'http://www.google.com/logo.png'     |
| semanticLabel        | A Semantic description of the image.                                                                                | String |                                                                                  |                                      |
| excludeFromSemantics | Whether to exclude this image from semantics.                                                                       | bool   |                                                                                  |                                      |
| scale                |                                                                                                                     | double |                                                                                  |                                      |
| width                | If non-null, require the image to have this width.                                                                  | double |                                                                                  |                                      |
| height               | If non-null, require the image to have this height.                                                                 | double |                                                                                  |                                      |
| color                | If non-null, this color is blended with each image pixel using colorBlendMode.                                      | String | "#AARRGGBB" or "#RRGGBB"                                                         | "#FF00FF"<br>"#00FF00FF"             |
| blendMode            | Used to combine color with this image.                                                                              | String | enum values, please see enum BlendMode                                           | 'srcIn'                              |
| boxFit               | How to inscribe the image into the space allocated during layout.                                                   | String | enum values, please see enum BoxFit                                              | 'none'                               |
| alignment            | How to align the image within its bounds.                                                                           | String | enum values, please see enum Alignment, default value is Alignment.center.       | "center"                             |
| repeat               | How to paint any portions of the layout bounds not covered by the image.                                            | String | enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'                           |
| centerSlice          | The center slice for a nine-patch image.                                                                            | String | left,top,right,bottom                                                            | "8,10,12,8"                          |
| matchTextDirection   | Whether to paint the image in the direction of the TextDirection.                                                   | bool   |                                                                                  |                                      |
| gaplessPlayback      | Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes. | bool   |                                                                                  |                                      |
| filterQuality        | Used to set the FilterQuality of the image.                                                                         | String | enum values, please see enum FilterQuality, default value is FilterQuality.low.  | "low"                                |
| click_event          | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.          | String |                                                                                  | "route://productDetail?goods_id=123" |

## FileImage Widget

FileImage widget, here to see flutter [File Image widget](https://docs.flutter.io/flutter/widgets/Image-class.html) definition. Supported json properties:

| property             | definition                                                                                                          | type   | value                                                                            | sample                               |
| -------------------- | ------------------------------------------------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------------------- | ------------------------------------ |
| filePath             | The picture file path                                                                                               | String |                                                                                  | '/sdcard/logo.png'                   |
| semanticLabel        | A Semantic description of the image.                                                                                | String |                                                                                  |                                      |
| excludeFromSemantics | Whether to exclude this image from semantics.                                                                       | bool   |                                                                                  |                                      |
| scale                |                                                                                                                     | double |                                                                                  |                                      |
| width                | If non-null, require the image to have this width.                                                                  | double |                                                                                  |                                      |
| height               | If non-null, require the image to have this height.                                                                 | double |                                                                                  |                                      |
| color                | If non-null, this color is blended with each image pixel using colorBlendMode.                                      | String | "#AARRGGBB" or "#RRGGBB"                                                         | "#FF00FF"<br>"#00FF00FF"             |
| blendMode            | Used to combine color with this image.                                                                              | String | enum values, please see enum BlendMode                                           | 'srcIn'                              |
| boxFit               | How to inscribe the image into the space allocated during layout.                                                   | String | enum values, please see enum BoxFit                                              | 'none'                               |
| alignment            | How to align the image within its bounds.                                                                           | String | enum values, please see enum Alignment, default value is Alignment.center.       | "center"                             |
| repeat               | How to paint any portions of the layout bounds not covered by the image.                                            | String | enum values, please see enum ImageRepeat, default value is ImageRepeat.noRepeat. | 'noRepeat'                           |
| centerSlice          | The center slice for a nine-patch image.                                                                            | String | left,top,right,bottom                                                            | "8,10,12,8"                          |
| matchTextDirection   | Whether to paint the image in the direction of the TextDirection.                                                   | bool   |                                                                                  |                                      |
| gaplessPlayback      | Whether to continue showing the old image (true), or briefly show nothing (false), when the image provider changes. | bool   |                                                                                  |                                      |
| filterQuality        | Used to set the FilterQuality of the image.                                                                         | String | enum values, please see enum FilterQuality, default value is FilterQuality.low.  | "low"                                |
| click_event          | Url route string, for example: "route://productDetail?goods_id=123" for navigating to product detail page.          | String |                                                                                  | "route://productDetail?goods_id=123" |

## Placeholder Widget

Placeholder widget, here to see flutter [Placeholder widget](https://docs.flutter.io/flutter/widgets/Placeholder-class.html) definition. Supported json properties:

| property       | definition                                                                         | type   | value                    | sample                   |
| -------------- | ---------------------------------------------------------------------------------- | ------ | ------------------------ | ------------------------ |
| color          | The color to draw the placeholder box.                                             | String | "#AARRGGBB" or "#RRGGBB" | "#FF00FF"<br>"#00FF00FF" |
| strokeWidth    | The width of the lines in the placeholder box.                                     | double |                          |                          |
| fallbackWidth  | The width to use when the placeholder is in a situation with an unbounded width.   | double |                          |                          |
| fallbackHeight | The height to use when the placeholder is in a situation with an unbounded height. | double |                          |                          |

## GridView Widget

GridView widget, here to see flutter [GridView widget](https://docs.flutter.io/flutter/widgets/GridView-class.html) definition. Supported json properties:

| property         | definition                                                                                                                        | type                 | value                                                              | sample                               |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------ | ------------------------------------ |
| crossAxisCount   | a fixed number of tiles in the cross axis.                                                                                        | int                  |                                                                    |                                      |
| scrollDirection  | The axis along which the scroll view scrolls.                                                                                     | String               | enum values, please see enum Axis, default value is Axis.vertical. | "vertical"                           |
| reverse          | Whether the scroll view scrolls in the reading direction.                                                                         | bool                 | default value is false                                             |                                      |
| shrinkWrap       | Whether the extent of the scroll view in the scrollDirection should be determined by the contents being viewed.                   | bool                 | default value is false                                             |                                      |
| cacheExtent      | The viewport has an area before and after the visible area to cache items that are about to become visible when the user scrolls. | double               | default value is 0.0                                               |                                      |
| padding          | The amount of space by which to inset the children.                                                                               | String               | left,top,right,bottom                                              | "8,10,12,8"                          |
| mainAxisSpacing  | The number of logical pixels between each child along the main axis.                                                              | double               |                                                                    |                                      |
| crossAxisSpacing | The number of logical pixels between each child along the cross axis.                                                             | double               |                                                                    |                                      |
| childAspectRatio | The ratio of the cross-axis to the main-axis extent of each child.                                                                | double               |                                                                    |                                      |
| children         | The widgets below this widget in the tree.                                                                                        | List&#60;Widget&#62; |                                                                    |                                      |
| pageSize         | ListView load more item count for next page                                                                                       | int                  |                                                                    | this will be append to load more url |
| loadMoreUrl      | When listview scroll to bottom, it will do the request. The response of this url should be a json array of widget                 | String               |                                                                    |                                      |
| isDemo           | used in the demo, if true, will do the fake request                                                                               | bool                 |                                                                    | the default value is false           |

## ListView Widget

ListView widget, here to see flutter [ListView widget](https://docs.flutter.io/flutter/widgets/ListView-class.html) definition. Supported json properties:

| property        | definition                                                                                                                        | type                 | value                                                              | sample                               |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------ | ------------------------------------ |
| scrollDirection | The axis along which the scroll view scrolls.                                                                                     | String               | enum values, please see enum Axis, default value is Axis.vertical. | "vertical"                           |
| reverse         | Whether the scroll view scrolls in the reading direction.                                                                         | bool                 | default value is false                                             |                                      |
| shrinkWrap      | Whether the extent of the scroll view in the scrollDirection should be determined by the contents being viewed.                   | bool                 | default value is false                                             |                                      |
| cacheExtent     | The viewport has an area before and after the visible area to cache items that are about to become visible when the user scrolls. | double               | default value is 0.0                                               |                                      |
| padding         | The amount of space by which to inset the children.                                                                               | String               | left,top,right,bottom                                              | "8,10,12,8"                          |
| itemExtent      | If non-null, forces the children to have the given extent in the scroll direction.                                                | double               |                                                                    |                                      |
| pageSize        | ListView load more item count for next page                                                                                       | int                  |                                                                    | this will be append to load more url |
| loadMoreUrl     | When listview scroll to bottom, it will do the request. The response of this url should be a json array of widget                 | String               |                                                                    |                                      |
| isDemo          | used in the demo, if true, will do the fake request                                                                               | bool                 |                                                                    | the default value is false           |
| children        | The widgets below this widget in the tree.                                                                                        | List&#60;Widget&#62; |                                                                    |                                      |

## PageView Widget

PageView widget, here to see flutter [PageView widget](https://docs.flutter.io/flutter/widgets/PageView-class.html) definition. Supported json properties:

| property        | definition                                                                | type                 | value                                                              | sample     |
| --------------- | ------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------ | ---------- |
| scrollDirection | The axis along which the scroll view scrolls.                             | String               | enum values, please see enum Axis, default value is Axis.vertical. | "vertical" |
| reverse         | Whether the scroll view scrolls in the reading direction.                 | bool                 | default value is false                                             |            |
| pageSnapping    | Set to false to disable page snapping, useful for custom scroll behavior. | bool                 | default value is true                                              |            |
| children        | The widgets below this widget in the tree.                                | List&#60;Widget&#62; |                                                                    |            |

## Expanded Widget

Expanded widget, here to see flutter [Expanded widget](https://docs.flutter.io/flutter/widgets/Expanded-class.html) definition. Supported json properties:

| property | definition                            | type   | value              | sample |
| -------- | ------------------------------------- | ------ | ------------------ | ------ |
| child    | child widget                          | Widget |                    |        |
| flex     | The flex factor to use for this child | int    | default value is 1 |        |

## Padding Widget

Padding widget, here to see flutter [Padding widget](https://docs.flutter.io/flutter/widgets/Padding-class.html) definition. Supported json properties:

| property | definition                                       | type   | value                 | sample      |
| -------- | ------------------------------------------------ | ------ | --------------------- | ----------- |
| child    | child widget                                     | Widget |                       |             |
| padding  | The amount of space by which to inset the child. | String | left,top,right,bottom | "8,10,12,8" |

## Center Widget

Center widget, here to see flutter [Center widget](https://docs.flutter.io/flutter/widgets/Center-class.html) definition. Supported json properties:

| property     | definition                                                                    | type   | value | sample |
| ------------ | ----------------------------------------------------------------------------- | ------ | ----- | ------ |
| child        | child widget                                                                  | Widget |       |        |
| widthFactor  | If non-null, sets its width to the child's width multiplied by this factor.   | double |       |        |
| heightFactor | If non-null, sets its height to the child's height multiplied by this factor. | double |       |        |

## Align Widget

Align widget, here to see flutter [Align widget](https://docs.flutter.io/flutter/widgets/Align-class.html) definition. Supported json properties:

| property     | definition                                                                    | type   | value                                                                      | sample |
| ------------ | ----------------------------------------------------------------------------- | ------ | -------------------------------------------------------------------------- | ------ |
| alignment    | How to align the child.                                                       | String | enum values, please see enum Alignment, default value is Alignment.center. |        |
| child        | child widget                                                                  | Widget |                                                                            |        |
| widthFactor  | If non-null, sets its width to the child's width multiplied by this factor.   | double |                                                                            |        |
| heightFactor | If non-null, sets its height to the child's height multiplied by this factor. | double |                                                                            |        |

## AspectRatio Widget

AspectRatio widget, here to see flutter [AspectRatio widget](https://docs.flutter.io/flutter/widgets/AspectRatio-class.html) definition. Supported json properties:

| property    | definition                          | type   | value | sample |
| ----------- | ----------------------------------- | ------ | ----- | ------ |
| aspectRatio | The aspect ratio to attempt to use. | double |       |        |
| child       | child widget                        | Widget |       |        |

## FittedBox Widget

FittedBox widget, here to see flutter [FittedBox widget](https://docs.flutter.io/flutter/widgets/FittedBox-class.html) definition. Supported json properties:

| property  | definition                                                        | type   | value                                                                      | sample |
| --------- | ----------------------------------------------------------------- | ------ | -------------------------------------------------------------------------- | ------ |
| alignment | How to align the child within its parent's bounds.                | String | enum values, please see enum Alignment, default value is Alignment.center. |        |
| fit       | How to inscribe the child into the space allocated during layout. | String | enum values, please see enum BoxFit, default value is BoxFit.contain.      |        |
| child     | child widget                                                      | Widget |                                                                            |        |

## Baseline Widget

Baseline widget, here to see flutter [Baseline widget](https://docs.flutter.io/flutter/widgets/Baseline-class.html) definition. Supported json properties:

| property     | definition                                                                                       | type   | value                                                                                 | sample |
| ------------ | ------------------------------------------------------------------------------------------------ | ------ | ------------------------------------------------------------------------------------- | ------ |
| baseline     | The number of logical pixels from the top of this box at which to position the child's baseline. | double |                                                                                       |        |
| baselineType | The type of baseline to use for positioning the child.                                           | String | enum values, please see enum TextBaseline, default value is TextBaseline.ideographic. |        |
| child        | child widget                                                                                     | Widget |                                                                                       |        |

## Stack Widget

Stack widget, here to see flutter [Stack widget](https://docs.flutter.io/flutter/widgets/Stack-class.html) definition. Supported json properties:

| property      | definition                                                                      | type                 | value                                                                      | sample   |
| ------------- | ------------------------------------------------------------------------------- | -------------------- | -------------------------------------------------------------------------- | -------- |
| alignment     | How to align the non-positioned and partially-positioned children in the stack. | String               | enum values, please see enum Alignment, default value is Alignment.center. | "center" |
| fit           | How to size the non-positioned children in the stack.                           | String               | enum values, please see enum StackFit, default value is StackFit.loose.    |          |
| clipBehavior  | The content will be clipped (or not) according to this option.                  | String               | enum values, please see enum Clip, default value is Clip.hardEdge.         |          |
| textDirection | The text direction with which to resolve alignment.                             | String               | enum values, please see enum TextDirection                                 |          |
| children      | list of Widget                                                                  | List&#60;Widget&#62; |                                                                            |          |

## Positioned Widget

Positioned widget, here to see flutter [Positioned widget](https://docs.flutter.io/flutter/widgets/Positioned-class.html) definition. Supported json properties:

| property | definition                                                                       | type   | value | sample |
| -------- | -------------------------------------------------------------------------------- | ------ | ----- | ------ |
| bottom   | The distance that the child's bottom edge is inset from the bottom of the stack. | double |       |        |
| height   | The child's height.                                                              | double |       |        |
| left     | The distance that the child's left edge is inset from the left of the stack.     | double |       |        |
| right    | The distance that the child's right edge is inset from the right of the stack.   | double |       |        |
| top      | The distance that the child's top edge is inset from the top of the stack.       | double |       |        |
| width    | The child's width.                                                               | double |       |        |
| child    | The widget below this widget in the tree.                                        | Widget |       |        |

## IndexedStack Widget

IndexedStack widget, here to see flutter [IndexedStack widget](https://docs.flutter.io/flutter/widgets/IndexedStack-class.html) definition. Supported json properties:

| property      | definition                                                                      | type                 | value                                                                      | sample   |
| ------------- | ------------------------------------------------------------------------------- | -------------------- | -------------------------------------------------------------------------- | -------- |
| index         | The index of the child to show.                                                 | int                  |                                                                            |          |
| alignment     | How to align the non-positioned and partially-positioned children in the stack. | String               | enum values, please see enum Alignment, default value is Alignment.center. | "center" |
| textDirection | The text direction with which to resolve alignment.                             | String               | enum values, please see enum TextDirection                                 |          |
| children      | list of Widget                                                                  | List&#60;Widget&#62; |                                                                            |          |

## ExpandedSizedBox Widget

ExpandedSizedBox widget, here to see flutter [ExpandedSizedBox widget](https://docs.flutter.io/flutter/widgets/SizedBox-class.html) definition. It's a shortcut of **SizedBox.expand**. Supported json properties:

| property | definition                                | type   | value | sample |
| -------- | ----------------------------------------- | ------ | ----- | ------ |
| child    | The widget below this widget in the tree. | Widget |       |        |

## SizedBox Widget

SizedBox widget, here to see flutter [SizedBox widget](https://docs.flutter.io/flutter/widgets/SizedBox-class.html) definition. Supported json properties:

| property | definition                                                   | type   | value | sample |
| -------- | ------------------------------------------------------------ | ------ | ----- | ------ |
| width    | If non-null, requires the child to have exactly this width.  | double |       |        |
| height   | If non-null, requires the child to have exactly this height. | double |       |        |
| child    | The widget below this widget in the tree.                    | Widget |       |        |

## Opacity Widget

Opacity widget, here to see flutter [Opacity widget](https://docs.flutter.io/flutter/widgets/Opacity-class.html) definition. Supported json properties:

| property               | definition                                                           | type   | value | sample |
| ---------------------- | -------------------------------------------------------------------- | ------ | ----- | ------ |
| alwaysIncludeSemantics | Whether the semantic information of the children is always included. | bool   |       |        |
| opacity                | The fraction to scale the child's alpha value.                       | double |       |        |
| child                  | The widget below this widget in the tree.                            | Widget |       |        |

## Wrap Widget

Wrap widget, here to see flutter [Wrap widget](https://docs.flutter.io/flutter/widgets/Wrap-class.html) definition. Supported json properties:

| property           | definition                                                                                                            | type                 | value                                                                                       | sample       |
| ------------------ | --------------------------------------------------------------------------------------------------------------------- | -------------------- | ------------------------------------------------------------------------------------------- | ------------ |
| alignment          | How the children within a run should be placed in the main axis.                                                      | String               | enum values, please see enum WrapAlignment, default value is WrapAlignment.start.           | "start"      |
| crossAxisAlignment | How the children within a run should be aligned relative to each other in the cross axis.                             | String               | enum values, please see enum WrapCrossAlignment, default value is WrapCrossAlignment.start. | "start"      |
| direction          | The direction to use as the main axis.                                                                                | String               | enum values, please see enum Axis, default value is Axis.horizontal.                        | "horizontal" |
| runAlignment       | How the runs themselves should be placed in the cross axis.                                                           | String               | enum values, please see enum WrapAlignment, default value is WrapAlignment.start.           | "start"      |
| runSpacing         | The fraction to scale the child's alpha value.                                                                        | double               |                                                                                             | 0.0          |
| spacing            | How much space to place between children in a run in the main axis.                                                   | double               |                                                                                             | 0.0          |
| textDirection      | Determines the order to lay children out horizontally and how to interpret start and end in the horizontal direction. | String               | enum values, please see enum TextDirection, default value is null.                          | null         |
| verticalDirection  | Determines the order to lay children out vertically and how to interpret start and end in the vertical direction.     | String               | enum values, please see enum VerticalDirection, default value is VerticalDirection.down.    | "down"       |
| children           | The widgets below this widget in the tree.                                                                            | List&#60;Widget&#62; |                                                                                             |              |

## ClipRRect Widget

ClipRRect, here to see flutter [ClipRRect](https://api.flutter.dev/flutter/widgets/ClipRRect-class.html) definition. Supported json properties:

| property     | definition                                    | type   | value                                                          | sample                                    |
| ------------ | --------------------------------------------- | ------ | -------------------------------------------------------------- | ----------------------------------------- |
| borderRadius | The border radius of the rounded corners.     | String |                                                                | "topLeft,topRight,bottomLeft,bottomRight" |
| clipBehavior | Controls how to clip (default to "antiAlias") | String | enum values, please see enum Clip, default value is antiAlias. | "hardEdge"                                |
| child        | The widget below this widget in the tree.     | Widget |                                                                |                                           |

## SafeArea Widget

SafeArea, here to see flutter [SafeArea](https://api.flutter.dev/flutter/widgets/SafeArea-class.html) definition. Supported json properties:

| property | definition                                                                                    | type   | value                          | sample      |
| -------- | --------------------------------------------------------------------------------------------- | ------ | ------------------------------ | ----------- |
| bottom   | Whether to avoid system intrusions on the bottom side of the screen.                          | bool   | true or false, default is true | true        |
| right    | Whether to avoid system intrusions on the right.                                              | bool   | true or false, default is true | true        |
| top      | Whether to avoid system intrusions at the top of the screen, typically the system status bar. | bool   | true or false, default is true | true        |
| left     | Whether to avoid system intrusions on the left.                                               | bool   | true or false, default is true | true        |
| minimum  | This minimum padding to apply.                                                                | String | left,top,right,bottom          | "8,10,12,8" |
| child    | The widget below this widget in the tree.                                                     | Widget |                                |             |

## ListTile Widget

ListTile, here to see flutter [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) definition. Supported json properties:

| property       | definition                                                                         | type   | value                           | sample                    |
| -------------- | ---------------------------------------------------------------------------------- | ------ | ------------------------------- | ------------------------- |
| contentPadding | The tile's internal padding.                                                       | String | left,top,right,bottom           | "8,10,12,8"               |
| dense          | Whether this list tile is part of a vertically dense list.                         | bool   | true or false, default is false | true                      |
| enabled        | Whether this list tile is interactive.                                             | bool   | true or false, default is true  | true                      |
| isThreeLine    | Whether this list tile is intended to display three lines of text.                 | bool   | true or false, default is false | true                      |
| leading        | A widget to display before the title.                                              | Widget |                                 |                           |
| tapEvent       | tap event                                                                          | String |                                 | route://goToProductDetail |
| selected       | If this tile is also enabled then icons and text are rendered with the same color. | bool   | true or false, default is false | true                      |
| subtitle       | Additional content displayed below the title.                                      | Widget |                                 |                           |
| title          | The primary content of the list tile.                                              | Widget |                                 |                           |
| trailing       | A widget to display after the title.                                               | Widget |                                 |                           |

## SelectableText Widget

SelectableText, here to see flutter [SelectableText](https://api.flutter.dev/flutter/material/SelectableText-class.html) definition. Supported json properties:

| property      | definition                                                                                                                                                                  | type     | value                                                                                        | sample        |
| ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- | -------------------------------------------------------------------------------------------- | ------------- |
| data          | The text to display                                                                                                                                                         | String   |                                                                                              | "I am a text" |
| textAlign     | How the text should be aligned horizontally.                                                                                                                                | String   | One of the following string:<br>left (default)<br>right<br>center<br>justify<br>start<br>end | "left"        |
| maxLines      | An optional maximum number of lines for the text to span, wrapping if necessary. If the text exceeds the given number of lines, it will be truncated according to overflow. | int      |                                                                                              | 3             |
| textDirection | The directionality of the text.                                                                                                                                             | String   | One of the following string:<br>ltr (default) <br>rtl                                        | "ltr"         |
| textSpan      | The text to display as a TextSpan.                                                                                                                                          | TextSpan |                                                                                              |               |

## Icon Widget

Icon, here to see flutter [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| data          | The icon to display. The available icons are described | String |                                                       | "fa.google" : font_awesome_flutter lib's icon, "favorite" : flutter's icon |
| size          | The size of the icon in logical pixels.                | double |                                                       | 12.0                                                                       |
| color         | The color to use when drawing the icon.                | String | "#AARRGGBB" or "#RRGGBB"                              | "#FF00FF"<br>"#00FF00FF"                                                   |
| semanticLabel | Semantic label for the icon.                           | String |                                                       |                                                                            |
| textDirection | The text direction to use for rendering the icon.      | String | One of the following string:<br>ltr (default) <br>rtl | "ltr"                                                                      |

## DropCapText Widget

DropCapText, Supported json properties:

| property            | definition                                                                                                                                                                  | type      | value                                                                                                                                                                                                                                                                                      | sample                                 |
| ------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------- |
| data                | The text to display                                                                                                                                                         | String    |                                                                                                                                                                                                                                                                                            |                                        | "I am a text" |
| selectable          | Text can be selected                                                                                                                                                        | bool      |                                                                                                                                                                                                                                                                                            |                                        |
| mode                | Drop cap mode                                                                                                                                                               | String    | One of the following string:<br>inside (default) <br>upwards <br>aside <br>baseline                                                                                                                                                                                                        | "#FF00FF"<br>"#00FF00FF"               |
| style               | The style to apply to the text and the children.                                                                                                                            | TextStyle |                                                                                                                                                                                                                                                                                            | {"color": "#00FFFF", "fontSize": 26.0} |
| dropCapStyle        | The drop cap letter style                                                                                                                                                   | TextStyle |                                                                                                                                                                                                                                                                                            | {"color": "#00FFFF", "fontSize": 26.0} |
| textAlign           | How the text should be aligned horizontally.                                                                                                                                | String    | One of the following string:<br>left (default)<br>right<br>center<br>justify<br>start<br>end                                                                                                                                                                                               | "left"                                 |
| dropCap             | The drop cap                                                                                                                                                                | Widget    | {&quot;width&quot;:216.1,&quot;height&quot;:162.1,&quot;child&quot;:{&quot;type&quot;:&quot;NetworkImage&quot;,&quot;src&quot;:&quot;https://b.appsimg.com/upload/momin/2019/01/23/101/1548249269085.png &quot;,&quot;click_event&quot; : &quot;route://productDetail?goods_id=123&quot;}} |
| dropCapStyle        | The drop cap padding                                                                                                                                                        | String    | left,top,right,bottom                                                                                                                                                                                                                                                                      | "8,10,12,8"                            |
| dropCapChars        | The drop cap chars length                                                                                                                                                   | int       |                                                                                                                                                                                                                                                                                            | 1                                      |
| forceNoDescent      | forceNoDescent                                                                                                                                                              | bool      |                                                                                                                                                                                                                                                                                            |                                        |
| parseInlineMarkdown | if parse markdown                                                                                                                                                           | bool      |                                                                                                                                                                                                                                                                                            |                                        |
| textDirection       | The directionality of the text.                                                                                                                                             | String    | One of the following string:<br>ltr (default) <br>rtl                                                                                                                                                                                                                                      | "ltr"                                  |
| overflow            | How visual overflow should be handled.                                                                                                                                      | String    | One of the following string:<br>ellipsis (default)<br>clip<br>fade                                                                                                                                                                                                                         | "ellipsis"                             |
| maxLines            | An optional maximum number of lines for the text to span, wrapping if necessary. If the text exceeds the given number of lines, it will be truncated according to overflow. | int       | One of the following string:<br>start (default) <br>end                                                                                                                                                                                                                                    | "end"                                  |
| dropCapPosition     | drop cap position                                                                                                                                                           | String    |                                                                                                                                                                                                                                                                                            | 3                                      |

## Scaffold Widget

Scaffold, Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| appBar        | An app bar to display at the top of the scaffold.      | Widget |                                                       |                                                                            |
| body          | The primary content of the scaffold.                   | Widget |                                                       |                                                                            |
| floatingActionButton         | A button displayed floating above [body], in the bottom right corner.                | Widget |                               |                                                 |
| backgroundColor | The color of the [Material] widget that underlies the entire Scaffold.                           | "#AARRGGBB" or "#RRGGBB"                              | "#FF00FF"<br>"#00FF00FF"                                                   |

## AppBar Widget

AppBar, Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| title        | The primary widget displayed in the app bar.     | Widget |                                                       |                                                                            |
| leading          | A widget to display before the [title].                 | Widget |                                                       |                                                                            |
| actions         | Widgets to display in a row after the [title] widget.             | List<Widget> |                               |                                                 |
| centerTitle          | Whether the title should be centered.                                                                                                                                                       | bool      |                                                                                                                                                                                                                                                                                            |                                        |
| backgroundColor | The color to use for the app bar's material. Typically this should be set along with [brightness], [iconTheme], [textTheme].                           | "#AARRGGBB" or "#RRGGBB"                              | "#FF00FF"<br>"#00FF00FF"                                                   |

## LimitedBox Widget

LimitedBox, here to see flutter [LimitedBox](https://api.flutter.dev/flutter/widgets/LimitedBox-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| maxHeight        | The maximum height limit to apply in the absence of a BoxConstraints.maxHeight constraint.     | double |                                                       |                                                                            |
| maxWidth          | The maximum width limit to apply in the absence of a BoxConstraints.maxWidth constraint.                | double |                                                       |                                                                            |
| child    | The widget below this widget in the tree.                                                     | Widget |                                |             |

## Offstage Widget

Offstage, here to see flutter [Offstage](https://api.flutter.dev/flutter/widgets/Offstage-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| offstage        | Whether the child is hidden from the rest of the tree.    | bool |                                                       |                                                                            |
| child    | The widget below this widget in the tree.                                                     | Widget |                                |             |

## OverflowBox Widget

OverflowBox, here to see flutter [OverflowBox](https://api.flutter.dev/flutter/widgets/OverflowBox-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| alignment   | How to align the child.                                                                     | String         | One of the following string:<br>topLeft<br>topCenter<br>topRight<br>centerLeft<br>center<br>centerRight<br>bottomLeft<br>bottomCenter<br>bottomRight | "topLeft"                            |
| maxHeight        | The maximum height constraint to give the child. Set this to null (the default) to use the constraint from the parent instead.    | double |                                                       |                                                                            |
| maxWidth          | The maximum width constraint to give the child. Set this to null (the default) to use the constraint from the parent instead.               | double |                                                       |                                                                            |
| minHeight        | The minimum height constraint to give the child. Set this to null (the default) to use the constraint from the parent instead.   | double |                                                       |                                                                            |
| minWidth          | The minimum width constraint to give the child. Set this to null (the default) to use the constraint from the parent instead.              | double |                                                       |                                                                            |
| child    | The widget below this widget in the tree.                                                     | Widget |                                |             |

## Divider Widget

Divider, here to see flutter [Divider](https://api.flutter.dev/flutter/material/Divider-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| height   | The divider's height extent.                                                                   | double         | 8.0 |                           |
| thickness        | The thickness of the line drawn within the divider.    | double |   2.0                                                    |                                                                            |
| indent          | The amount of empty space to the leading edge of the divider.              | double |        8.0                                               |                                                                            |
| endIndent        | The amount of empty space to the trailing edge of the divider.  | double |                       8.0                                |                                                                            |
| color          | The color to use when painting the line.             | String         | "#AARRGGBB" or "#RRGGBB"                                                                                                                             | "#FF00FF"<br>"#00FF00FF"             |

## RotatedBox Widget

RotatedBox, here to see flutter [RotatedBox](https://api.flutter.dev/flutter/widgets/RotatedBox-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| quarterTurns   | The number of clockwise quarter turns the child should be rotated.                                                                   | int         | 3 |                           |
| child    | The widget below this widget in the tree.                                                     | Widget |                                |             |

## Card Widget

Card, here to see flutter [Card](https://api.flutter.dev/flutter/material/Card-class.html) definition. Supported json properties:

| property      | definition                                             | type   | value                                                 | sample                                                                     |
| ------------- | ------------------------------------------------------ | ------ | ----------------------------------------------------- | -------------------------------------------------------------------------- |
| color                 | The card's background color.                                                                                          | int    |   3 | |
| shadowColor           | The color to paint the shadow below the card.                                                                         | int    |   3 | |
| elevation             | The z-coordinate at which to place this card. This controls the size of the shadow below the card.                    | int    |   8 | |
| borderOnForeground    | Whether to paint the shape border in front of the child.                                                              | bool   |   true | |
| clipBehavior          | The content will be clipped (or not) according to this option.                                                        | String |        | |
| margin                | The empty space that surrounds the card.                                                                              | String |   left,top,right,bottom  | |
| semanticContainer     | Whether this widget represents a single semantic container, or if false a collection of individual semantic nodes.    | bool   |   true | |
| child                 | The widget below this widget in the tree.                                                                             | Widget |        | |
| shape                 | The shape of the card's Material.                                                                                     | Map    |        | |


## SingleChildScrollView widget

SingleChildScrollView, here to see flutter [SingleChildScrollView](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html) definition. Suppert json properties:

| property        | definition                                                     | type   | value                                                              | sample     |
|-----------------|----------------------------------------------------------------|--------|--------------------------------------------------------------------|------------|
| reverse         | Whether the scroll view scrolls in the reading direction.      | bool   | default value is false                                             |            |
| clipBehavior    | The content will be clipped (or not) according to this option. | String | enum values, please see enum Clip, default value is Clip.hardEdge. |            |
| padding         | The internal padding for the SingleChildScrollView's child.    | String | left,top,right,bottom                                              | "0,0,0,0"  |
| scrollDirection | The axis along which the scroll view scrolls.                  | String | enum values, please see enum Axis, default value is Axis.vertical. | "vertical" |
| child           | The widget below this widget in the tree.                      | Widget |                                                                    |            |
