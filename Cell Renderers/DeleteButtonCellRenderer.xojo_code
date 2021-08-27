#tag Class
Protected Class DeleteButtonCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Return New JSONItem
		End Function
	#tag EndEvent


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class DeleteButtonCell extends XojoWeb.ListboxCellRenderer {\n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    let button \x3D document.createElement(\'button\');\n    button.type \x3D \'button\';\n    button.className \x3D \'btn btn-danger btn-sm\';\n    button.innerHTML \x3D \'X\';\n\n    button.addEventListener(\'click\'\x2C function(ev) {\n        ev.stopPropagation();\n        var obj \x3D new XojoWeb.JSONItem;\n        obj.set(\'row\'\x2C rowIndex);\n        obj.set(\'column\'\x2C columnIndex);\n        obj.set(\'identifier\'\x2C \'DeleteButtonPressed\');\n        obj.set(\'value\'\x2C null);\n        XojoWeb.controls.lookup(controlID).triggerServerEvent(\'CustomCellAction\'\x2C obj);\n        return false;\n    });\n\n    cell.innerHTML \x3D \'\';\n    cell.appendChild(button);\n  }\n}", Scope = Public
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
