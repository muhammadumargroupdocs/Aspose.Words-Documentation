﻿---
title: Working with Hyphenation
description: "Aspose.Words for Java allows to use hyphenation for a more compact arrangement of text. It provides advanced algorithms to work with hyphenation dictionaries, uses OpenOffice dictionaries."
type: docs
weight: 85
url: /java/working-with-hyphenation/
---

Sometimes it is necessary to use hyphenation for a more compact arrangement of text in a document. At the same time, it is important to understand that the specifics of word hyphenation may differ for each language.

At the present time, hyphenation is not used as often as it used to be, especially in English texts. Nevertheless, the use of this feature can have a serious impact on user documents – hyphenation affects the layout and, as a result, the appearance of the output files, for example, in PDF format.

For correct splitting of words, language-specific hyphenation dictionaries are used. Aspose.Words uses advanced algorithms to work with such dictionaries and enables you to get the same hyphenation as in Microsoft Word.

## Hyphenation Dictionaries

Since different languages use different norms and rules for word hyphenation, the optimal solution for correct hyphenation is to use special dictionaries. Aspose.Words uses OpenOffice dictionaries.

For spell checking, OpenOffice uses the [Hunspell library](http://hunspell.github.io/), which is a generalization of TeX’s hyphenation algorithm. This algorithm allows for automatic non-standard hyphenation using competing standard and custom hyphenation patterns. Hunspell uses the [Hyphen](https://github.com/hunspell/hyphen) for hyphenation.

{{% alert color="primary" %}}

Hyphenation dictionaries can be taken from the [LibreOffice dictionaries GitHub](https://github.com/LibreOffice/dictionaries). For example, [en-US hyphenation dictionary](https://github.com/LibreOffice/dictionaries/blob/master/en/hyph_en_US.dic).

{{% /alert %}}

{{% alert color="primary" %}}

As Microsoft Word uses dictionaries other than OpenOffice dictionaries to perform hyphenation, the hyphenation of some words defined by OpenOffice dictionaries may differ from the Microsoft Word hyphenation. For this reason, sometimes we have to advise customers to add the necessary patterns to their dictionaries in order to fix the hyphenation of particular words.

{{% /alert %}}

## Hyphenation Algorithm

Aspose.Words implements [the TeX hyphenation algorithm](https://github.com/hunspell/hyphen/blob/master/README.hyphen) and can reuse OpenOffice hyphenation dictionaries.

The following features of Aspose.Words algorithms should be taken into account:

* Hyphenation distance parameters (LEFTHYPHENMIN, RIGHTHYPHENMIN, COMPOUNDLEFTHYPHENMIN, COMPOUNDRIGHTHYPHENMIN) specified in the hyphenation dictionary are ignored. Aspose.Words uses its own set of distance parameters depending on the document compatibility mode.
* The hyphenation algorithm in Aspose.Words supports [composite hyphenation](https://github.com/hunspell/hyphen/blob/master/README.compound). However, Aspose.Words splits character sequences containing mixed alphabetic and non-alphabetic characters into alphabetic-only parts (words) and hyphenates them separately.
  Note that Microsoft Word logic of hyphenation of compound words depends on document compatibility mode.
* The hyphenation algorithm in Aspose.Words does not implement the [non-standard hyphenation](https://github.com/hunspell/hyphen/blob/master/doc/tb87nemeth.pdf). Non-standard patterns are ignored.

## Loading Hyphenation Dictionaries

To use the hyphenation feature, first register a hyphenation dictionary.The following code example shows how to load hyphenation dictionaries for the specified languages from a file:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-rendering_printing-HyphenateWords-LoadHyphenationDictionaryFromFile.java" >}}

{{% alert color="primary" %}}

You can download the template file of this example from [Aspose.Words GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/blob/master/Examples/src/main/resources/RenderingAndPrinting/Rendering.doc).

{{% /alert %}}

The following code example demonstrates how to load hyphenation dictionaries for the specified language from a stream:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-rendering_printing-HyphenateWords-LoadHyphenationDictionaryFromStream.java" >}}

{{% alert color="primary" %}}

You can download the template file of this example from [Aspose.Words GitHub](https://github.com/aspose-words/Aspose.Words-for-Java/blob/master/Examples/src/main/resources/RenderingAndPrinting/Rendering.doc).

{{% /alert %}}

As an alternative to pre-registering hyphenation dictionaries, it is possible to register only required hyphenation dictionaries “by request”. To achieve that, implement the [IHyphenationCallback](https://apireference.aspose.com/words/java/com.aspose.words/IHyphenationCallback) interface and use the static callback [Callback](https://apireference.aspose.com/words/java/com.aspose.words/hyphenation#Callback).

The following code example demonstrates how to implement the **IHyphenationCallback** interface:

{{< gist "aspose-words-gists" "827e71ccc0b8516a3cfe247b86ce6d4e" "Examples-src-main-java-com-aspose-words-examples-rendering_printing-HyphenateWords-HyphenationCallback.java" >}}

## Impact of Hyphenation on Layout

When breaking text into lines, Aspose.Words checks each word whether it fits entirely into the current line. If another word is too long to fit at the end of the line, by default Aspose.Words moves it to the beginning of the next line instead of hyphenating it.

However, the hyphenation feature can be used in Aspose.Words to insert hyphens into words to eliminate gaps in justified text or to maintain an even line length in narrow columns. This can obviously affect the number of lines and therefore the number of pages. In other words, using the hyphenation function affects the document layout.

## Hyphenation and Justification (H&J)

Microsoft Word has complex logic for choosing a breakpoint if text is justified and hyphenation is enabled. In short, Microsoft Word may prefer to shrink or stretch spaces to avoid line hyphenation. Most probably this logic is based on [Knuth's article](http://www.eprg.org/G53DOC/pdfs/knuth-plass-breaking.pdf).

Aspose.Words implements its own H&J algorithm that gives the same result as Microsoft Word and provides identical line breaking in the output document.

## See Also

* [Hyphen – hyphenation library](https://github.com/hunspell/hyphen/blob/master/README)
* [Non-standard hyphenation](https://github.com/hunspell/hyphen/blob/master/README.nonstandard)
* [Automatic non-standard hyphenation in Open Office](https://github.com/hunspell/hyphen/blob/master/doc/tb87nemeth.pdf)
