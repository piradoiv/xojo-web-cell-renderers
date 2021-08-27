#tag Class
Protected Class TextWithCopyButtonCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js as JSONItem)
		  Caption = js.Lookup("caption", "")
		  IsLink = js.Lookup("isLink", False)
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var result As New JSONItem
		  result.Value("caption") = Caption
		  result.Value("isLink") = IsLink
		  Return result
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(caption As String, isLink As Boolean = False)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  Self.Caption = caption
		  Self.IsLink = isLink
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Caption As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsLink As Boolean = False
	#tag EndProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class TextWithCopyButtonCell extends XojoWeb.ListboxCellRenderer {\n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    let link \x3D document.createElement(\'a\');\n    link.innerHTML \x3D data.caption;\n    link.href \x3D data.caption;\n    link.target \x3D \'_blank\';\n    link.addEventListener(\'click\'\x2C function(ev) {\n      ev.stopPropagation();\n    });\n\n    let html \x3D data.isLink \? link : data.caption;\n\n    let button \x3D document.createElement(\'button\');\n    button.className \x3D \'btn btn-outline-secondary btn-sm\';\n    button.innerHTML \x3D \'Copy\';\n    button.style.marginLeft \x3D \'6px\';\n    button.style.marginRight \x3D \'6px\';\n\n    button.addEventListener(\'click\'\x2C function(ev) {\n        ev.stopPropagation();\n        navigator.clipboard.writeText(data.caption);\n        return false;\n    });\n\n    cell.innerHTML \x3D data.isLink \? \'\' : data.caption;\n    if (data.isLink) {\n      cell.appendChild(link);\n    }\n    cell.appendChild(button);\n  }\n}", Scope = Public
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
