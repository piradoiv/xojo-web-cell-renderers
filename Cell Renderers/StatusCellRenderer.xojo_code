#tag Class
Protected Class StatusCellRenderer
Inherits WebListBoxCellRenderer
	#tag Event
		Sub Deserialize(js as JSONItem)
		  Select Case js.Lookup("state", "Unknown")
		  Case "Healthy"
		    State = States.Healthy
		  Case "Unhealthy"
		    State = States.Unhealthy
		  Case "Checking"
		    State = States.Checking
		  Else
		    State = States.Unknown
		  End Select
		  
		  Caption = js.Lookup("caption", "")
		  RefreshEnabled = js.Lookup("refreshEnabled", False)
		End Sub
	#tag EndEvent

	#tag Event
		Function JavascriptClassCode(s as websession) As String
		  Return kJavaScript
		End Function
	#tag EndEvent

	#tag Event
		Function Serialize() As JSONItem
		  Var js As New JSONItem
		  js.Value("state") = StateString
		  js.Value("caption") = If(Caption = "_", StateString, Caption)
		  js.Value("refreshEnabled") = RefreshEnabled
		  
		  Var iconData As MemoryBlock = WebPicture.BootstrapIcon("arrow-repeat", Color.LightGray).Data
		  Var iconString As String = iconData.StringValue(0, iconData.Size)
		  js.Value("refreshIcon") = EncodeBase64(iconString.DefineEncoding(Encodings.UTF8))
		  
		  Return js
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(state As States, caption As String = "", enableRefresh As Boolean = False)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.State = state
		  Self.Caption = caption
		  Self.RefreshEnabled = enableRefresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StateString() As String
		  Select Case State
		  Case States.Checking
		    Return "Checking"
		  Case States.Healthy
		    Return "Healthy"
		  Case States.Unhealthy
		    Return "Unhealthy"
		  Case States.Unknown
		    Return "Unknown"
		  End Select
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Caption As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RefreshEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private State As States = States.Unknown
	#tag EndProperty


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"class StatusCell extends XojoWeb.ListboxCellRenderer {\n  addCustomStyle(body) {\n    if (!this.dynamicStyles) {\n      this.dynamicStyles \x3D document.createElement(\'style\');\n      this.dynamicStyles.type \x3D \'text/css\';\n      document.head.appendChild(this.dynamicStyles);\n    }\n\n    this.dynamicStyles.sheet.insertRule(body\x2C 0);\n  }\n \n  render(controlID\x2C row\x2C data\x2C rowIndex\x2C columnIndex\x2C cell) {\n    var uuid \x3D `${controlID}-${rowIndex}-${columnIndex}`;\n    cell.innerHTML \x3D  \'\';\n\n    this.addCustomStyle(`#${uuid} { display: flex; }`);\n\n    this.addCustomStyle(`\n      #${uuid} .status-dot {\n        width: 10px;\n        height: 10px;\n        border-radius: 100px;\n        display: inline-block;\n        margin-top: 7px;\n        margin-right: 5px\n      }`);\n\n    this.addCustomStyle(`\n      #${uuid} .status-spinner {\n        margin-left: 5px;\n        cursor: pointer;\n        transform-origin: 50% 60%;\n      }`);\n\n    this.addCustomStyle(`\n      @keyframes spin-${uuid} {\n        100% { -webkit-transform: rotate(360deg); transform:rotate(360deg); }\n       }`);\n\n    var colors \x3D {\n      Healthy: \'green\'\x2C\n      Unhealthy: \'red\'\x2C\n      Checking: \'purple\'\x2C\n      Unknown: \'orange\'\x2C\n    };\n\n    var container \x3D document.createElement(\'div\');\n    container.id \x3D uuid;\n    container.innerHTML \x3D `<div class\x3D\"status-dot\" style\x3D\"background: ${colors[data.state]};\">&nbsp;</div> ${data.caption}`;\n\n    if (data.refreshEnabled) {\n      var button \x3D document.createElement(\'span\');\n      button.className \x3D \'status-spinner\';\n      button.innerHTML \x3D atob(data.refreshIcon);\n      var animation \x3D `spin-${uuid} 1s linear infinite`;\n\n      if (data.state \x3D\x3D\x3D \"Checking\") {\n        button.style.animation \x3D animation;\n      }\n\n      button.addEventListener(\'click\'\x2C function(e) {\n        this.style.animation \x3D animation;\n        var obj \x3D new XojoWeb.JSONItem;\n        obj.set(\'row\'\x2C rowIndex);\n        obj.set(\'column\'\x2C columnIndex);\n        obj.set(\'identifier\'\x2C \'StatusRefreshButtonPressed\');\n        obj.set(\'value\'\x2C null);\n        XojoWeb.controls.lookup(controlID).triggerServerEvent(\'CustomCellAction\'\x2C obj);\n      });\n\n      container.appendChild(button);\n    }\n\n    cell.appendChild(container);\n  }\n}\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kWheelSvg, Type = String, Dynamic = False, Default = \"data:image/svg+xml;base64\x2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB2aWV3Qm94PSIwIDAgMzIgMzIiPgogICAgPHN0eWxlPgpAa2V5ZnJhbWVzIGEwX3QgeyAwJSB7IHRyYW5zZm9ybTogdHJhbnNsYXRlKDE2cHgsMTZweCkgcm90YXRlKDBkZWcpIHRyYW5zbGF0ZSgtMTZweCwtMTZweCk7IH0gMjUlIHsgdHJhbnNmb3JtOiB0cmFuc2xhdGUoMTZweCwxNnB4KSByb3RhdGUoOTBkZWcpIHRyYW5zbGF0ZSgtMTZweCwtMTZweCk7IH0gNTAlIHsgdHJhbnNmb3JtOiB0cmFuc2xhdGUoMTZweCwxNnB4KSByb3RhdGUoMTgwZGVnKSB0cmFuc2xhdGUoLTE2cHgsLTE2cHgpOyB9IDc1JSB7IHRyYW5zZm9ybTogdHJhbnNsYXRlKDE2cHgsMTZweCkgcm90YXRlKDI3MGRlZykgdHJhbnNsYXRlKC0xNnB4LC0xNnB4KTsgfSAxMDAlIHsgdHJhbnNmb3JtOiB0cmFuc2xhdGUoMTZweCwxNnB4KSByb3RhdGUoMzYwZGVnKSB0cmFuc2xhdGUoLTE2cHgsLTE2cHgpOyB9IH0KICAgIDwvc3R5bGU+CiAgICA8ZyBmaWxsPSIjMDAwMDAwIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDE2LDE2KSB0cmFuc2xhdGUoLTE2LC0xNikiIHN0eWxlPSJhbmltYXRpb246IDEuNnMgbGluZWFyIGluZmluaXRlIGJvdGggYTBfdDsiPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoMCwwKSB0cmFuc2xhdGUoMTQuNSwwKSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC4xIiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzLjQ3NCwtNy43MTEyNSkgcm90YXRlKDIzKSB0cmFuc2xhdGUoMTkuMTg4LDAuOTMyKSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC4xIiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxMi40MTIxLC0xNS4yODk0KSByb3RhdGUoNDUpIHRyYW5zbGF0ZSgyMy4xNjIsMy41ODgpIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjMiIGhlaWdodD0iNy41IiBvcGFjaXR5PSIwLjEiIHJ4PSIxLjUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDI3LjU3MjgsLTE4LjI1NDQpIHJvdGF0ZSg2OCkgdHJhbnNsYXRlKDI1LjgxOCw3LjU2MikiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuMSIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNDQuMjUsLTEyLjI1KSByb3RhdGUoOTApIHRyYW5zbGF0ZSgyNi43NSwxMi4yNSkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuMSIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNTcuMDM1NCwzLjYyNTA5KSByb3RhdGUoMTEzKSB0cmFuc2xhdGUoMjUuODE4LDE2LjkzOCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuMSIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoNTkuNTM5MywyNC42NjIpIHJvdGF0ZSgxMzUpIHRyYW5zbGF0ZSgyMy4xNjIsMjAuOTEyKSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC4xIiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSg1MC4xMDMxLDQ0Ljg5NjkpIHJvdGF0ZSgxNTgpIHRyYW5zbGF0ZSgxOS4xODgsMjMuNTY4KSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC4yIiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgzMiw1Ni41KSByb3RhdGUoMTgwKSB0cmFuc2xhdGUoMTQuNSwyNC41KSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC4zIiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgxMS4wNTA4LDU2Ljg4NDMpIHJvdGF0ZSgtMTU3KSB0cmFuc2xhdGUoOS44MTIsMjMuNTY4KSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC40IiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNC45MTE5Miw0Ny4yODk0KSByb3RhdGUoLTEzNSkgdHJhbnNsYXRlKDUuODM4LDIwLjkxMikiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuNSIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEyLjUzMiwzMy4wODEyKSByb3RhdGUoLTExMykgdHJhbnNsYXRlKDMuMTgyLDE2LjkzOCkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuNiIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTEyLjI1LDE5Ljc1KSByb3RhdGUoLTkwKSB0cmFuc2xhdGUoMi4yNSwxMi4yNSkiLz4KICAgICAgICA8cmVjdCB3aWR0aD0iMyIgaGVpZ2h0PSI3LjUiIG9wYWNpdHk9IjAuNyIgcng9IjEuNSIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTcuNTYwMTUsMTEuMjAxOSkgcm90YXRlKC02NykgdHJhbnNsYXRlKDMuMTgyLDcuNTYyKSIvPgogICAgICAgIDxyZWN0IHdpZHRoPSIzIiBoZWlnaHQ9IjcuNSIgb3BhY2l0eT0iMC44IiByeD0iMS41IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMy4wMzk1LDcuMzM4KSByb3RhdGUoLTQ1KSB0cmFuc2xhdGUoNS44MzgsMy41ODgpIi8+CiAgICAgICAgPHJlY3Qgd2lkdGg9IjMiIGhlaWdodD0iNy41IiBvcGFjaXR5PSIwLjkiIHJ4PSIxLjUiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC0wLjkzMDIxMiw0LjU3ODQ3KSByb3RhdGUoLTIyKSB0cmFuc2xhdGUoOS44MTIsMC45MzIpIi8+CiAgICA8L2c+Cjwvc3ZnPgo\x3D", Scope = Private
	#tag EndConstant


	#tag Enum, Name = States, Type = Integer, Flags = &h0
		Unknown
		  Healthy
		  Unhealthy
		Checking
	#tag EndEnum


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
