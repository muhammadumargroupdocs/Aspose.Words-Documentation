﻿---
title: Work with Office Add-ins
description: "Aspose.Words for .NET provides various classes for working with Office Add-ins. You can add Task Pane via web extension and customize the pane and extension properties."
type: docs
weight: 130
url: /net/work-with-office-add-ins/
aliases: [/net/work-with-web-extensions/]
---

Sometimes you might want to give access to interface controls that run code to modify documents. Aspose.Words API provides the WebExtensions namespace, which grants various classes to customize elements and attributes extending the XML vocabulary for representing Office Add-ins.

WebExtensions namespace can be conditionally divided into:

* Objects for working with the task pane
* Objects for working with web extensions

## Using Task Panes

The task panes are interface surfaces that are displayed on the right side of the window in Microsoft Word. Task pane {allows|enables} users to access interface controls that can run code to modify documents.

For example, using Aspose.Words API, you can add a task pane add-in and customize its appearance.

## Using Web Extensions

Web Extensions are tools that expand the capabilities of Office applications and interact with Office document content. Web Extensions provide additional functionality to Office clients for improving user experience.

Aspose.Words provides the ability to add Web Extensions of the Task Pane type using the [WebExtension](https://apireference.aspose.com/words/net/aspose.words.webextensions/webextension) and [TaskPane](https://apireference.aspose.com/words/net/aspose.words.webextensions/taskpane) classes, and also {allows|enables} you to customize the pane and extension properties.

The following code example {shows|demonstrates} how to create task panes and add to web extension task panes with basic properties: 

{{< gist "aspose-com-gists" "0b968ac8900f80c11e109dffb105f3da" "Examples-CSharp-Programming-Documents-WebExtensions-WorkingWithWebExtension-UsingWebExtensionTaskPanes.cs" >}}

To see a list of task pane add-ins, use the [WebExtensionTaskPanes](https://apireference.aspose.com/words/net/aspose.words/document/properties/webextensiontaskpanes) property.

The following code example {shows|demonstrates} how to get such a list of add-ins:

{{< gist "aspose-words-gists" "eacc4fc7407a98d683f3084bb86d58f7" "Examples-DocsExamples-DocsExamples-Programming with Documents-Working with Document-Working with WebExtension-GetListOfAddins.cs" >}}
