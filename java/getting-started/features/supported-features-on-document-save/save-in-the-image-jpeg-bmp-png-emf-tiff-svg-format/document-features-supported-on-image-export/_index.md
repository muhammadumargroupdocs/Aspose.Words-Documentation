﻿---
title: Document Features Supported on Image Export
type: docs
weight: 30
url: /java/document-features-supported-on-image-export/
---

{{% alert color="primary" %}} 

The Aspose.Words rendering engine can render entire documents or certain pages of any document loaded into many different rendered formats.

These formats are:

- Raster image formats such as JPEG, PNG, BMP, TIFF. Each page of the document is exported as a separate frame in the output TIFF file.
- Vector image formats such as EMF and SVG.
- To any printing device.
- A Graphics object.

You can also render Shape nodes separatly from the document to image or a Graphics object.

Aspose.Words renders these documents with high fidelity and most document features are supported.

There are save options to control how the document is rendered. There are often a few special save options for each image format. For example there are options to:

- Specify the brightness, contrast and color mode for the rendered output.
- Specify the page or page range to render.
- Choose the paper background color.
- Choose the resolution, pixelformat or scale to render the document with.

Currently only TrueType font formats are used during rendering or printing. Support for OpenType fonts is currently in progress.

During printing you can specify the document name which appears in any print dialogs. All properties related to printing such as paper size, paper tray, orientation etc. for each page of the document are correctly sent to the printer.

See the following links in the documentation for further information:

- [Save a Document]()
- [Rendering and Printing]()
- **ImageSaveOptions**
- **SvgSaveOptions**

{{% /alert %}} 

## General

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Attached Template |N/A | | |
|Built-In Properties |N/A |Built-in properties are not exported to image formats. | |
|Custom Properties |N/A | | |
|Custom Payload Part |N/A | | |
|Custom XML Data Storage |N/A | | |
|Digital Signature |N/A | | |
|Embedded Package |N/A |Exported as a plain image. | |
|Encryption |N/A | | |
|Font Table |Yes | | |
|Glossary Document/Quick Parts/Auto Text |N/A | | |
|Hyphenation |Planned |Paragraphs that require hyphenation are wrapped to the next line instead. | |
|Key Map Customizations |N/A | | |
|Mail Merge Recipient Data |N/A | | |
|Office Math |Planned |It is planned to convert Office Math to a regular image before rendering. | |
|Themes |Yes | | |
|Toolbar Customizations |N/A | | |
|Variables |N/A | | |
|VBA Project (Macro) |N/A | | |
|VBA Project Digital Signature |N/A | | |
|Background |Yes | | |
|Thumbnail |N/A |Most rendered formats display thumbnails, however they are generated by the host application on open and not stored with the document. | |

## Embedded Fonts

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Embedding Fonts |Yes |Embedded fonts are also used during rendering. | |
|Embed Only Non-Standard Fonts |Planned | | |

## Bibliography

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Bibliography |Yes |Bibliography text is rendered as normal text. | |
|Sources/Citations |Yes |Bibliography sources are not saved when rendering. | |
|Citation Style |N/A | | |

## Protection

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Allow Only Comments |N/A | | |
|Allow Only Form Fields |N/A | | |
|Allow Only Revisions |N/A | | |
|Limit Formatting to Selection of Styles |N/A | | |
|Protection Password (Legacy) |N/A | | |
|Protection Password (OOXML) |N/A | | |
|Protected Sections |N/A | | |
|Protection Ranges |N/A | | |
|Read Only |N/A | | |

## Settings

|**Feature**|**Supported**|**Comment**|**See Also**|
| :- | :- | :- | :- |
|Asian Typography Settings |N/A | | |
|Compatibility Options |N/A |Compatibility Options can influence how the document content is appears. These properties are not supported upon rendering to image or during printing. | |
|Endnote Options |N/A | | |
|Footnote Options |N/A | | |
|Mail Merge Settings |N/A | | |
|Print Settings |N/A | | |
|Show/Hide Settings |N/A | | |
|View Settings |N/A | | |
|Web Settings |N/A | | |
|XML Settings |N/A | | |

