#tag Class
Protected Class CheckCellRender
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js as JSONItem)
		  Caption = js.Value("caption")
		  Checked = js.Value("checked")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  return kJavascriptClass
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var json As New JSONItem
		  
		  json.Value("caption") = Caption
		  json.Value("checked") = Checked
		  
		  Return json
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(caption as String, checked as boolean)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  Self.Caption = caption
		  Self.Checked = checked
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Caption As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Checked As Boolean
	#tag EndProperty


	#tag Constant, Name = kJavascriptClass, Type = String, Dynamic = False, Default = \"class CheckCellRender extends XojoWeb.ListboxCellRenderer {\n    render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n\n        let groupPrepend \x3D document.createElement(\"div\");\n        groupPrepend.className \x3D \"input-group-prepend\";\n\n        let groupInput \x3D document.createElement(\"div\");\n        groupInput.className \x3D \"input-group-text\";\n\n        let checkbox \x3D document.createElement(\"input\");\n        checkbox.type \x3D \"checkbox\";\n\tcheckbox.checked \x3D data.checked;\n\n        let spanCaption \x3D document.createElement(\"span\");\n        spanCaption.style \x3D \"margin-left: 5px;\";\n        spanCaption.innerHTML \x3D data.caption;\n\n        groupInput.appendChild(checkbox);\n        groupPrepend.appendChild(groupInput);\n        groupPrepend.appendChild(spanCaption);\n\n        checkbox.addEventListener(\"click\"\x2C function(ev) {\n            ev.stopPropagation();\n            var obj \x3D new XojoWeb.JSONItem();\n            obj.set(\"row\"\x2C rowIndex);\n            obj.set(\"column\"\x2C columnIndex);\n            obj.set(\"identifier\"\x2C \"CheckPressed\");\n            obj.set(\"value\"\x2C checkbox.checked);\n            XojoWeb.controls.lookup(controlID).triggerServerEvent(\"CustomCellAction\"\x2C obj);\n            return false;\n        });\n\n       cell.innerHTML \x3D \"\";\n       cell.appendChild(groupPrepend);\n    }\n}", Scope = Private
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
			Name="Caption"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
