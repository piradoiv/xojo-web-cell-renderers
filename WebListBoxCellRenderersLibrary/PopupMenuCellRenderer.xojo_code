#tag Class
Protected Class PopupMenuCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js As JSONItem)
		  Var rowsItem As JSONItem = js.Value("rows")
		  Var items() As String
		  
		  For index As Integer = 0 To rowsItem.LastRowIndex
		    items.Add(rowsItem.ValueAt(index).StringValue)
		  Next
		  
		  Rows = items
		  mID = js.Lookup("id", 0)
		  mRevision = js.Lookup("revision", 0)
		  mSelectedRowIndex = js.Lookup("selectedRowIndex", -1)
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s As WebSession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var rowsItem As New JSONItem("[]")
		  
		  For Each item As String In Rows
		    rowsItem.Add(item)
		  Next
		  
		  Var data As New JSONItem
		  data.Value("id") = mID
		  data.Value("revision") = mRevision
		  data.Value("rows") = rowsItem
		  data.Value("selectedRowIndex") = mSelectedRowIndex
		  
		  Return data
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddRow(text As String)
		  Rows.Add(text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rows() As String, selectedRowIndex As Integer = -1)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Rows = rows
		  mSelectedRowIndex = selectedRowIndex
		  
		  // Unique identifier, used by the browser to remember the user selection between renders
		  NextID = NextID + 1
		  mID = NextID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount() As Integer
		  Return Rows.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowTextAt(index As Integer) As String
		  Return Rows(index)
		End Function
	#tag EndMethod



	#tag Property, Flags = &h21
		Private mID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRevision As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedRowIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared NextID As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Rows() As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mSelectedRowIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSelectedRowIndex = value
			  
			  // Makes the browser discard the selection made by the user, once this renderer is assigned again
			  mRevision = mRevision + 1
			End Set
		#tag EndSetter
		SelectedRowIndex As Integer
	#tag EndComputedProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class PopupMenuCell extends XojoWeb.ListboxCellRenderer {\n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    cell.innerHTML \x3D \'\';\n\n    // The listbox fetches rows from the server on every redraw\x2C so remember the\n    // user selections here. A different revision means the selection was changed\n    // from Xojo code\x2C which wins over the one stored in the browser.\n    if (!this.selections) {\n      this.selections \x3D {};\n    }\n    let selections \x3D this.selections;\n    let selectedRowIndex \x3D data.selectedRowIndex;\n    let saved \x3D selections[data.id];\n\n    if (saved && saved.revision \x3D\x3D\x3D data.revision) {\n      selectedRowIndex \x3D saved.index;\n    } else if (saved) {\n      delete selections[data.id];\n    }\n\n    let select \x3D document.createElement(\'select\');\n    select.className \x3D \'form-select form-select-sm\';\n\n    for (let i \x3D 0; i < data.rows.length; i++) {\n      let option \x3D document.createElement(\'option\');\n      option.value \x3D i;\n      option.textContent \x3D data.rows[i];\n      select.appendChild(option);\n    }\n\n    select.selectedIndex \x3D selectedRowIndex;\n\n    // Prevent the listbox from selecting the row while interacting with the popup menu.\n    [\'click\'\x2C \'mousedown\'\x2C \'pointerdown\'\x2C \'keydown\'].forEach(function(eventName) {\n      select.addEventListener(eventName\x2C function(ev) {\n        ev.stopPropagation();\n      });\n    });\n\n    select.addEventListener(\'change\'\x2C function(ev) {\n      ev.stopPropagation();\n      selections[data.id] \x3D { revision: data.revision\x2C index: select.selectedIndex };\n\n      var obj \x3D new XojoWeb.JSONItem;\n      obj.set(\'row\'\x2C rowIndex);\n      obj.set(\'column\'\x2C columnIndex);\n      obj.set(\'identifier\'\x2C \'PopupMenuSelectionChanged\');\n      obj.set(\'value\'\x2C select.selectedIndex);\n      XojoWeb.controls.lookup(controlID).triggerServerEvent(\'CustomCellAction\'\x2C obj);\n    });\n\n    cell.appendChild(select);\n  }\n}", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectedRowIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
