﻿---
title: Drawing Object Features Supported on OpenDocument Import
type: docs
weight: 40
url: /java/drawing-object-features-supported-on-opendocument-import/
---

{{% alert color="primary" %}} 

Aspose.Words supports {many|multiple|several|a few|numerous} types of drawing entities on document load.

Graphic objects in any document format loaded into Aspose.Words are represented in the model by Shape nodes. This node type provides member which allow you to access and modify both the image data and also the properties of the object such as positioning and behavior.

Using Aspose.Words you can create and modify different types of graphic objects.

Almost all properties that deal with object positioning use points as a unit of measurement. There is a class to help work with points by converting different types of units to and from points e.g pixel to point, point to the inch.

[Jump to this location in the export section]()

{{% /alert %}} 

## Images

You can insert new images of any type into a document by using the DocumentBuilder.InsertImage method or by setting the image of an existing shape using the Shape.ImageData property.

All of the following image types listed in the table below this overview are supported. When a document contains {multiple|several|a few|many|numerous} references to the same image from an external address (e.g the internet) then the image is only downloaded once.

It is useful to know how images are stored in the model when you insert a new image using Aspose.Words There are three classes of the image from the Aspose.Words point-of-view.

1. Microsoft Word Native (which can be stored directly in model without any changes). These are the JPEG, PNG, and PICT formats and are left untouched during insertion.

2. Windows Metafiles (can also be stored directly in the model). These are the EMF and WMF vector formats and are left untouched during insertion.

3. Microsoft Word Non-Native. These are not supported and have to be converted (to PNG) before being stored in the model. These are the GIF, TIFF and BMP formats.

Aspose.Words automatically converts the formats found in the third item if such a format is inserted into a document.

The reason why the formats found in the third item must be converted to PNG is because Microsoft Word formats don't support the GIF or TIFF formats. It makes sense to store these in memory in a format that is supported by Microsoft Word. Note that when you insert an image of these types in Microsoft Word it also converts them to PNG in the same way behind the scenes.

BMP is the exception and is supported by Microsoft Word. However, since a BMP stored in memory is often very large it too is converted to PNG to save memory.

Note that PNG is a lossless compression format, so there is no degradation of image quality using the above techniques.

If you are using Aspose.Words for Java you may need to ensure that you have the appropriate JAI image libraries installed in order for Aspose.Words to convert GIF, TIFF and BMP formats to PNG. If the required functionality is missing you may receive a "Image type not supported" exception.

See the following links in the documentation for further information:

- **Shape.IsImage**
- **LoadOptions.BaseUri**
- **Shape.ImageData**
- **ImageData.ImageType**
- **ConvertUtil**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|PNG |Yes | | |
|JPG |Yes | | |
|WMF |Yes | | |
|EMF |Yes | | |
|EMF+ |Yes | | |
|BMP |Yes | | |
|GIF |Yes | | |
|TIFF |Yes | | |
|Borders |Yes | |- **ImageData.Borders**|
|Cropping |Yes | |<p>- **ImageData.CropLeft** </p><p>- **ImageData.CropRight** </p><p>- **ImageData.CropTop** </p><p>- **ImageData.CropBottom**</p>|
|Alternative text |Planned | |- **Shape.AltText**|

## Image Recoloring

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Brightness |Yes | |- **ImageData.Brightness**|
|Contrast |Yes | |- **ImageData.Contrast**|
|Recolor |N/A | | |

## Textboxes

See the following link in the documentation for further information:

- **Shape.TextBox**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Text Direction |Planned | |- **TextBox.LayoutFlow**|
|Linked Textboxes |Planned |Linked text boxes are supported in Aspose.Words model, however there is currently no API to access or modify these values. | |
|Internal Margins |Planned | |<p>- **TextBox.InternalMarginLeft** </p><p>- **TextBox.InternalMarginRight** </p><p>- **TextBox.InternalMarginTop** </p><p>- **TextBox.InternalMarginBottom**</p>|
|Vertical Alignment |N/A | | |
|Resize To Fit Text |Yes | |- **TextBox.FitShapeToText**|
|Text in Other Shapes |Yes | | |

## OLE Objects

Using Aspose.Words OLE Objects from Word documents are exported as images so are imported back as regular images and not OLE Objects.

Support for native embedded objects in ODT during load is currently unsupported but is planned.

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Linked |N/A | | |
|Embedded |N/A | | |
|Draw Aspect |N/A | | |
|Auto Update |N/A | | |
|Lock |N/A | | |
|Ole Object Data |N/A | | |
|Ole Object Picture |N/A | | |
|Source Range |N/A | | |

## ActiveX Controls

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Persistent Properties Storage |N/A | | |

## Shapes

Aspose.Words supports almost all Shape and Image elements. References to external images such as ones on the internet are automatically downloaded as well. All of these elements are imported into Aspose.Words as Shape nodes.

Using Aspose.Words you can create any type of new shape including images, AutoShapes etc. you can also access, modify and remove such elements from a document.

The most common properties such as borders or position can be modified through the API. There is currently no API for modifying advanced shape properties e.g ArcSize of a RoundRectangle.

There is also no API for creating or modifying advanced features such as Diagrams, Ink Annotations or Charts. These elements are retained fully during conversion.

Shapes which are linked to external resources such as images on the internet can be automatically downloaded when required.

Autoshapes and textboxes are imported back from ODT as their applicable Microsoft Word shape types.

Other elements may be imported as images.

See the following links in the documentation for further information:

- **Shape**
- **Shape.ShapeType**
- **Shape.IsTopLevel**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Lines |Yes |After round-trip some elements are imported as regular images. | |
|Basic Shapes |Yes | | |
|Block Arrows |Yes | | |
|Flowcharts |Yes | | |
|Callouts |Yes | | |
|Stars and Banners |Yes | | |
|Group Shape |Yes | |<p>- **GroupShape** </p><p>- **Shape.IsGroup**</p>|
|Drawing Canvas |Yes | | |
|Signature Line |N/A | | |
|Ink Annotation |N/A | | |
|Clip Art |Yes | | |
|Diagrams (VML) |Yes |VML graphics format is normally used in pre-OOXML formats such as DOC or RTF. | |
|SmartArt (VML) |Yes |Represented as a groupshape with child shapes representing the different elements. <br><br>You can add, modify or remove parts of the smart art. You can also extract the plain text content. | |
|Charts (VML) |Yes |Currently there is no API for accessing or modifying the content of a chart. <br><br>You cannot retrieve the text of a chart. | |
|Shape Customizations |N/A | | |
|Hyperlink on Shape |N/A | | |
|Watermark |N/A | | |

## WordArt

WordArt is imported as a Shape object in Aspose.Words. This class provides properties to extract and modify properties of a WordArt object.

Using Aspose.Words you can create new WordArt graphics. Note that not all WordArt features are avalible through the API.

Most WordArt is currently lost on ODT round-trip.

See the following links in the documentation for further information:

- **Shape.IsWordArt**
- **Shape.TextPath**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Styles |Planned | | |
|Outline |Planned | | |
|Fill |Planned | | |
|3D Properties |Planned | | |
|Text Spacing |Planned | |- **TextBox.Spacing**|
|Vertical Text |N/A | | |
|Even Height |Planned | |- **TextPath.SameLetterHeight**|
|Align and Justify Text |Planned | |- **Textbox.TextPathAlignment**|
|WordArt Shape |Planned | | |

## Horizontal Line Object

Horizontal Line Objects are represented as a Shape node in Aspose.Words. Since a Shape can also represent an image there is a property which returns if this shape is a Horizontal Line Object.

Using Aspose.Words you can create new or modify existing Horizontal Rule objects.

A horizontal line object is exported as an image. During round-trip it it imported as an image and not as a horiziontal rule again.

See the following link in the documentation for further information:

- **Shape.IsHorizontalRule**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Width |Yes |Width appears in the API only as absoloute points and not as percent as what Horizontal Line widths are normally calcuated in.The percent value can be calculated by using the width of the page. |- **Shape.Width**|
|Height |Yes | |- **Shape.Height**|
|Color |Yes | |- **Shape.FillColor**|
|Alignment |Planned | |- **Shape.HorizontalAlignment**|
|Hyperlink |N/A | | |
|Image |N/A | | |

## Position

Aspose.Words supports creating objects with a variety of different positioning settings. Almost all possible settings are supported in the Aspose.Words model

You can also access and modify existing shape's positioning.

See the following links in the documentation for further information:

- **Shape.Top**
- **Shape.Width**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Inline |Yes | |- **Shape.IsInline**|
|Floating |Yes |In a Word document floating content is anchored to a paragraph. When a document is loaded into Aspose.Words this anchor is represented by the position of the Shape node in relation to Paragraph and the Runs of text. | |
|Wrap Type |Yes |All wrap types are imported back to Microsoft Word eqivilants apart from Tight and Through which are imported as Square and Behind Text respectively. <br><br>This relates to ODT not having all wrap types the same as Microsoft Word. We will try to improve this in the future to allow better round-trip of this property. |- **Shape.WrapType**|
|Wrap Sides |Planned |All floating content is imported as "Both sides" wrap. <br><br>This will be improved in future versions. |- **Shape.WrapSide**|
|Distance from Text |Yes | |<p>- **Shape.DistanceFromTextTop** </p><p>- **Shape.DistanceFromTextBottom** </p><p>- **Shape.DistanceFromTextLeft** </p><p>- **Shape.DistanceFromTextRight**</p>|
|Z-Order |Yes | |- **Shape.ZOrder**|
|Polygon Wrap Points |N/A | | |
|Rotation |N/A | | |
|Flip |Yes | |- **Shape.FlipOrientation**|
|Horizontal Alignment |Yes | |- **Shape.HorizontalAlignment**|
|Horizontal Position Relative To |Yes | |- **Shape.RelativeHorizontalPosition**|
|Vertical Alignment |Yes | |- **Shape.VerticalAlignment**|
|Vertical Position Relative To |Yes | |- **Shape.RelativeVerticalPosition**|
|Anchor Lock |N/A |When loaded in a document it is given the default value of No Anchor lock. | |
|Allow Overlap |N/A |When imported from ODT the shape has this property enabled by default. | |
|Layout in Table Cell |N/A |When imported from ODT the shape has this property enabled by default. | |

## Size

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Width and Height |Yes | |<p>- **Shape.Width** </p><p>- **Shape.Height**</p>|
|Scale |N/A | | |
|Relative Size |N/A | | |
|Lock Aspect Ratio |Planned | | |

## Fill

Using Aspose.Words you can access, modify and remove most fill properties of a shape.

See the following link in the documentation for further information:

- **Shape.Fill**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|No Fill |Yes | |- **Shape.Filled**|
|Solid Fill |Yes | |- **Shape.FillColor**|
|Gradient Fill |Yes |There is currently no API for accessing or modifying the graident fill of a shape. | |
|Pattern Fill |Planned |The raw bytes of the Pattern fill can be extracted only. A new pattern can not be set. <br><br>Such pattern fills don't have eqivilants in ODT but can be round-tripped as image. |- **Fill.ImageBytes**|
|Picture or Texture Fill |Planned |The raw bytes of the Texture fill can be extracted only. A new texture or image can not be set. <br><br>Such pattern fills don't have eqivilants in ODT but can be round-tripped as image. |- **Fill.ImageBytes**|

## Line Style

Some line styles might appear different when imported from ODT due to there being lesser line styles in ODT compared with Microsoft Word.

See the following links in the documentation for further information:

- **Shape.Stroke**
- **Shape.Stroked**

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Line Color |Yes | |<p>- **Stroke.Color** </p><p>- **Stroke.Color2**</p>|
|Line Fill |N/A | | |
|Line Width |Yes | |- **Stroke.Weight**|
|Compound Type |N/A | | |
|Dash Type |Yes | |- **Stroke.DashStyle**|
|Cap Type |N/A | | |
|Join Type |Yes | |- **Stroke.JoinStyle**|
|Arrow Settings |Yes |Some arrow types might not be present in ODT and therefore cannot be round-tripped correctly. |<p>- **Stroke.StartArrowLength** </p><p>- **Stroke.StartArrowType** </p><p>- **Stroke.EndArrowLength** </p><p>- **Stroke.EndArrowType**</p>|

## Shadow

Most shadow properties are preserved during import. There is currently no API to access the shadow data of a graphic object.

This will be added in a future version.

Shadows options in ODT are simpler so not all properties can be round-tripped from Microsoft Word documents to ODT back to Word again.

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Shadow |Planned | | |

## 3D Properties

ODT format does not support 3D features.

In a future version shapes with 3D formatting may be exported as an image. During import 3D properties will appear visually, however will not be editable.

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|3D Properties |N/A | | |

