#tag Class
Protected Class GroupButtonsCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js as JSONItem)
		  Var buttonsItem As JSONItem = js.Value("buttons")
		  Var elements() As GroupButtonItem
		  
		  For index As Integer = 0 To buttonsItem.LastRowIndex
		    Var element As JSONItem = buttonsItem(index)
		    elements.Add(New GroupButtonItem(element.Value("value"), element.Value("caption"), element.Value("type")))
		  Next
		  
		  Buttons = elements
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var data As New JSONItem
		  Var elements() As Dictionary
		  
		  For Each button As GroupButtonItem In Buttons
		    Var element As New Dictionary
		    element.Value("type") = button.Type
		    element.Value("caption") = button.Caption
		    element.Value("value") = button.Value
		    elements.Add(element)
		  Next
		  
		  data.Value("buttons") = elements
		  
		  Return data
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(view As Boolean, edit As Boolean, delete As Boolean)
		  Var items() As GroupButtonItem
		  
		  If view Then items.Add(New GroupButtonItem("view", "View"))
		  If edit Then items.Add(New GroupButtonItem("edit", "Edit"))
		  If delete Then items.Add(New GroupButtonItem("delete", "Delete", "danger"))
		  
		  Constructor(items)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(buttons() As GroupButtonItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Buttons = buttons
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Buttons() As GroupButtonItem
	#tag EndProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class GroupButtonsCell extends XojoWeb.ListboxCellRenderer {\n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    cell.innerHTML \x3D \'\';\n\n    let container \x3D document.createElement(\'div\');\n    container.className \x3D \'text-center\';\n    let buttonGroup \x3D document.createElement(\'div\');\n    buttonGroup.className \x3D \'btn-group\';\n    buttonGroup.role \x3D \'group\';\n\n    for (var i \x3D 0; i < data.buttons.length; i++) {\n        let newButton \x3D data.buttons[i];\n        let button \x3D document.createElement(\'button\');\n        button.type \x3D \'button\';\n        button.className \x3D \'btn btn-\' + newButton.type + \' btn-sm\';\n        button.innerHTML \x3D newButton.caption;\n\n        button.addEventListener(\'click\'\x2C function(ev) {\n            ev.stopPropagation();\n            var obj \x3D new XojoWeb.JSONItem;\n            obj.set(\'row\'\x2C rowIndex);\n            obj.set(\'column\'\x2C columnIndex);\n            obj.set(\'identifier\'\x2C \'GroupButtonPressed\');\n            obj.set(\'value\'\x2C newButton.value);\n            XojoWeb.controls.lookup(controlID).triggerServerEvent(\'CustomCellAction\'\x2C obj);\n            return false;\n        });\n\n        buttonGroup.appendChild(button);\n    }\n\n    container.appendChild(buttonGroup);\n    cell.appendChild(container);\n  }\n}", Scope = Public
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
	#tag EndViewBehavior
End Class
#tag EndClass
