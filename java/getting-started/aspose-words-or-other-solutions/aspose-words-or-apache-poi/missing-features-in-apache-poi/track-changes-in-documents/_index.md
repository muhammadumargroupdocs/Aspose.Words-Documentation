---
title: Track Changes in Documents
description: "Aspose.Words for Java allows to track changes in documents. Apache POI does not provide an opportunity to track changes in a document."
type: docs
weight: 50
url: /java/track-changes-in-documents/
---

{{% alert color="primary" %}} 

See more details in the ["Track Changes in a Document"](https://docs.aspose.com/words/java/track-changes-in-a-document/) article.

{{% /alert %}}

The [AcceptAllRevisions](https://apireference.aspose.com/words/java/com.aspose.words/Document#acceptAllRevisions()) method allows you to "accept" all tracked changes in the document. Calling this method is similar to selecting "Accept All Changes" in Microsoft Word. Aspose.Words will actually delete fragments marked as "delete revisions", retain fragments marked as "insert revisions", and apply formatting changes. Note that comments are not affected during this operation.

The following code example shows how to accept all revisions in a document:

{{< highlight java >}}
Document doc = new Document(dataDir + "trackDoc.doc");

doc.acceptAllRevisions();
doc.save(dataDir + "AsposeAcceptChanges.doc", SaveFormat.DOC);
{{< /highlight >}}

See also:

- [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/blob/master/Plugins/Aspose_Words_for_Apache_POI/src/main/java/com/aspose/words/examples/asposefeatures/workingwithdocument/trackchanges/AsposeTrackChanges.java) for code example
- [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/releases/tag/Aspose.Words_Java_for_Apache_POI_WP-v1.0.0) for running code
