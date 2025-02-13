﻿---
title: Split a Document
description: "Aspose.Words for Java provides you with an efficient way to split one document into many documents by headings or sections, as well as pages or page ranges."
type: docs
weight: 80
url: /java/split-a-document/
---

*Splitting* or *split a document* is the process of breaking a large document into a greater number of smaller files. There are various reasons to split a file. For example, you only need some pages from a specific document and not the entire one. Or for privacy reasons, you want to share only some parts of a document with others. With the splitting feature, you can get only the required parts of the document and do the necessary actions with them, for example, to mark up, save, or send.

Aspose.Words provides you with an efficient way to split one document into several documents by headings or sections. You can also split a document by pages or by page ranges. Both splitting options will be described in this article.

To split a document into smaller files using Aspose.Words, you need to follow these steps:

1. Load the document in any supported format.
1. Split the document.
1. Save the output documents.

After you split a document, you will be able to open all the output documents that will start with the required pages, text, etc.

{{% alert color="primary" %}}

**Try online**

You can try this functionality with our [Free online document splitter](https://products.aspose.app/words/splitter).

{{% /alert %}}

## Split a Document Using Different Criteria

Aspose.Words enables you to split EPUB or HTML documents into chapters according to various criteria. In the process, the style and layout of the source document are preserved for the output documents.

You can specify criteria using the [DocumentSplitCriteria](https://apireference.aspose.com/words/java/com.aspose.words/documentsplitcriteria) enumeration. So you can divide a document into chapters using one of the following criteria or combine more than one criteria together:

- heading paragraph,
- section break,
- column break,
- page break.

When saving the output to HTML, Aspose.Words save each individual chapter as a separate HTML file. As a result, the document will be split into multiple HTML files. When saving the output to EPUB, Aspose.Words save the result in a single EPUB file regardless of the DocumentSplitCriteria value you used. So, using DocumentSplitCriteria for EPUB documents only affects the appearance of their content in reader applications: content will be divided into chapters and the document will no longer appear continuous.

{{% alert color="primary" %}} 

You cannot split a document using the [DocumentSplitCriteria](https://apireference.aspose.com/words/java/com.aspose.words/documentsplitcriteria) property when saving to MHTML format.

{{% /alert %}} 

In this section, we consider only some of the possible split criteria.

### Split a Document by Headings

To split a document into chapters by headings, use the **HeadingParagraph** value of the **DocumentSplitCriteria** property.

If you need to split a document by a specific level of heading paragraphs, such as headings 1, 2, and 3, use also the [DocumentSplitHeadingLevel](https://apireference.aspose.com/words/java/com.aspose.words/htmlsaveoptions#DocumentSplitHeadingLevel) property. The output will be divided by paragraphs formatted with the specified heading level.

The following code example demonstrates how to split a document into smaller parts by heading:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-loading_saving-ConvertToHTML-SplitDocumentByHeadingsHTML.java" >}}

Please note that for this criteria, Aspose.Words only supports saving to HTML format when splitting.

When saving to EPUB, the document is not split into a few files, and there will be only one output file.

### Split a Document by Sections

Aspose.Words also enables you to use section breaks to split documents and save them to HTML. For this purpose, use **SectionBreak** as the **DocumentSplitCriteria**:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-loading_saving-ConvertToHTML-SplitDocumentBySectionsHTML.java" >}}

There is another way to split the source document into several output documents, and you can choose any output format supported by Aspose.Words.

The following code example demonstrates how to split a document into smaller parts by section breaks (without using the DocumentSplitCriteria property):

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-SplitDocument-SplitDocumentBySections.java" >}}

## Splitting by Pages

You can also split a document page by page, by page ranges, or starting with the specified page numbers. In such case the [ExtractPages](https://apireference.aspose.com/words/java/com.aspose.words/document#extractPages(int,int)) method can do the job.

This section describes a few use cases of dividing documents by paged using the [Document](https://apireference.aspose.com/words/java/com.aspose.words/Document) class and the **ExtractPages** method.

{{% alert color="primary" %}} 

You can use any [output format supported by Aspose.Words](https://docs.aspose.com/words/java/supported-document-formats/).

{{% /alert %}} 

{{% alert color="primary" %}}

Due to the several nuances appearing while reducing the number of pages, a full match with the Microsoft Word layout is quite a complicated task. Therefore, depending on the document complexity, there may be slight differences in the resulting document layout from the original document.

{{% /alert %}}

### Split a Document Page by Page

Aspose.Words allows you to split a multi-page document page by page.

The following code example demonstrates how to divide a document and save each page as a separate document:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-SplitDocument-SplitDocumentPageByPage.java" >}}

### Split a Document by Page Ranges

Aspose.Words enables splitting a multi-page document by page ranges. You can split one file into many files with various page ranges or just select one range and save only this part of the source document. Note that you can choose the page range according to the maximum and minimum page number of a document.

The following code example demonstrates how to split a document into smaller parts by page range with specific start and end indexes:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-SplitDocument-SplitDocumentByPageRange.java" >}}

## Callback Option for Saving a Document

You can use the [DocumentPartSavingCallback](https://apireference.aspose.com/words/java/com.aspose.words/htmlsaveoptions#DocumentPartSavingCallback) property to control how Aspose.Words saves document parts when this document is exported into HTML format. This property allows you to rename output files or even to redirect them into custom streams.

Please note that this callback is not useful when saving to EPUB because all output parts must be saved into a single container – the .epub file. So, stream redirection is not supported, and the effect of renaming is not visible since files are renamed inside the container.

## Merge the Split Document with Another File

Aspose.Words enables you to merge the output split document with another document to form a new document. This can be called document merging.

The following code example shows how to merge a split document with another document:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-document-SplitDocument-MergeDocuments.java" >}}
