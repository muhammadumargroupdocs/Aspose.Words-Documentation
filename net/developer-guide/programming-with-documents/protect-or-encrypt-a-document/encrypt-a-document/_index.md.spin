﻿---
title: Encrypt a Document
description: "Aspose.Words for .NET {allows|enables} you to encrypt your document using appropriate encryption algorithms for specific document formats."
type: docs
weight: 20
url: /net/encrypt-a-document/
---

Encryption is the process that translates readable text to meaningless sequences of bytes so it can only be read by the person who has the decryption key or the secret code. This process plays an important role in securing your content. It helps to encode the content, verify the origin of a document, prove that the content has not been modified after it was sent, and ensure that the data from the document is safe.

This article explains how Aspose.Words {allows|enables} you to encrypt a document and how to check if a document has encryption or not.

## Encrypt with Password

To encrypt a document, use the **Password** property to provide a password that functions as an encryption key. This will modify the content of your document and make it unreadable. The encrypted document will require to have this password entered before it can be opened.

{{% alert color="primary" %}}

You can find the appropriate **Password** property for the required format. Each document save format in the [Saving Namespace](https://apireference.aspose.com/words/net/aspose.words.saving) has a corresponding class containing save options for this format. For example, the [Password](https://apireference.aspose.com/words/net/aspose.words.saving/docsaveoptions/properties/password) property in the [DocSaveOptions](https://apireference.aspose.com/words/net/aspose.words.saving/docsaveoptions) class for DOC, or the [Password](https://apireference.aspose.com/words/net/aspose.words.saving/ooxmlsaveoptions/properties/password) property in the [OoxmlSaveOptions](https://apireference.aspose.com/words/net/aspose.words.saving/ooxmlsaveoptions) class for DOCX, DOCM, DOTX, DOTM, and FlatOpc.

{{% /alert %}}

{{% alert color="primary" %}}

Note that only certain document formats support encryption. For example, RTF does not support encryption.

{{% /alert %}}

The table below lists the formats and encryption algorithms supported by Aspose.Words:

| Format                                                       | Supported Encryption while Loading                          | Supported Encryption while Saving            |
| ------------------------------------------------------------ | ----------------------------------------------------------- | -------------------------------------------- |
| DOC, DOT                                                     | XOR encryption40-bit RC4 EncryptionCryptoAPI RC4 Encryption | RC4 Encryption (40-bit)                      |
| DOCX, DOTX, DOCM, DOTM, FlatOPC, FlatOpcTemplate, FlatOpcMacroEnabled, FlatOpcTemplateMacroEnabled | ECMA-376 Standard EncryptionECMA-376 Agile Encryption       | ECMA-376 Standard Encryption (AES128 + SHA1) |
| ODT, OTT                                                     | ODF Encryption (Blowfish/AES)                               | ODF Encryption (AES256 + SHA256)             |
| PDF                                                          | -                                                           | RC4 Encryption (40/128 bit)                  |

The following code example {shows|demonstrates} how to encrypt a document with a password:

{{< highlight csharp >}}
// Create a document.
Document doc = new Document();
DocumentBuilder builder = new DocumentBuilder(doc);
builder.Write("Hello world!");

// DocSaveOptions only applies to Doc and Dot save formats.
DocSaveOptions options = new DocSaveOptions(SaveFormat.Doc);

// Set a password with which the document will be encrypted, and which will be required to open it.
options.Password = "MyPassword";
doc.Save(ArtifactsDir + "DocSaveOptions.SaveAsDoc.doc", options);
{{< /highlight >}}

## Check If a Document Is Encrypted

In some cases, you may have an unreadable document and want to be sure that the document is encrypted and not corrupted or compressed.

To detect if a document is encrypted and if a password is required, you can use the [IsEncrypted](https://apireference.aspose.com/words/net/aspose.words/fileformatinfo/properties/isencrypted) property of the [FileFormatInfo](https://apireference.aspose.com/words/net/aspose.words/fileformatinfo) class. This property will also allow you to perform some action before loading a document, for example, informing a user to provide a password.

The following code example {shows|demonstrates} how to detect the document encryption:

{{< highlight csharp >}}
// Create a document.
Document doc = new Document();
OdtSaveOptions saveOptions = new OdtSaveOptions(SaveFormat.Odt);
saveOptions.Password = "MyPassword";

doc.Save(ArtifactsDir + "File.DetectDocumentEncryption.odt", saveOptions);
            
// Create a FileFormatInfo object for this document.
FileFormatInfo info = FileFormatUtil.DetectFileFormat(ArtifactsDir + "File.DetectDocumentEncryption.odt");

// Verify the encryption status of our document.
Assert.True(info.IsEncrypted);
{{< /highlight >}}

## Open a Document With or Without a Password

When we have made sure that a document is encrypted, we can try to open this document without a password, which should lead to an exception.

The following code example {shows|demonstrates} how to try opening an encrypted document without a password:

{{< highlight csharp >}}
// Create a document.
Document doc = new Document();
DocumentBuilder builder = new DocumentBuilder(doc);
builder.Write("Hello world!");

//OoxmlSaveOptions only applies to Docx, Docm, Dotx, Dotm, or FlatOpc formats.
OoxmlSaveOptions options = new OoxmlSaveOptions(SaveFormat.Docx);

// Set a password with which the document will be encrypted, and which will be required to open it.
options.Password = "MyPassword";
doc.Save(ArtifactsDir + "OoxmlSaveOptions.SaveAsDocx.docx", options);

// We will not be able to open this document with Microsoft Word or
// Aspose.Words without providing the correct password.
Assert.Throws<IncorrectPasswordException>(() =>
	doc = new Document(ArtifactsDir + "OoxmlSaveOptions.Password.docx"));
{{< /highlight >}}

After we have seen that an encrypted document cannot be opened without a password, we can try to open it by entering the password.

The following code example {shows|demonstrates} how to try opening an encrypted document with a password:

{{< highlight csharp >}}
// Create a document.
Document doc = new Document();
DocumentBuilder builder = new DocumentBuilder(doc);
builder.Write("Hello world!");

//OoxmlSaveOptions only applies to Docx, Docm, Dotx, Dotm, or FlatOpc formats.
OoxmlSaveOptions options = new OoxmlSaveOptions(SaveFormat.Docx);

// Set a password with which the document will be encrypted, and which will be required to open it.
options.Password = "MyPassword";
doc.Save(ArtifactsDir + "OoxmlSaveOptions.SaveAsDocx.docx", options);

// Open the encrypted document by passing the correct password in a LoadOptions object.
doc = new Document(ArtifactsDir + "OoxmlSaveOptions.Password.docx", new LoadOptions("MyPassword"));

Assert.AreEqual("Hello world!", doc.GetText().Trim());
{{< /highlight >}}
