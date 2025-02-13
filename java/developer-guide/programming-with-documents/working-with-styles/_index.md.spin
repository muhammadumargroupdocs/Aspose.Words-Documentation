﻿---
title: Working with Styles
type: docs
weight: 23
url: /java/working-with-styles/
aliases: [/java/how-to-extract-content-based-on-styles/]
---

The [StyleCollection](https://apireference.aspose.com/words/java/com.aspose.words/StyleCollection) class is used to manage built-in and apply user-defined settings to styles.

## How to Extract Content Based on Styles

At a simple level, retrieving the content based on styles from a Word document can be useful to identify, list and count paragraphs and runs of text formatted with a specific style. For example, you may need to identify particular kinds of content in the document, such as examples, titles, references, keywords, figure names, and case studies.

To take this {a few|multiple|several|many|numerous} steps further, this can also be used to leverage the structure of the document, defined by the styles it uses, to re-purpose the document for another output, such as HTML. This is in fact how the Aspose documentation is built, putting Aspose.Words to the test. A tool built using Aspose.Words takes the source Word documents and splits them into topics at certain heading levels. An XML file is produced using Aspose.Words which is used to build the navigation tree you can see on the left. And then Aspose.Words converts each topic into HTML. The solution for retrieving text formatted with specific styles in a Word document is typically economical and straightforward using Aspose.Words.

To illustrate how easily Aspose.Words handles retrieving content based on styles, let’s look at an example. In this example, we’re going to retrieve text formatted with a specific paragraph style and a character style from a sample Word document.

At a high level, this will involve:

1. Opening a Word document using the [Document](https://apireference.aspose.com/words/java/com.aspose.words/Document) class.
1. Getting collections of all paragraphs and all runs in the document.
1. Selecting only the required paragraphs and runs.

Specifically, we’ll retrieve text formatted with the ‘Heading 1’ paragraph style and the ‘Intense Emphasis’ character style from this sample Word document. 

![working-with-styles-aspose-words-java-1](working-with-styles_1.png)

In this sample document, the text formatted with the ‘Heading 1’ paragraph style is ‘Insert Tab’, ‘Quick Styles’ and ‘Theme’, and the text formatted with the ‘Intense emphasis’ character style is the {several|multiple|a few|many|numerous} instances of blue, italicized, bold text such as ‘galleries’ and ‘overall look’.

The implementation of a style-based query is quite simple in the Aspose.Words document object model, as it simply uses tools that are already in place. Two class methods are implemented for this solution:

1. **ParagraphsByStyleName** – This method retrieves an array of those paragraphs in the document that have a specific style name.
1. **RunsByStyleName** – This method retrieves an array of those runs in the document that have a specific style name.

Both these methods are very similar, the only differences being the node types and the representation of the style information within the paragraph and run nodes. Here is an implementation of ParagraphsByStyleName shown in the code example given below to find all paragraphs formatted with the specified style.

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-styles-ExtractContentBasedOnStyles-ParagraphsByStyleName.java" >}}

This implementation also uses the [Document.getChildNodes()](https://apireference.aspose.com/words/java/com.aspose.words/document#ChildNodes) method of the Document class, which returns a collection of all immediate child nodes.

It’s also worth pointing out that the paragraphs collection does not create an immediate overhead because paragraphs are loaded into this collection only when you access items in them.Then, all you need to do is to go through the collection, using the standard foreach operator and add paragraphs that have the specified style to the paragraphsWithStyle array. The Paragraph style name can be found in the [Style.getName()](https://apireference.aspose.com/words/java/com.aspose.words/style#Name) property of the [Paragraph.getParagraphFormat()](https://apireference.aspose.com/words/java/com.aspose.words/style#ParagraphFormat) object.

The implementation of RunsByStyleName is almost the same, although we’re obviously using NodeType.Run to retrieve run nodes. The [Font.getStyle()](https://apireference.aspose.com/words/java/com.aspose.words/font#Style) property of a [Run](https://apireference.aspose.com/words/java/com.aspose.words/Run) object is used to access style information in the **Run** nodes. 

The following code example finds all runs formatted with the specified style.

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-styles-ExtractContentBasedOnStyles-RunsByStyleName.java" >}}

{{% alert color="primary" %}} 

When both queries are implemented, all you need to do is to pass a document object and specify the style names of the content you want to retrieve:

{{% /alert %}} 

The following code example run queries and display results.

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-styles-ExtractContentBasedOnStyles-.java" >}}

When everything is done, running the sample will display the following output:

![working-with-styles-aspose-words-java-2](working-with-styles_2.png)

As you can see, this is a very simple example, showing the number and text of the collected paragraphs and runs in the sample Word document.

## Insert Style Separator to Put Different Paragraph Styles

The style separator can be added to the end of a paragraph using the Ctrl + Alt + Enter Keyboard Shortcut into MS Word. This feature {allows|enables} for two different paragraph styles used in one logical printed paragraph. If you want some text from the beginning of a particular heading to appear in a Table of Contents but do not want the entire heading in the Table of Contents, you can use this feature. 

The following code example {shows|demonstrates} how to insert a style separator to put different paragraph styles. 

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-styles-WorkingWithStyle-ParagraphInsertStyleSeparator.java" >}}

## Copy All Styles from Template

There are cases when you want to copy all styles from one document into another. You can use the Document.CopyStylesFromTemplate method to copy styles from the specified template to a document. When styles are copied from a template to a document, like-named styles in the document are redefined to match the style descriptions in the template. Unique styles from the template are copied to the document. Unique styles in the document remain intact. 

The following code example {shows|demonstrates} how to copy styles from one document into another.

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-programming_documents-styles-WorkingWithStyle-CopyStylesFromDocument.java" >}}

