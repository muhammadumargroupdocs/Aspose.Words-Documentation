---
title: Insert Picture into a Document
description: "Aspose.Words for Java allows to insert picture into a document. Apache POI does not provide an opportunity to insert picture into a document."
type: docs
weight: 10
url: /java/insert-picture-in-document/
---

{{% alert color="primary" %}}

See more details in the ["Working with Images"](https://docs.aspose.com/words/java/working-with-images/) documentation section.

{{% /alert %}} 

The [DocumentBuilder](https://apireference.aspose.com/words/java/com.aspose.words/DocumentBuilder) provides several overloads of the [InsertImage](https://apireference.aspose.com/words/java/com.aspose.words/documentbuilder#insertImage(byte[])) method that allow you to insert an inline or floating image. If the image is an EMF or WMF metafile, it will be inserted into the document in metafile format. All other images will be saved in PNG format.

The following code example shows how to insert an image info a document:

{{< highlight java >}}
Document doc = new Document();
DocumentBuilder builder = new DocumentBuilder(doc);

builder.insertImage("image.jpg");
doc.save("insertedImage.docx");
{{< /highlight >}}

See also:

* [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/blob/master/Plugins/Aspose_Words_for_Apache_POI/src/main/java/com/aspose/words/examples/asposefeatures/workingwithdocument/insertpicture/AsposeInsertImage.java) for code example

- [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/releases/tag/Aspose.Words_Java_for_Apache_POI_WP-v1.0.0) for running code
