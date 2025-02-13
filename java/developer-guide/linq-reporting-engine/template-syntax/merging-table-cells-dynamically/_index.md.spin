﻿---
title: Merging Table Cells Dynamically
type: docs
weight: 100
url: /java/merging-table-cells-dynamically/
---

You can merge table cells with equal textual contents within your reports dynamically using `cellMerge` tags. Syntax of a `cellMerge` tag is defined as follows.

{{< highlight csharp >}}
<<cellMerge>>
{{< /highlight >}}

By default, a `cellMerge` tag causes a cell merging operation only in a vertical direction during runtime. However, you can alter this behavior in the following ways:

- To merge cells only in a horizontal direction, use the `horz` switch as follows.
{{< highlight csharp >}}<<cellMerge -horz>>{{< /highlight >}}

- To merge cells in both – vertical and horizontal – directions, use the both switch as follows.
{{< highlight csharp >}}<<cellMerge -both>>{{< /highlight >}}

For two or more successive table cells to be merged dynamically in either direction by the engine, the following requirements must be met:

- Each of the cells must contain a `cellMerge` tag denoting a cell merging operation in the same direction.
- Each of the cells must not be already merged in another direction. This requirement does not apply when a `both` switch is used.
- The cells must have equal textual contents ignoring leading and trailing whitespaces.

Consider the following template.

|...|...|...|
| :- | :- | :- |
|**...**|**&lt;&lt;cellMerge&gt;&gt;&lt;&lt;[value1]&gt;&gt;**|**...**|
|**...**|**&lt;&lt;cellMerge&gt;&gt;&lt;&lt;[value2]&gt;&gt;**|**...**|
|**...**|**...**|**...**|


If `value1` and `value2` have the same value, say “Hello”, table cells containing `cellMerge` tags are successfully merged during runtime and a result report looks as follows then.

|...|...|...|
| :- | :- | :- |
|**...**|**Hello**|**...**|
|**...**||**...**|
|**...**|**...**|**...**|

If `value1` and `value2` have different values, say “Hello” and “World”, table cells containing `cellMerge` tags are not merged during runtime and a result report looks as follows then.

|...|...|...|
| :- | :- | :- |
|**...**|**Hello**|**...**|
|**...**|**World**|**...**|
|**...**|**...**|**...**|

**Note –** A `cellMerge` tag can be normally used within a table data band.

You can define an additional restriction on dynamic merging of table cells by providing an expression for a `cellMerge` tag using the following syntax.

{{< highlight csharp >}}
<<cellMerge [expression]>>
{{< /highlight >}}

During runtime, expressions defined for `cellMerge` tags are evaluated and dynamic cell merging is discarded for those tags, which expressions return unequal values, even if all other conditions for merging such as equal cell textual contents are met. In particular, this feature is useful when cells corresponding to different data band sequence elements should not be merged as shown in the following example.

Assume that you have the `Invoice` and `InvoiceItem` classes defined in your application as follows.

{{< highlight csharp >}}
public class Invoice
{
	public int getNumber() { ... }
	public Iterable<InvoiceItem> getItems() { ... }
	...
}
public class InvoiceItem
{
	public String getWare() { ... }
	public String getPack() { ... }
	public int getQuantity() { ... }
	...
}
{{< /highlight >}}

Given that `invoices` is an enumeration of Invoice instances, you could use the following template to output information on {several|multiple|a few|many|numerous} invoices in one table.

| #                                                            | Ware                                | Pack                   | Quantity                                           |
| ------------------------------------------------------------ | ----------------------------------- | ---------------------- | -------------------------------------------------- |
| `<<foreach [invoice in invoices]>><<foreach [item in invoice.getItems()]>><<[invoice.getNumber()]>><<cellMerge>>` | `<<[item.getWare()]>><<cellMerge>>` | `<<[item.getPack()]>>` | `<<[item.getQuantity()]>><</foreach>><</foreach>>` |

A result document would look as follows then.

<table>
	<tbody>
		<tr>
			<td><b>#</b></td>
			<td><b>Ware</b></td>
			<td><b>Pack</b></td>
			<td><b>Quantity</b></td>
		</tr>
		<tr>
			<td rowspan="2">11342</td>
			<td rowspan="3">Natural Mineral Water</td>
			<td>Bottle 1.0 L</td>
			<td>30</td>
		</tr>
		<tr>
			<td>Bottle 0.5 L</td>
			<td>50</td>
		</tr>
		<tr>
			<td>15385</td>
			<td>Bottle 1.0 L</td>
			<td>110</td>
		</tr>
	</tbody>
</table>

That is, cells corresponding to the same wares at different invoices would be merged, which is unwanted. To prevent this from happening, you can use the following template instead.

| #                                                            | Ware                                                    | Pack                   | Quantity                                           |
| ------------------------------------------------------------ | ------------------------------------------------------- | ---------------------- | -------------------------------------------------- |
| `<<foreach [invoice in invoices]>><<foreach [item in invoice.getItems()]>><<[invoice.getNumber()]>><<cellMerge>>` | `<<[item.getWare()]>><<cellMerge [invoice.indexOf()]>>` | `<<[item.getPack()]>>` | `<<[item.getQuantity()]>><</foreach>><</foreach>>` |

Then, a result document looks as follows.

<table>
	<tbody>
		<tr>
			<td><b>#</b></td>
			<td><b>Ware</b></td>
			<td><b>Pack</b></td>
			<td><b>Quantity</b></td>
		</tr>
		<tr>
			<td rowspan="2">11342</td>
			<td rowspan="2">Natural Mineral Water</td>
			<td>Bottle 1.0 L</td>
			<td>30</td>
		</tr>
		<tr>
			<td>Bottle 0.5 L</td>
			<td>50</td>
		</tr>
		<tr>
			<td>15385</td>
      <td>Natural Mineral Water</td>
			<td>Bottle 1.0 L</td>
			<td>110</td>
		</tr>
	</tbody>
</table>

**Note –** You could use `<<cellMerge [invoice.getNumber()]>>` instead of `<<cellMerge [invoice.indexOf()]>>` to get the same effect, but using of `indexOf()` is a more generic approach.
