﻿---
title: How to Extract Selected Content Between Nodes in a Document
type: docs
weight: 40
url: /net/how-to-extract-selected-content-between-nodes-in-a-document/
---

## Extract Content Overview and Code

A common requirement when working with documents is to easily extract specific content from a range within the document. This content can consist of complex features such as paragraphs, tables, images etc. Regardless of what content needs to extracted, the method in which to extract this content will always be determined by which nodes are chosen to extract content between. These could be entire bodies of text or simple runs of text. There are {many|multiple|several|a few|numerous} possible situations and therefore {many|multiple|several|a few|numerous} different node types to consider when extracting content. For instance, you may want to extract content between:

- Two specific paragraphs in the document.
- Specific runs of text.
- Different types of fields, for example merge fields.
- Between the start and end ranges of a bookmark or comment.
- Different bodies of text contained in separate sections.

In some situations you may even want to combine the different types of, for example, extract content between a paragraph and field, or between a run and a bookmark.

Often the goal of extracting this content is to duplicate or save it separately into a new document. For example, you may wish to extract content and:

- Copy it to a separate document.
- Rendered a specific portion of a document to PDF or an image.
- Duplicate the content in the document {many|multiple|several|a few|numerous} times.
- Work with this content separate from the rest of the document.

This is easy to achieve using Aspose.Words and the code implementation below. This article provides the full code implementation to achieve this along with samples of common scenarios using this method. These samples are just {a few|multiple|several|many|numerous} demonstrations of the {many|multiple|several|a few|numerous} possibilities that this method can be used for. Some day this functionality will be a part of the public API and the extra code here will not be required. Feel free to post your requests regarding this functionality on the [Aspose.Words forum here](https://forum.aspose.com/c/words).

### The Solution

The code in this section addresses all of the possible situations above with one generalized and reusable method. The general outline of this technique involves:

1. Gathering the nodes which dictate the area of content that will be extracted from your document. Retrieving these nodes is handled by the user in their code, based on what they want to be extracted.
1. Passing these nodes to the **ExtractContent** method which is provided below. You must also pass a boolean parameter which states if these nodes that act as markers should be included in the extraction or not.
1. The method will return a list of cloned (copied nodes) of the content specified to be extracted. You can now use this in any way applicable, for example, creating a new document containing only the selected content.

### The Code

To extract the content from your document you need to call the ExtractContent method below and pass the appropriate parameters. The underlying basis of this method involves finding block level nodes (paragraphs and tables) and cloning them to create identical copies. If the marker nodes passed are block level then the method is able to simply copy the content on that level and add it to the array.

However if the marker nodes are inline (a child of a paragraph) then the situation becomes more complex, as it is necessary to split the paragraph at the inline node, be it a run, bookmark fields etc. Content in the cloned parent nodes not present between the markers is removed. This process is used to ensure that the inline nodes will still retain the formatting of the parent paragraph. The method will also run checks on the nodes passed as parameters and throws an exception if either node is invalid. The parameters to be passed to this method are:

1. **StartNode** and **EndNode**: The first two parameters are the nodes which define where the extraction of the content is to begin and to end at respectively. These nodes can be both block level ( [Paragraph](http://www.aspose.com/api/net/words/aspose.words/paragraph) , [Table](http://www.aspose.com/api/net/words/aspose.words.tables/table) ) or inline level (e.g [Run](http://www.aspose.com/api/net/words/aspose.words/run) , [FieldStart](http://www.aspose.com/api/net/words/aspose.words.fields/fieldstart) , [BookmarkStart](http://www.aspose.com/api/net/words/aspose.words/bookmark/properties/bookmarkstart) etc.).
   1. To pass a field you should pass the corresponding **FieldStart** object.
   1. To pass bookmarks, the **BookmarkStart** and [BookmarkEnd](http://www.aspose.com/api/net/words/aspose.words/bookmark/properties/bookmarkend) nodes should be passed.
   1. To pass comments, the [CommentRangeStart](http://www.aspose.com/api/net/words/aspose.words/commentrangestart) and [CommentRangeEnd](http://www.aspose.com/api/net/words/aspose.words/commentrangeend) nodes should be used.
1. **IsInclusive**:

Defines if the markers are included in the extraction or not. If this option is set to false and the same node or consecutive nodes are passed, then an empty list will be returned.

1. If a **FieldStart** node is passed then this option defines if the whole field is to be included or excluded.
1. If a **BookmarkStart** or **BookmarkEnd** node is passed, this option defines if the bookmark is included or just the content between the bookmark range.
1. If a **CommentRangeStart** or **CommentRangeEnd** node is passed, this option defines if the comment itself is to be included or just the content in the comment range.

The implementation of the **ExtractContent** method is found below . This method will be referred to in the scenarios in this article. Below method which extracts blocks of content from a document between specified nodes.

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-Common-CommonExtractContent.cs" >}}

We will also define a custom method to easily generate a document from extracted nodes. This method is used in {many|multiple|several|a few|numerous} of the scenarios below and simply creates a new document and imports the extracted content into it. Below method takes a list of nodes and inserts them into a new document.

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-Common-CommonGenerateDocument.cs" >}}

These helper methods below are internally called by the main extraction method. They are required, however as they are not directly called by the user, it is not necessary to discuss them further. Below helper methods used by the ExtractContent method.

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-Common-CommonExtractContentHelperMethods.cs" >}}

## Extract Content Between Paragraphs

This {demonstrates|shows} how to use the method above to extract content between specific paragraphs. In this case, we want to extract the body of the letter found in the first half of the document. We can tell that this is between the 7 th and 11 th paragraph. The code below accomplishes this task. The appropriate paragraphs are extracted using the [CompositeNode.GetChild](http://www.aspose.com/api/net/words/aspose.words/compositenode) method on the document and passing the specified indices. We then pass these nodes to the **ExtractContent** method and state that these are to be included in the extraction. This method will return the copied content between these nodes which are then inserted into a new document. Below example {shows|demonstrates} how to extract the content between specific paragraphs using the ExtractContent method above. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenParagraphs-ExtractContentBetweenParagraphs.cs" >}}

## Extract Content Between Different Types of Nodes

We can extract content between any combinations of block level or inline nodes. In this scenario below we will extract the content between first paragraph and the table in the second section inclusively. We get the markers nodes by calling [Body.FirstParagraph](http://www.aspose.com/api/net/words/aspose.words/story/properties/firstparagraph) and [CompositeNode.GetChild](http://www.aspose.com/api/net/words/aspose.words/compositenode/methods/getchild) method on the second section of the document to retrieve the appropriate Paragraph and Table nodes. For a slight variation let’s instead duplicate the content and insert it below the original. Below example {shows|demonstrates} how to extract the content between a paragraph and table using the ExtractContent method. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenBlockLevelNodes-ExtractContentBetweenBlockLevelNodes.cs" >}}

## Extract Content Between Paragraphs Based on Style

You may need to extract the content between paragraphs of the same or different style, such as between paragraphs marked with heading styles. The code below {shows|demonstrates} how to achieve this. It is a simple example which will extract the content between the first instance of the “Heading 1” and “Header 3” styles without extracting the headings as well. To do this we set the last parameter to false, which specifies that the marker nodes should not be included.

In a proper implementation this should be run in a loop to extract content between all paragraphs of these styles from the document. The extracted content is copied into a new document. Below example {shows|demonstrates} how to extract content between paragraphs with specific styles using the ExtractContent method. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenParagraphStyles-ExtractContentBetweenParagraphStyles.cs" >}}

## Extract Content Between Specific Runs

You can extract content between inline nodes such as a Run as well. Runs from different paragraphs can be passed as markers. The code below {shows|demonstrates} how to extract specific text in-between the same **Paragraph** node. Below example {shows|demonstrates} how to extract content between specific runs of the same paragraph using the ExtractContent method. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenRuns-ExtractContentBetweenRuns.cs" >}}

## Extract Content using a Field

To use a field as marker, the FieldStart node should be passed. The last parameter to the ExtractContent method will define if the entire field is to be included or not. Let’s extract the content between the “FullName” merge field and a paragraph in the document. We use the [DocumentBuilder.MoveToMergeField](http://www.aspose.com/api/net/words/aspose.words/documentbuilder/methods/movetomergefield) method of [DocumentBuilder](http://www.aspose.com/api/net/words/aspose.words/documentbuilder) class. This will return the **FieldStart** node from the name of merge field passed to it. We will then

In our case let’s set the last parameter passed to the **ExtractContent** method to false to exclude the field from the extraction. We will render the extracted content to PDF. Below example {shows|demonstrates} how to extract content between a specific field and paragraph in the document using the ExtractContent method. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentUsingField-ExtractContentUsingField.cs" >}}

## Extract Content from a Bookmark

In a document the content that is defined within a bookmark is encapsulated by the BookmarkStart and BookmarkEnd nodes. Content found between these two nodes make up the bookmark. You can pass either of these nodes as any marker, even ones from different bookmarks, as long as the starting marker appears before the ending marker in the document. We will extract this content into a new document using the code below. The **IsInclusive** parameter option {shows|demonstrates} how to retain or discard the bookmark. Below example {shows|demonstrates} how to extract the content referenced a bookmark using the ExtractContent method. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenBookmark-ExtractContentBetweenBookmark.cs" >}}

## Extract Content from a Comment

A comment is made up of the CommentRangeStart, CommentRangeEnd and Comment nodes. All of these nodes are inline. The first two nodes encapsulate the content in the document which is referenced by the comment, as seen in the screenshot below. The **Comment** node itself is an [InlineStory](http://www.aspose.com/api/net/words/aspose.words/InlineStory) that can contain paragraphs and runs. It represents the message of the comment as seen as a comment bubble in the review pane. As this node is inline and a descendant of a body you can also extract the content from inside this message as well.

The comment encapsulates the heading, first paragraph and the table in the second section. Let’s extract this comment into a new document. The **IsInclusive** option dictates if the comment itself is kept or discarded. The code to do this is below. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Extract%20content.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentBetweenCommentRange-ExtractContentBetweenCommentRange.cs" >}}

## How to Extract Content using DocumentVisitor

Use the [DocumentVisitor](http://www.aspose.com/api/net/words/aspose.words/documentvisitor) class to implement this usage scenario. This class corresponds to the well-known Visitor design pattern. With **DocumentVisitor** **,** you can define and execute custom operations that require enumeration over the document tree.

**DocumentVisitor** provides a set of **VisitXXX** methods that are invoked when a particular document element (node) is encountered. For example, [DocumentVisitor.VisitParagraphStart](http://www.aspose.com/api/net/words/aspose.words/documentvisitor/methods/visitparagraphstart) is called when the beginning of a text paragraph is found and [DocumentVisitor.VisitParagraphEnd](http://www.aspose.com/api/net/words/aspose.words/documentvisitor/methods/visitparagraphend) is called when the end of a text paragraph is found. Each **DocumentVisitor.VisitXXX** method accepts the corresponding object that it encounters so you can use it as needed (say retrieve the formatting), e.g. both **DocumentVisitor.VisitParagraphStart** and **DocumentVisitor.VisitParagraphEnd** accept a [Paragraph](http://www.aspose.com/api/net/words/aspose.words/paragraph) object.

Each **DocumentVisitor.VisitXXX** method returns a [VisitorAction](http://www.aspose.com/api/net/words/aspose.words/visitoraction) value that controls the enumeration of nodes. You can request either to continue the enumeration, skip the current node (but continue the enumeration), or stop the enumeration of nodes.

These are the steps you should follow to programmatically determine and extract various parts of a document:

- Create a class derived from **DocumentVisitor** .
- Override and provide implementations for some or all of the **DocumentVisitor.VisitXXX** methods to perform some custom operations.
- Call [Node.Accept](http://www.aspose.com/api/net/words/aspose.words/node/methods/accept) on the node from where you want to start the enumeration. For example, if you want to enumerate the whole document, use [Document.Accept](http://www.aspose.com/api/net/words/aspose.words/document/methods/accept) .

**DocumentVisitor** provides default implementations for all of the **DocumentVisitor.VisitXXX** methods. This makes it easier to create new document visitors as only the methods required for the particular visitor need to be overridden. It is not necessary to override all of the visitor methods.

This example {shows|demonstrates} how to use the Visitor pattern to add new operations to the Aspose.Words object model. In this case, we create a simple document converter into a text format. You can download template file of this example from [here](https://github.com/aspose-words/Aspose.Words-for-.NET/blob/master/Examples/Data/Absolute%20position%20tab.docx).

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentUsingDocumentVisitor-ExtractContentUsingDocumentVisitor.cs" >}}

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractContentUsingDocumentVisitor-MyDocToTxtWriter.cs" >}}

## How to Extract Text Only

The ways to retrieve text from the document are:

- Use [Document.Save](http://www.aspose.com/api/net/words/aspose.words.document/save/methods/3) with [SaveFormat.Text](http://www.aspose.com/api/net/words/aspose.words/saveformat) to save as plain text into a file or stream.
- Use [Node.ToString](http://www.aspose.com/api/net/words/aspose.words/node/methods/tostring) and pass the SaveFormat.Text parameter. Internally, this invokes save as text into a memory stream and returns the resulting string.
- Use [Node.GetText](http://www.aspose.com/api/net/words/aspose.words/node/methods/gettext) to retrieve text with all Microsoft Word control characters including field codes.
- Implement a custom [DocumentVisitor](http://www.aspose.com/api/net/words/aspose.words/documentvisitor) to perform customized extraction.

### Using Node.GetText and Node.ToString

A Word document can contains control characters that designate special elements such as field, end of cell, end of section etc. The full list of possible Word control characters is defined in the ControlChar class. The Node.GetText method returns text with all of the control character characters present in the node. Calling ToString returns the plain text representation of the document only without control characters. For further information on exporting as plain text see **Using SaveFormat.Text**. Below example {shows|demonstrates} the difference between calling the GetText and ToString methods on a node.

{{< gist "aspose-words" "9a306a41bb6aea8adfcabf5a575c5718" "Examples-CSharp-Programming-Documents-Document-ExtractTextOnly-ExtractTextOnly.cs" >}}
