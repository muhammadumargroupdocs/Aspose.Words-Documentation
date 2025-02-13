﻿---
title: Logical Levels of Nodes in a Document
type: docs
description: "In Aspose.Words for C++ documentation mentioned logical levels of nodes – block level, inline level, or row level. The node level is used to describe the location in the document tree where the node is typically occur."
weight: 10
url: /cpp/logical-levels-of-nodes-in-a-document/
---

This documentation sometimes refers to a group of node classes as belonging to a "level" in a document, such as "block-level", "inline-level" (also known as "inline"), or “row-level” nodes. These levels in a document are differentiated purely logically and are not explicitly expressed by inheritance or other Aspose.Words DOM means. The node level is used to describe the place in the document tree where the node would typically occur.

In the previous article, we already talked about the relationship between nodes and the fact that not all nodes are allowed to be a child of any nodes. For example, Cell can only be a Row child, and a Row can only be a Table child, and so on. These relationships are also applicable for the logical division of nodes into levels in the document.

The following sections describe the logical levels of nodes in Aspose.Words and the classes that belong to each level.

## Document and Section Logical Level

A Word document consists of one or more sections, represented by the [Section](https://apireference.aspose.com/words/cpp/class/aspose.words.section) class and separated by section breaks. A section can define its own page size, margins, orientation, number of text columns, and headers and footers.

[Document](https://apireference.aspose.com/words/cpp/class/aspose.words.document) and [Section](http://www.aspose.com/api/words/cpp/class/aspose.words.section) level nodes have the structure as shown in the following diagram.

<img src="document-and-section-level.png" alt="document-and-section-level-aspose-words-cpp" style="width:700px"/>

A section contains the main text, as well as headers and footers for the first, even, and odd pages. These different “flows” of text are called *stories*.

In Aspose.Words, the **Section** node contains the [Body](https://apireference.aspose.com/words/cpp/class/aspose.words.body) and [HeaderFooter](https://apireference.aspose.com/words/cpp/class/aspose.words.header_footer) story nodes. The **Body** object stores the main text. The **HeaderFooter** objects store the text for each header and footer. The text of any story consists of paragraphs and tables, respectively represented by the **Paragraph** and **Table** objects of the Block-level.

Additionally, each Word document can contain a glossary, which is represented by the [GlossaryDocument](https://apireference.aspose.com/words/cpp/class/aspose.words.building_blocks.glossary_document/) node in Aspose.Words. A glossary document contains [BuildingBlocks](https://apireference.aspose.com/words/cpp/class/aspose.words.building_blocks.glossary_document#get_buildingblocks), [AutoText](https://apireference.aspose.com/words/cpp/namespace/aspose.words.building_blocks#buildingblocktype), and [AutoCorrect](https://apireference.aspose.com/words/cpp/namespace/aspose.words.building_blocks#buildingblocktype) entries.

**GlossaryDocument** includes [BuildingBlock](https://apireference.aspose.com/words/cpp/class/aspose.words.building_blocks.building_block/) nodes representing different types of glossary document entries. Each **BuildingBlock** contains sections that can be inserted, removed, and copied into documents.

## Block Logical Level

Block-level nodes represent containers for content and content controls, and can occur in the document tree child nodes in the following nodes:

- Body
- Header
- Footer
- Footnote
- Comment
- Shape
- GroupShape
- Cell
- StructuredDocumentTag

Block-level nodes are represented by the following classes:

- [Tables](https://apireference.aspose.com/words/cpp/class/aspose.words.tables.table) and [Paragraphs](https://apireference.aspose.com/words/cpp/class/aspose.words.paragraph), which are the most important block-level nodes
- Bookmarks, which occurs both at the block-level and at the inline-level
- [StructuredDocumentTag](https://apireference.aspose.com/words/cpp/class/aspose.words.markup.structured_document_tag/), which represent custom markup and can contain both content and content controls

The following diagram {shows|demonstrates} the block-level elements.

<img src="block-level.png" alt="block-level-aspose-words-cpp" style="width:550px"/>

## Inline Logical Level

Inline-level nodes represent the actual content of the document and can be contained in the following containers:

- Paragraph – the most common container
- [SmartTag](https://apireference.aspose.com/words/cpp/class/aspose.words.markup.smart_tag)
- StructuredDocumentTag

Inline-level elements are represented by the following classes:

- [Run](https://apireference.aspose.com/words/cpp/class/aspose.words.run) – runs of text formatted differently
- [BookmarkStart](https://apireference.aspose.com/words/cpp/class/aspose.words.bookmark_start) and [BookmarkEnd](https://apireference.aspose.com/words/cpp/class/aspose.words.bookmark_end) represent bookmarks
- [CommentRangeStart](https://apireference.aspose.com/words/cpp/class/aspose.words.comment_range_start), [CommentRangeEnd](https://apireference.aspose.com/words/cpp/class/aspose.words.comment_range_end), [Comment](https://apireference.aspose.com/words/cpp/class/aspose.words.comment) and [Footnote](https://apireference.aspose.com/words/cpp/class/aspose.words.notes.footnote/) represent annotations
- [FieldStart](https://apireference.aspose.com/words/cpp/class/aspose.words.fields.field_start), [FieldChar](https://apireference.aspose.com/words/cpp/class/aspose.words.fields.field_char), [FieldSeparator](https://apireference.aspose.com/words/cpp/class/aspose.words.fields.field_separator/) and [FieldEnd](https://apireference.aspose.com/words/cpp/class/aspose.words.fields.field_end) that represent field characters, and [FormField](https://apireference.aspose.com/words/cpp/class/aspose.words.fields.form_field) represent Word fields
- [SpecialChar](https://apireference.aspose.com/words/cpp/class/aspose.words.special_char) represents special characters in the document
- [Shape](https://apireference.aspose.com/words/cpp/class/aspose.words.drawing.shape) and [GroupShape](https://apireference.aspose.com/words/cpp/class/aspose.words.drawing.group_shape) represent shapes, drawings, images, etc.
- SmartTag and StructuredDocumentTag represent custom markup

The following diagram {shows|demonstrates} the inline-level nodes structure.

<img src="inline-level.png" alt="inline-level-aspose-words-cpp" style="width:785px"/>

{{% alert color="primary" %}}

Shapes in Microsoft Word include Office Art AutoShapes, text boxes, images, OLE objects, and ActiveX controls, all of which are represented using the Shape class. Some shapes can also contain text, so Shape nodes in Aspose.Words can contain block-level nodes.

Shapes can be grouped inside each other using GroupShape nodes.

{{% /alert %}}

{{% alert color="primary" %}}

Footnotes and comments can contain text, therefore Footnote and Comment nodes in Aspose.Words can contain block-level nodes.

{{% /alert %}}

## Table, Row, and Cell Node Level

The table consists of nodes of rows and cells. Table elements are represented by the following classes:

- [Row](https://apireference.aspose.com/words/cpp/class/aspose.words.tables.row) represents a table row
- [Cell](https://apireference.aspose.com/words/cpp/class/aspose.words.tables.cell) represents a table cell
- StructuredDocumentTag represent custom markup

The following diagram {shows|demonstrates} the node structures of the Table, Row, and Cell levels.

<img src="table-row-cell.png" alt="table-row-cell-aspose-words-cpp" style="width:910px"/>
