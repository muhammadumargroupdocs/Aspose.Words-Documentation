﻿---
title: Insert and Append Documents
description: "Aspose.Words for Java enables you to combine documents into one: insert or append a document into a new or existing one using find and replace, merge field, bookmark, or simply at the document end."
type: docs
weight: 70
url: /java/insert-and-append-documents/
aliases: 
 - /java/joining-and-appending-documents/
 - /java/join-and-append-documents/
 - /java/appending-documents/
 - /java/how-to-insert-a-document-into-another-document/
 - /java/joining-documents/
 - /java/joining-documents-with-different-formatting/
 - /java/joining-documents-with-headers-and-footers/
---

Sometimes it is required to combine multiple documents into one. You can do this manually or you can use Aspose.Words insert or append feature.

The insert operation enables you to insert the content of previously created documents into a new or existing one.

In turn, the append feature allows you to add a document only at the end of another document.

This article explains how to insert or append a document to another one in different ways and describes the common properties that you can apply while inserting or appending documents.

## Insert a Document

As mentioned above, in Aspose.Words a document is represented as a tree of nodes, and the operation of inserting one document into another is copying nodes from the first document tree to the second one.

You can insert documents in a variety of locations in different ways. For example, you can insert a document through a replace operation, a merge field during a merge operation, or via a bookmark.

You can also use the [InsertDocument](https://apireference.aspose.com/words/cpp/class/aspose.words.document_builder#a26e2212090fca2e40dee1cad06136547) method, which is similar to inserting a document in Microsoft Word, to insert a whole document at the current cursor position without any previous importing.

The following subsections describe the options during which you can insert one document into another.

### Insert a Document During Find and Replace Operation

You can insert documents while performing find and replace operations. For example, a document can contain paragraphs with the text [INTRODUCTION] and [CONCLUSION]. But in the final document, you need to replace those paragraphs with the content obtained from another external document. To achieve that, you will need to create a handler for the replace event.

The following code example demonstrates how to create a handler for the replacing event to use it later in the inserting process:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-InsertDocumentAtReplaceHandler.java" >}}

The following code example shows how insert content of one document into another during a find and replace operation:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-insertDocumentAtReplace.java" >}}

### Insert a Document During Mail Merge Operation

You can insert a document into a merge field during a mail merge operation. For example, a mail merge template can contain a merge field such as [Summary]. But in the final document, you need to insert content obtained from another external document into this merge field. To achieve that, you will need to create a handler for the merge event.

The following code example demonstrates how to create a handler for the merging event to use it later in the inserting process:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-InsertDocumentAtMailMergeHandler.java" >}}

The following code example demonstrates how to insert a document into the merge field using the created handler:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-insertDocumentAtMailMerge.java" >}}

### Insert a Document at Bookmark

You can import a text file into a document and insert it right after a bookmark that you have defined in the document. To do this, create a bookmarked paragraph where you want the document to be inserted.

The following coding example shows how to insert the contents of one document to a bookmark in another document:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-insertADocumentAtABookmark.java" >}}

{{% alert color="primary" %}} 

Note that the bookmark should not enclose many paragraphs or text that you want them to appear in your final resulting document.

{{% /alert %}} 

## Append a Document

You may have a use case where you need to include additional pages from a document to the end of an existing document. To do this, you just need to call the [AppendDocument](https://apireference.aspose.com/words/cpp/class/aspose.words.document#aeb1c57b21244b7c3b4426c0ff6ca5e34) method to add a document to the end of another one.

{{% alert color="primary" %}} 

Note that [AppendChild](https://apireference.aspose.com/words/cpp/class/aspose.words.composite_node#a80e83738141f960d498b4ee06f7ff5ad) is a node level method within a document. For example, you can create a paragraph, set formatting properties, and then append it as a child to the body using the **AppendChild** method.

{{% /alert %}} 

The following code example shows how to append a document to the end of another document:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-joining_appending-KeepSourceFormatting-KeepSourceFormatting.java" >}}

## Import and Insert Nodes Manually

Aspose.Words allows you to insert and append documents automatically without any previous importing requirements. However, if you need to insert or append a specific node of your document, such as a section or a paragraph, then first you need to import this node manually.

When you need to insert or append one section or paragraph to another, you essentially need to import the nodes of the first document node tree into the second one using the [ImportNode](https://apireference.aspose.com/words/cpp/class/aspose.words.node_importer#a21194c4fd308daad4b10ef6ac97e5a46) method. After importing your nodes, you need to use the [InsertAfter](https://apireference.aspose.com/words/cpp/class/aspose.words.composite_node#af9b57adf57898c923d92ee61abb0b0ed)/[InsertBefore](https://apireference.aspose.com/words/cpp/class/aspose.words.composite_node#aaa6066b95aa9df42a8dff970929ccf98) method to insert a new node after/before the reference node. This enables you to customize the inserting process by importing nodes from a document and inserting it at given positions.

You can also use the [AppendChild](https://apireference.aspose.com/words/cpp/class/aspose.words.composite_node#a80e83738141f960d498b4ee06f7ff5ad) method to add a new specified node to the end of the list of child nodes, for example, if you want to append content at the paragraph level instead of at the section level.

The following code example shows how to insert document content into another document using the **InsertDocument** method:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-joining_appending-InsertDocumentWithBuilder-InsertDocumentWithBuilder.java" >}}

The following code example demonstrates how to manually import nodes and insert them after a specific node using the **InsertAfter** method:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-InsertDocumentIntoAnotherDocument-insertDocument.java" >}}

{{% alert color="primary" %}} 

The import creates a new node that is a copy of the original node and suitable for insertion into the destination document.

{{% /alert %}} 

Content is imported into the destination document section by section, which means that settings, such as page setup and headers or footers, are preserved during import. It is also useful to note that you can define formatting settings when you insert or append a document to specify how two documents are joined together.

## Common Properties for Insert and Append Documents

Both [InsertDocument](https://apireference.aspose.com/words/cpp/class/aspose.words.document_builder#a893fb304c8f11e0d720537cd96d798b8) and [AppendDocument](https://apireference.aspose.com/words/cpp/class/aspose.words.document#a7b09f54d466b74ee498156e848b9ba86) methods accept [ImportFormatMode](https://apireference.aspose.com/words/cpp/namespace/aspose.words#aafaa52cbf0baa49c3225787c23a8c949) and [ImportFormatOptions](https://apireference.aspose.com/words/cpp/class/aspose.words.import_format_options) as input parameters. The **ImportFormatMode** enables you to control how document formatting is merged when you import content from one document into another by selecting different format modes such as [UseDestinationStyles](https://apireference.aspose.com/words/cpp/namespace/aspose.words#aafaa52cbf0baa49c3225787c23a8c949), [KeepSourceFormatting](https://apireference.aspose.com/words/cpp/namespace/aspose.words#aafaa52cbf0baa49c3225787c23a8c949), and [KeepDifferentStyles](https://apireference.aspose.com/words/cpp/namespace/aspose.words#aafaa52cbf0baa49c3225787c23a8c949). The **ImportFormatOptions** allows you to select different import options such as [IgnoreHeaderFooter](https://apireference.aspose.com/words/cpp/class/aspose.words.import_format_options#ad4260c1a00c4beaee3be48c478df5979), [IgnoreTextBoxes](https://apireference.aspose.com/words/cpp/class/aspose.words.import_format_options#a6367e32cb6e4b9389197d3965d876223), [KeepSourceNumbering](https://apireference.aspose.com/words/cpp/class/aspose.words.import_format_options#a948875cb87890c1db77f994c132e4196), [MergePastedLists](https://apireference.aspose.com/words/java/com.aspose.words/importformatoptions#MergePastedLists), and [SmartStyleBehavior](https://apireference.aspose.com/words/cpp/class/aspose.words.import_format_options#a0f363fe4e7ea99a6e7e3344afdf625ec).

Aspose.Words allows you to adjust the visualization of a resulting document when two documents are added together in an insert or append operation by using the [Section](https://apireference.aspose.com/words/cpp/class/aspose.words.section) and [PageSetup](https://apireference.aspose.com/words/cpp/class/aspose.words.page_setup/) properties. The **PageSetup** property contains all the attributes of a section such as [SectionStart](https://apireference.aspose.com/words/cpp/class/aspose.words.page_setup#ab033ba83ada1634fecee703880b2652f), [RestartPageNumbering](https://apireference.aspose.com/words/cpp/class/aspose.words.page_setup#addcf361d06bb0a7f0aa8b619063cff6e), [PageStartingNumber](https://apireference.aspose.com/words/cpp/class/aspose.words.page_setup#ae5eb823b2a959d67e345c41ca35a7648), [Orientation](https://apireference.aspose.com/words/cpp/class/aspose.words.page_setup#aeda4d058eb5747bfb605131a9f146e71), and others. The most common use case is to set the **SectionStart** property to define if the added content will appear on the same page or split into a new one.

{{% alert color="primary" %}} 

Note that the **Section** and **PageSetup** properties do not control how two documents are inserted/appended together. They only allow you to change the appearance of your result document.

{{% /alert %}} 

The following code example shows how to append one document to another while keeping the content from splitting across two pages:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-joining_appending-DifferentPageSetup-DifferentPageSetup.java" >}}
