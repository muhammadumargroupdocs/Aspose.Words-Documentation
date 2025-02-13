---
title: Convert Word Document to TIFF
description: "Aspose.Words for .NET allows to convert Word document to TIFF. NPOI does not provide an opportunity to work with formats other than Word."
type: docs
weight: 20
url: /net/convert-word-document-to-tiff/
---

{{% alert color="primary" %}} 

To convert a Word document to TIFF, simply invoke the [Save](https://apireference.aspose.com/words/net/aspose.words/document/methods/save/index) method and specify a file name with the “.TIFF” extension.

See more details in the ["Save a Document"](https://docs.aspose.com/words/net/save-a-document/) documentation section.

{{% /alert %}} 

The following code example shows how to convert document pages from DOC to TIFF:

{{< highlight csharp >}}
string fileDir = "../../data/";

// open the document
Document doc = new Document(fileDir + "test.doc");

// Save the document as multipage TIFF.
doc.Save("TestFile Out.tiff");
{{< /highlight >}}

See also:

- [Github](https://github.com/asposewords/Aspose.Words-for-.NET/releases/tag/Aspose.WordsFeaturesmissinginNPOIv1.2) for code example

- [Github](https://github.com/asposewords/Aspose.Words-for-.NET/releases/download/Aspose.WordsFeaturesmissinginNPOIv1.2/08.02-ConvertWordDocumentToTIFF.zip) for running code
