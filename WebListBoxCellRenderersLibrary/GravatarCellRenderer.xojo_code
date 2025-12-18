#tag Class
Protected Class GravatarCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js As JSONItem)
		  EmailHash = js.Value("hash")
		  Name = js.Value("name")
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s As WebSession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var result As New JSONItem
		  result.Value("hash") = EmailHash
		  result.Value("name") = Name
		  Return result
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(email As String, name As String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  EmailHash = EncodeHex(MD5(email.Trim.Lowercase)).Lowercase
		  Self.Name = name
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private EmailHash As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Name As String
	#tag EndProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class GravatarCell extends XojoWeb.ListboxCellRenderer {\n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    const container \x3D document.createElement(\'div\');\n    const avatar \x3D document.createElement(\'img\');\n    avatar.src \x3D `https://www.gravatar.com/avatar/${data.hash}\?s\x3D24`;\n    avatar.className \x3D \'rounded-circle\';\n    avatar.style \x3D \'margin-right: 10px;\';\n    const nameLabel \x3D document.createElement(\'span\');\n    nameLabel.innerText \x3D data.name;\n    cell.innerHTML \x3D \'\';\n    container.style\x3D\"display: flex; align-items: center;\";\n    container.appendChild(avatar);\n    container.appendChild(nameLabel);\n    cell.appendChild(container);\n  }\n}", Scope = Private
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
