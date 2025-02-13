﻿---
title: Aspose.Words for .NET 5.0.0 Release Notes
type: docs
weight: 90
url: /net/aspose-words-for-net-5-0-0-release-notes/
---

{{% alert color="primary" %}} 

This page contains release notes for [Aspose.Words for .NET 5.0.0](http://www.aspose.com/downloads/words/net/new-releases/aspose.words-for-.net-5.0.0/)

{{% /alert %}} 

Please welcome our next major release of Aspose.Words for .NET!

The main feature in Aspose.Words for .NET 5.0.0 is load and save of Office Open XML documents reaching its Release status.



Because we've done a lot. Here is a list of features that we have gradually added since Aspose.Words for .NET 4.0.0 released back in October 2006:

- Load and save Office Open XML documents.
  Load and save RTF documents. 
  Load and save Microsoft Word 2003 WordprocessingML documents. 
  Save in OpenDocument (ODT) format (Beta). 
  64-bit and Windows Vista support. 
  Numerous improvements and fixes in all areas. 



Have a look at the updated enum, it includes the following new formats:

- SaveFormat.Docx - Saves the document as a Microsoft Office 2007 Open XML Document (macro-free).
  SaveFormat.Docm - Saves the document as a Microsoft Office 2007 Open XML Macro-Enabled Document. 
  SaveFormat.Dotx - Saves the document as a Microsoft Office 2007 Open XML Template (macro-free). 
  SaveFormat.Dotm - Saves the document as a Microsoft Office 2007 Open XML Macro-Enabled Template. 
  SaveFormat.Odt - BETA! Saves the document in the OpenDocument format. 

Note that the Office Open XML specification and Microsoft Word 2007 strictly distinguish between macro-enabled and macro-free documents. If you save a document with macros as DOCX, Microsoft Word 2007 will reject to open it (unfortunately with a misleading error message). Therefore, you need to make sure you are saving an Office Open XML document in the correct (macro-free or macro-enabled) format. By default, Aspose.Words fully preserves VBA projects in Office Open XML documents, but you can remove all macros from a document using the  method.

Great news, we have included a beta version of saving to Open Document (ODT) format. You are welcome to try it out, but beware not all document features are yet exported.



We are fully committed to making Aspose.Words support the Office Open XML specification 100% in the shortest timeframe possible and we are well on track to achieving this.

Since the previous beta release we have added support for the following features:

- Smart Tags
  OLE embedded and linked objects 
  VBA projects 
  Digital signatures for VBA projects 
  Many others 

Although the degree of Aspose.Words conformance to OOXML is high, not all OOXML features are yet supported. A detailed conformance specification is provided in a . For example ActiveX controls, Structured Document Tags (Content Controls) and Custom XML are not yet supported. These will be supported in the following months.



By having a major version change we indicate there are some breaking changes in the API.

The changes are not likely to affect a few users. Even if you cannot recompile your project because of a change, it is very easy to update your code because all changes are cosmetic, although they had to be done.

The breaking changes in Aspose.Words for .NET 5.0.0 are:

Collection classes were renamed to become more inline with the .NET Framework Design guidelines and to allow creation of the new namespaces (for example, to avoid confusion between the old class and new namespace).

New namespaces were created because the namespace grew too big and we have a lot of new public classes to add in the future, therefore some reorganization was necessary. We hope you will find new namespaces easy to use. For example, namespace contains all classes and enums required to work with bulleted and numbered lists in a document.



|Issue ID |Component |Summary |
| :- | :- | :- |
|4309 |DOC |“The document contains captions” exception occurs during opening document. |
|4239 |DOC |Cannot insert PNG image, error Unable to read beyond the end of the stream. |
|558 |DOC |RTL table becomes too wide. |
|4372 |DOCX |“Aspose.Words.FileCorruptedException” exception occurs during opening DOCX document. |
|4368 |DOCX |DOCX generated by Apsose.Words is corrupted to open with Word 2007. |
|4348 |DOCX |“'Unknown color type encountered during WordML import” exception occus during opening DOCX. |
|4347 |DOCX |“FileCorruptedException” exception occurs during opening DOCX file. |
|4294 |DOCX |MS Words 2007 doesn't open DOCX file. |
|4220 |DOCX |Background shape is lost during load/save. |
|4218 |DOCX |Freeform shape is processed incorrectly during load/save. |
|4127 |DOCX |DOCX document is empty after opening it using Aspose.Words. |
|4035 |DOCX |Font size changes from 11pt to 10pt during OpenSaveOpen |
|3927 |DOCX |Images are lost when importing DOCX |
|3616 |DOCX |DOCX files generated by Aspose.Words for VS2003 project are different from VS2005 |
|3613 |DOCX |Support proper protection password export in DOCX. |
|3609 |DOCX |Demo2007\ManualComms Out.docx demonstrates numbering revisions while it should not |
|3586 |DOCX |Macros and digital sugnatures are not saved during DOCX export. |
|3476 |DOCX |UnifiedTestIncludePictureNoSeparator fails |
|4386 |Model |Add Name property to Shape class. |
|1280 |Model |As Icon, Icon Label, Icon Path and Icon Index are not supported for OLE objects |
|341 |Model |Add Smart Tags/Smart Document support |
|4388 |PDF |Exception: Cannot get field part because at end of field code (PDF, HTML) |
|4381 |PDF |Empty form field should be output wider to look like in MS Word |
|4328 |PDF |Symbol field result outputs twice if field has a separator (PDF, HTML) |
|4318 |PDF |MACROBUTTON field is output incorrectly if display text occupies numerous runs (PDF, HTML) |
|4278 |RTF |Support document protection password |
|4252 |RTF |Position of the floating TextBoxes is changed after open/save. |
|4107 |RTF |Style is changed after open/save RTF document. |
|4106 |RTF |Line spacing is changed after open/save RTF document. |
|4067 |RTF |Paragraph indents are incorrect |
|4058 |RTF |Last paragraph is lost after opening RTF using Aspose.Words. |
|4284 |WML |Enumeration of multilevel list is exported from WML to DOC not properly |
|3375 |WML |TestGoldWmlShape.TestImagePict fails |
|3374 |WML |TestGoldWmlOle.TestOleLinked import fails |
|3373 |WML |TestGoldWmlList.TestListNasty1 import fails |
|3372 |WML |TestGoldWmlDocProperties.TestRevMarks import fails |
|3371 |WML |TestGoldWmlDemo2007.ManualAdmin import fails |
||||
1568 | WML | UnifiedTestListStyle fails. |


