﻿---
title: LINQ Reporting Engine API
type: docs
weight: 40
url: /net/linq-reporting-engine-api/
---

{{% alert color="primary" %}} 

Classes of the LINQ Reporting Engine are located within the `Aspose.Words.Reporting` namespace. The main of the classes is `ReportingEngine`. All the functionality required to build a report from a template is assembled within the class.

{{% /alert %}} 

## Building Reports

To build a report from a template, you can use one of the `ReportingEngine.BuildReport` overloads. The following table describes the parameters of these overloads.

|Parameter|Description|
| :- | :- |
|document|A template document. At runtime, this document instance is populated with a data from the specified source and becomes a ready report.|
|dataSource|An object providing a data to populate the specified template. The object must be of one of the following types:<br>- A traditional mail merge data source (see “Working with Traditional Mail Merge Data Sources” for more information)<br>- An object of a custom visible type (see “Working with Types” for more information)<br>- An `XmlDataSource` instance (see “Accessing XML Data” for more information)<br>- A `JsonDataSource` instance (see “Accessing JSON Data” for more information)<br>- A `CsvDataSource` instance (see “Accessing CSV Data” for more information)|
|dataSourceName|The identifier of the specified data source object within the specified template. You can omit this identifier, if the template uses the contextual object member access (see “ REF contextual Using Contextual Object Member Access” for more information) when dealing with the data source.|

Given a template to be populated with a data from a `DataSet` instance that is identified as “ds” within the template, you can use the following code to build the corresponding report.

{{< highlight csharp >}}
Document doc = ...   // Loading a template document.
DataSet dataSet = ... // Setting up a data set.
ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSet, “ds”);
{{< /highlight >}}

Given a visible `Person` class defined in your application and a template to be populated with a data about a single `Person` instance using the contextual object member access, you can use the following code to build the corresponding report.

{{< highlight csharp >}}
Document doc = ...   // Loading a template document.
Person person = ...   // Setting up a person data.
ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, person);
{{< /highlight >}}


## Accessing XML Data

To access XML data while building a report, you can use facilities of `DataSet` to read XML into it and then pass it to the engine as a data source. However, if your scenario does not permit to specify XML schema while loading XML into `DataSet`, all attributes and text values of XML elements are loaded as strings then. Thus, it becomes impossible, for example, to use arithmetic operations on numbers or to specify custom date-time and numeric formats to output corresponding values, because all of them are treated as strings.

To overcome this limitation, you can pass an `XmlDataSource` instance to the engine as a data source instead. Even when XML schema is not provided, `XmlDataSource` is capable to recognize values of the following types by their string representations:

- Int64?
- Double?
- Boolean?
- DateTime?

**Note –** For recognition of data types to work, string representations of corresponding attributes and text values of XML elements must be formed using invariant culture settings.

While loading data to `XmlDataSource`, the engine performs actions typical for XML deserialization behind the scenes: It maps complex-type XML elements to internal objects and simple-type XML elements to fields of containing objects. So, in template documents, an `XmlDataSource` instance should be treated as an object having corresponding fields and nested objects as shown in the following example.

XML

{{< highlight xml >}}
<Person>
	<Name>John Doe</Name>
	<Age>30</Age>
	<Birth>1989-04-01 4:00:00 pm</Birth>
	<Child>Ann Doe</Child>
	<Child>Charles Doe</Child>
</Person>
{{< /highlight >}}

Template document

{{< highlight xml >}}
Name: <<[Name]>>, Age: <<[Age]>>, Date of Birth:
<<[Birth]:"dd.MM.yyyy">>

Children:
<<foreach [in Child]>><<[Child_Text]>>
<</foreach>>
{{< /highlight >}}

Source code
{{< highlight csharp >}}
Document doc = ...             // Loading a template document.
XmlDataSource dataSource = ... // Loading XML.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource);
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989
Children:
Ann Doe
Charles Doe
{{< /highlight >}}

**Note –** To reference a sequence of repeated simple-type XML elements with the same name, the elements’ name itself (for example, “Child”) should be used in a template document, whereas the same name with the “_Text” suffix (for example, “Child_Text”) should be used to reference the text value of one of these elements.

By default, if a root XML element contains only a sequence of elements of one type, the engine does not generate an internal root object while loading XML data. So, in template documents, such an `XmlDataSource` instance should be treated as a sequence of corresponding nested objects as shown in the following example.

XML

{{< highlight xml >}}
<Persons>
	<Person>
		<Name>John Doe</Name>
		<Age>30</Age>
		<Birth>1989-04-01 4:00:00 pm</Birth>
	</Person>
	<Person>
		<Name>Jane Doe</Name>
		<Age>27</Age>
		<Birth>1992-01-31 07:00:00 am</Birth>
	</Person>
	<Person>
		<Name>John Smith</Name>
		<Age>51</Age>
		<Birth>1968-03-08 1:00:00 pm</Birth>
	</Person>
</Persons>
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in persons]>>Name: <<[Name]>>, Age: <<[Age]>>, Date of Birth: <<[Birth]:"dd.MM.yyyy">>
<</foreach>>

Average age: <<[persons.Average(p => p.Age)]>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...             // Loading a template document.
XmlDataSource dataSource = ... // Loading XML (without schema).

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "persons");
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989
Name: Jane Doe, Age: 27, Date of Birth: 31.01.1992
Name: John Smith, Age: 51, Date of Birth: 08.03.1968

Average age: 36
{{< /highlight >}}

However, if your scenario requires an internal object for a root XML element to be always generated while loading data to `XmlDataSource`, you can force this as shown in the following code snippet.

{{< highlight csharp >}}
XmlDataLoadOptions options = new XmlDataLoadOptions();
options.AlwaysGenerateRootObject = true;
XmlDataSource dataSource = new XmlDataSource(..., options);
{{< /highlight >}}

The following example sums up typical scenarios involving nested complex-type XML elements.

XML
{{< highlight csharp >}}
<Managers>
	<Manager>
		<Name>John Smith</Name>
		<Contract>
			<Client>
				<Name>A Company</Name>
			</Client>
			<Price>1200000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>B Ltd.</Name>
			</Client>
			<Price>750000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>C &amp; D</Name>
			</Client>
			<Price>350000</Price>
		</Contract>
	</Manager>
	<Manager>
		<Name>Tony Anderson</Name>
		<Contract>
			<Client>
				<Name>E Corp.</Name>
			</Client>
			<Price>650000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>F &amp; Partners</Name>
			</Client>
			<Price>550000</Price>
		</Contract>
	</Manager>
	<Manager>
		<Name>July James</Name>
		<Contract>
			<Client>
				<Name>G &amp; Co.</Name>
			</Client>
			<Price>350000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>H Group</Name>
			</Client>
			<Price>250000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>I &amp; Sons</Name>
			</Client>
			<Price>100000</Price>
		</Contract>
		<Contract>
			<Client>
				<Name>J Ent.</Name>
			</Client>
			<Price>100000</Price>
		</Contract>
	</Manager>
</Managers>
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in managers]>>Manager: <<[Name]>>
Contracts:
<<foreach [in Contract]>>- <<[Client.Name]>> ($<<[Price]>>)
<</foreach>>
<</foreach>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...             // Loading a template document.
XmlDataSource dataSource = ... // Loading XML.
    
ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "managers");
{{< /highlight >}}

Result document

{{< highlight text >}}
Manager: John Smith
Contracts:
- A Company ($1200000)
- B Ltd. ($750000)
- C & D ($350000)
  

Manager: Tony Anderson
Contracts:
- E Corp. ($650000)
- F & Partners ($550000)
  

Manager: July James
Contracts:
- G & Co. ($350000)
- H Group ($250000)
- I & Sons ($100000)
- J Ent. ($100000)
{{< /highlight >}}

## Accessing JSON Data

To access JSON data while building a report, you can pass a `JsonDataSource` instance to the engine as a data source.

Using of `JsonDataSource` {enables|allows} you to work with typed values of JSON elements in template documents. For more convenience, the set of simple JSON types is extended as follows:

- Int64?
- Double?
- Boolean?
- DateTime?
- String

**Note –** Working with complex JSON types (objects and arrays) is also supported.

While loading data to `JsonDataSource`, the engine performs JSON deserialization and generates corresponding internal objects. So, in template documents, a `JsonDataSource` instance should be treated according to what a root JSON element represents.

If a root JSON element is an object, a `JsonDataSource` instance should be treated as an object as well as shown in the following example.

JSON

{{< highlight json >}}
{
	Name: "John Doe",
	Age: 30,
	Birth: "1989-04-01 4:00:00 pm",
	Child: [ "Ann Doe", "Charles Doe" ]
}
{{< /highlight >}}

Template document

{{< highlight xml >}}
Name: <<[Name]>>, Age: <<[Age]>>, Date of Birth: <<[Birth]:"dd.MM.yyyy">>

Children:
<<foreach [in Child]>><<[Child_Text]>>
<</foreach>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...              // Loading a template document.
JsonDataSource dataSource = ... // Loading JSON.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource);
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989

Children:
Ann Doe
Charles Doe
{{< /highlight >}}

**Note –** To reference a JSON object property that is an array of simple-type values, the name of the property (for example, “Child”) should be used in a template document, whereas the same name with the “_Text” suffix (for example, “Child_Text”) should be used to reference the value of an item of this array.

If a root JSON element is an array, a `JsonDataSource` instance should be treated as a sequence of items of this array as shown in the following example.

JSON

{{< highlight json >}}
[
	{
		Name: "John Doe",
		Age: 30,
		Birth: "1989-04-01 4:00:00 pm"
	},
	{
		Name: "Jane Doe",
		Age: 27,
		Birth: "1992-01-31 07:00:00 am"
	},
	{
		Name: "John Smith",
		Age: 51,
		Birth: "1968-03-08 1:00:00 pm"
	}
]
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in persons]>>Name: <<[Name]>>, Age: <<[Age]>>, Date of Birth: <<[Birth]:"dd.MM.yyyy">>
<</foreach>>

Average age: <<[persons.Average(p => p.Age)]>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...              // Loading a template document.
JsonDataSource dataSource = ... // Loading JSON.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "persons");
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989
Name: Jane Doe, Age: 27, Date of Birth: 31.01.1992
Name: John Smith, Age: 51, Date of Birth: 08.03.1968

Average age: 36
{{< /highlight >}}

By default, if a root JSON element is an object having only one property that is an object or array in turn, the engine does not generate an internal root object while loading JSON data. So, in template documents, such a `JsonDataSource` instance should be treated according to what this property represents instead. For instance, the following JSON snippets can be used to produce the same results in previous examples of this section respectively.

JSON 1

{{< highlight json >}}
{
	Person:
	{
		Name: "John Doe",
		Age: 30,
		Birth: "1989-04-01 4:00:00 pm",
		Child: [ "Ann Doe", "Charles Doe" ]
	}
}
{{< /highlight >}}

JSON 2

{{< highlight json >}}
{
	Persons:
	[
		{
			Name: "John Doe",
			Age: 30,
			Birth: "1989-04-01 4:00:00 pm"
		},
		{
			Name: "Jane Doe",
			Age: 27,
			Birth: "1992-01-31 07:00:00 am"
		},
		{
			Name: "John Smith",
			Age: 51,
			Birth: "1968-03-08 1:00:00 pm"
		}
	]
}
{{< /highlight >}}

However, if your scenario requires an internal object for a root JSON element to be always generated while loading data to `JsonDataSource`, you can force this as shown in the following code snippet.

{{< highlight csharp >}}
JsonDataLoadOptions options = new JsonDataLoadOptions();
options.AlwaysGenerateRootObject = true;
JsonDataSource dataSource = new JsonDataSource(..., options);
{{< /highlight >}}

The following example sums up typical scenarios involving nested JSON objects and arrays.

JSON

{{< highlight json >}}
[
	{
		Name: "John Smith",
		Contract:
		[
			{
				Client:
				{
					Name: "A Company"
				},
				Price: 1200000
			},
			{
				Client:
				{
					Name: "B Ltd."
				},
				Price: 750000
			},
			{
				Client:
				{
					Name: "C & D"
				},
				Price: 350000
			}
		]
	},
	{
		Name: "Tony Anderson",
		Contract:
		[
			{
				Client:
				{
					Name: "E Corp."
				},
				Price: 650000
			},
			{
				Client:
				{
					Name: "F & Partners"
				},
				Price: 550000
			}
		]
	},
	{
		Name: "July James",
		Contract:
		[
			{
				Client:
				{
					Name: "G & Co."
				},
				Price: 350000
			},
			{
				Client:
				{
					Name: "H Group"
				},
				Price: 250000
			},
			{
				Client:
				{
					Name: "I & Sons"
				},
				Price: 100000
			},
			{
				Client:
				{
					Name: "J Ent."
				},
				Price: 100000
			}
		]
	}
]
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in managers]>>Manager: <<[Name]>>
Contracts:
<<foreach [in Contract]>>- <<[Client.Name]>> ($<<[Price]>>)
<</foreach>>
<</foreach>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...              // Loading a template document.
JsonDataSource dataSource = ... // Loading JSON.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "managers");
{{< /highlight >}}

Result document

{{< highlight text >}}
Manager: John Smith
Contracts:
- A Company ($1200000)
- B Ltd. ($750000)
- C & D ($350000)

Manager: Tony Anderson
Contracts:
- E Corp. ($650000)
- F & Partners ($550000)

Manager: July James
Contracts:
- G & Co. ($350000)
- H Group ($250000)
- I & Sons ($100000)
- J Ent. ($100000)
{{< /highlight >}}

For recognition of JSON simple values (null, boolean, number, integer, and string), the engine provides two modes: *loose* and *strict*. In the loose mode, types of JSON simple values are determined upon parsing of their string representations. In the strict mode, types of JSON simple values are determined from JSON notation itself. To see the main difference between the modes, consider the following JSON snippet.

{{< highlight json >}}
{ prop: "123" }
{{< /highlight >}}

In the loose mode, the type of `prop` is determined as an integer, whereas in the strict mode, it is determined as a string.

The loose mode is used by the engine by default to support more typed data representation options. However, in some scenarios, it can be more preferable to disable recognition of numbers and other JSON simple values from strings, for example, when you need to keep leading padding zeros in a string value representing a number. In this case, you can switch to the strict mode as shown in the following code snippet.

{{< highlight csharp >}}
JsonDataLoadOptions options = new JsonDataLoadOptions();
options.SimpleValueParseMode = JsonSimpleValueParseMode.Strict;
JsonDataSource dataSource = new JsonDataSource(..., options);
{{< /highlight >}}

**Note –** Parsing of date-time values does not depend on whether the loose or strict mode is used.

Recognition of date-time values is a special case, because [JSON specification](https://www.json.org) does not define a format for their representation. So, by default, while parsing date-time values from strings, the engine tries {several|multiple|a few|many|numerous} formats in the following order:

1. [The ISO-8601 format](https://en.wikipedia.org/wiki/ISO_8601) (for values like "2015-03-02T13:56:04Z")
1. [The Microsoft® JSON date-time format](https://docs.microsoft.com/en-us/previous-versions/dotnet/articles/bb299886\(v=msdn.10\)#from-javascript-literals-to-json) (for values like "/Date(1224043200000)/")
1. All date-time formats supported for the current culture
1. All date-time formats supported for the English USA culture
1. All date-time formats supported for the English New Zealand culture

Although this approach is quite flexible, in some scenarios, you may need to restrict strings to be recognized as date-time values. You can achieve this by specifying one or {several|multiple|a few|many|numerous} exact formats in the context of the current culture to be used while parsing date-time values from strings as shown in the following example.

{{< highlight csharp >}}
List<String> formats = new List<String>();
formats.Add("MM/dd/yyyy");

JsonDataLoadOptions options = new JsonDataLoadOptions();
options.ExactDateTimeParseFormats = formats;
JsonDataSource dataSource = new JsonDataSource(..., options);
{{< /highlight >}}

In this example, strings conforming the format "MM/dd/yyyy" are going to be recognized as date-time values while loading JSON, whereas the others are not (but see the following note).

In some scenarios, you may need to disable recognition of date-time values at all, for example, when you deal with strings containing already formatted date-time values, which you do not want to re-format using the engine. You can achieve this by setting the exact date-time parse formats to an empty list (but see the following note).

**Note –** Strings conforming the Microsoft® JSON date-time format (for example, "/Date(1224043200000)/") are always recognized as date-time values regardless of the exact date-time parse format.

## Accessing CSV Data

To access CSV data while building a report, you can pass a `CsvDataSource` instance to the engine as a data source.

Using of `CsvDataSource` {enables|allows} you to work with typed values rather than just strings in template documents. Although CSV as a format does not define a way to store values of types other than strings, `CsvDataSource` is capable to recognize values of the following types by their string representations:

- Int64?
- Double?
- Boolean?
- DateTime?

**Note –** For recognition of data types to work, string representations of corresponding values must be formed using invariant culture settings.

In template documents, a`CsvDataSource` instance should be treated as a sequence of objects having corresponding fields as shown in the following example.

CSV

{{< highlight csv >}}
John Doe,30,1989-04-01 4:00:00 pm
Jane Doe,27,1992-01-31 07:00:00 am
John Smith,51,1968-03-08 1:00:00 pm
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in persons]>>Name: <<[Column1]>>, Age: <<[Column2]>>, Date of Birth: <<[Column3]:"dd.MM.yyyy">>
<</foreach>>

Average age: <<[persons.Average(p => p.Column2)]>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ...             // Loading a template document.
CsvDataSource dataSource = ... // Loading CSV.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "persons");
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989
Name: Jane Doe, Age: 27, Date of Birth: 31.01.1992
Name: John Smith, Age: 51, Date of Birth: 08.03.1968

Average age: 36
{{< /highlight >}}

By default, `CsvDataSource` uses column names such as “Column1”, “Column2”, and so on, as you can see from the previous example. However, `CsvDataSource` can be configured to read column names from the first line of CSV data as shown in the following example.

CSV

{{< highlight csv >}}
Name,Age,Birth
John Doe,30,1989-04-01 4:00:00 pm
Jane Doe,27,1992-01-31 07:00:00 am
John Smith,51,1968-03-08 1:00:00 pm
{{< /highlight >}}

Template document

{{< highlight xml >}}
<<foreach [in persons]>>Name: <<[Name]>>, Age: <<[Age]>>, Date of Birth: <<[Birth]:"dd.MM.yyyy">>
<</foreach>>

Average age: <<[persons.Average(p => p.Age)]>>
{{< /highlight >}}

Source code

{{< highlight csharp >}}
Document doc = ... // Loading a template document.
CsvDataLoadOptions options = new CsvDataLoadOptions(true);
CsvDataSource dataSource = new CsvDataSource(..., options); // Loading CSV.

ReportingEngine engine = new ReportingEngine();
engine.BuildReport(doc, dataSource, "persons");
{{< /highlight >}}

Result document

{{< highlight text >}}
Name: John Doe, Age: 30, Date of Birth: 01.04.1989
Name: Jane Doe, Age: 27, Date of Birth: 31.01.1992
Name: John Smith, Age: 51, Date of Birth: 08.03.1968

Average age: 36
{{< /highlight >}}

Also, you can use `CsvDataLoadOptions` to customize the following characters playing special roles while loading CSV data:

- Value separator (the default is comma)
- Single-line comment start (the default is sharp)
- Quotation mark enabling to use other special characters within a value (the default is double quotes)


## Setting up Known External Types

LINQ Reporting Engine must be aware of custom external types that you reference in your template before the engine processes the template. You can set up external types known by the engine through the `ReportingEngine.KnownTypes` property. The property represents an unordered set (that is, a collection of unique items) of [Type](http://msdn.microsoft.com/en-us/library/system.type\(v=vs.110\).aspx) objects. Every type in the set must meet requirements declared at “Working with Types”.

**Note –** Aliases of simple types like `int`, `string`, and others are known by the engine by default.

Consider the following example. Given an `ImageUtil` class declared at your application and a template accessing a static member of this class, you can use the following code to make the engine be aware of the class before processing the template.

{{< highlight csharp >}}
ReportingEngine engine = new ReportingEngine();
engine.KnownTypes.Add(typeof(ImageUtil));
engine.BuildReport(...);
{{< /highlight >}}

## Removing Paragraphs Containing Only Template Syntax Tags

While building a report, some paragraphs containing only template syntax tags can become empty after the tags are removed or replaced with empty values. To remove such paragraphs from the report, you can apply the `ReportBuildOptions.RemoveEmptyParagraphs` option as shown in the following example.

{{< highlight csharp >}}
ReportingEngine engine = new ReportingEngine();
engine.Options |= ReportBuildOptions.RemoveEmptyParagraphs;
engine.BuildReport(...);
{{< /highlight >}}

The difference in the engine’s behavior when the option is applied and not applied is illustrated by the following examples.

**Example 1**

Template document

{{< highlight xml >}}
Prefix
<<[""]>>
Suffix
{{< /highlight >}}

Result document without `ReportBuildOptions.RemoveEmptyParagraphs` applied

{{< highlight xml >}}
Prefix

Suffix
{{< /highlight >}}

Result document with `ReportBuildOptions.RemoveEmptyParagraphs` applied

{{< highlight xml >}}
Prefix
Suffix
{{< /highlight >}}

**Example 2**

Template document

{{< highlight xml >}}
Prefix
<<if [false]>>
Text to be removed
<</if>>
Suffix
{{< /highlight >}}

Result document without `ReportBuildOptions.RemoveEmptyParagraphs` applied
{{< highlight xml >}}
Prefix

Suffix
{{< /highlight >}}

Result document with `ReportBuildOptions.RemoveEmptyParagraphs` applied
{{< highlight xml >}}
Prefix
Suffix
{{< /highlight >}}

**Example 3**

**Note –** In this example, `persons` is assumed to be a data table having a field `Name`.

Template document

{{< highlight xml >}}
Prefix
<<foreach [in persons]>>
<<[Name]>>
<</foreach>>
Suffix
{{< /highlight >}}

Result document without `ReportBuildOptions.RemoveEmptyParagraphs` applied

{{< highlight xml >}}
Prefix

John Doe

Jane Doe

John Smith

Suffix
{{< /highlight >}}

Result document with `ReportBuildOptions.RemoveEmptyParagraphs` applied

{{< highlight xml >}}
Prefix
John Doe
Jane Doe
John Smith
Suffix
{{< /highlight >}}

## Accessing Missing Members of Data Objects

By default, LINQ Reporting Engine forbids access to missing members of data objects used to build a report in template expressions, since such access is forbidden by [C# Language Specification 5.0](http://www.microsoft.com/en-us/download/details.aspx?id=7029). On attempt to use a missing member of a data object, the engine throws an exception then.

But in some scenarios, members of data objects are not exactly known while designing a template. For example, if using a `DataSet` instance loaded from XML without its schema defined, some of expected data members can be missing.

To support such scenarios, the engine provides an option to treat missing members of data objects as null literals. You can enable the option as shown in the following example.

{{< highlight csharp >}}
ReportingEngine engine = new ReportingEngine();
engine.Options |= ReportBuildOptions.AllowMissingMembers;
engine.BuildReport(...);
{{< /highlight >}}

Consider the following example. Given that `r` is a `DataRow` instance that does not have a field `Missing`, by default, the following template expression causes the engine to throw an exception while building a report.

{{< highlight xml >}}
<<[r.Missing]>>
{{< /highlight >}}

However, if `ReportBuildOptions.AllowMissingMembers` is applied, the engine treats access to such a field as a null literal, so no exception is thrown and simply no value is written to the report then.

## Inlining Syntax Error Messages into Templates

By default, LINQ Reporting Engine throws an exception when encounters a template syntax error. Such an exception provides information on a reason of the error and specifies a tag or expression part where the error is encountered. In most cases, this information is enough to find a place in a template causing the error and fix it.

However, when dealing with complex templates containing a large number of tags, it becomes harder to find an exact place in a template causing an error. To make things easier, the engine supports the `ReportBuildOptions.InlineErrorMessages` option that {enables|allows} inlining of a syntax error message into a template document at an exact position where the error occurs during runtime. 

**Note –** A template syntax error message is written using a bold font to make it more apparent.

Consider the following template.

{{< highlight xml >}}
<<var [name]>>
{{< /highlight >}}

By default, such a template causes the engine to throw an exception while building a report. However, when `ReportBuildOptions.InlineErrorMessages` is applied, no exception is thrown and the report looks as follows then.

{{< highlight xml >}}
<<var [name] Error! An assignment operator is expected. >>
{{< /highlight >}}

**Note –** Only messages describing errors in template syntax can be inlined; messages describing errors encountered during expressions’ evaluation cannot.

When `ReportBuildOptions.InlineErrorMessages` is applied, a Boolean value returned by a `ReportingEngine.BuildReport` overload indicates whether building of a report was finished successfully or was interrupted because of a template syntax error. This {enables|allows} you to process reports which building succeeded or failed differently as shown in the following code snippet.

{{< highlight csharp >}}
ReportingEngine engine = new ReportingEngine();
engine.Options |= ReportBuildOptions.InlineErrorMessages;
if (engine.BuildReport(...))
{
	// Do something with a successfully built report.
}
else
{
	// Do something with a report containing a template syntax error.
}
{{< /highlight >}}

**Note –** When `ReportBuildOptions.InlineErrorMessages` is not applied, `ReportingEngine.BuildReport` overloads return `true` if there were no template syntax errors encountered or throw an exception otherwise.


## Optimizing Reflection Calls

LINQ Reporting Engine uses reflection calls while accessing members of custom external types. However, reflection calls are much slower than direct calls, which create a performance overhead.

That is why, the engine provides a strategy minimizing the reflection usage. The strategy is based upon the runtime type generation. That is, the engine generates a proxy type per an external type. The proxy directly calls members of the corresponding external type, the engine to access these members in a uniform way with no reflection involved. The proxy is [lazily initialized](http://en.wikipedia.org/wiki/Lazy_initialization) and reused in further. Thus, the reflection is used only while building the proxy.

Although this strategy can significantly minimize the reflection usage in a long run, it creates a performance overhead of the runtime type generation. So, if you deal with small data collections all the time while building your reports, consider the disabling of the strategy. You can control the enabling of the strategy through the `ReportingEngine.UseReflectionOptimization` static property. By default, the strategy is enabled.
