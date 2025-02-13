﻿---
title: Repeat Table Header Rows on Pages
description: "Aspose.Words for Java {allows|enables} to repeat a header row of a table on every page. Docx4j does not provide an opportunity to work with a header row."
type: docs
weight: 10
url: /java/repeat-table-header-rows-on-pages/
---

{{% alert color="primary" %}}

See more details in the [“Working with Columns and Rows”](https://docs.aspose.com/words/java/working-with-columns-and-rows/) article of the [“Working with Tables”](https://docs.aspose.com/words/java/working-with-tables/) documentation section.

{{% /alert %}}

A table can specify certain starting table rows to be used as header rows. This means that if the table spans over {many|multiple|several|a few|numerous} pages, these rows will be repeated at the top of the table for each page. In Aspose.Words, you can apply this setting by using the [HeadingFormat](https://apireference.aspose.com/words/java/com.aspose.words/rowformat#HeadingFormat) property.

The following code example {shows|demonstrates} how to build a table with rows that repeat on every page:

{{< highlight csharp >}}
Document doc = new Document();
DocumentBuilder builder = new DocumentBuilder(doc);
Table table = builder.startTable();
builder.getRowFormat().setHeadingFormat(true);
builder.getParagraphFormat().setAlignment(ParagraphAlignment.CENTER);
builder.getCellFormat().setWidth(100);
builder.insertCell();
builder.writeln("Heading row 1");
builder.endRow();
builder.insertCell();
builder.writeln("Heading row 2");
builder.endRow();
builder.getCellFormat().setWidth(50);
builder.getParagraphFormat().clearFormatting();

// Insert some content so the table is long enough to continue onto the next page.
for (int i = 0; i < 50; i++)
{
    builder.insertCell();
    builder.getRowFormat().setHeadingFormat(false);
    builder.write("Column 1 Text");
    builder.insertCell();
    builder.write("Column 2 Text");
    builder.endRow();
}
doc.save(dataDir + "RepearHeaderRows.doc");
{{< /highlight >}}

See also:

- [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/releases/tag/Aspose.Words_Java_for_Docx4j-v1.0.0) for running code

- [GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/tree/master/Plugins/Aspose.Words-for-Java_for_Docx4j/src/main/java/com/aspose/words/examples/asposefeatures/tables/repeatheaderrow/AsposeRepeatHeaderRow.java) for code example
