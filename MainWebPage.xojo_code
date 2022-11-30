#tag WebPage
Begin WebPage MainWebPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   False
   Height          =   476
   ImplicitInstance=   True
   Index           =   -2147483648
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Untitled"
   Top             =   0
   Visible         =   True
   Width           =   658
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mPanelIndex    =   -1
   Begin WebListBox ExampleListBox
      ColumnCount     =   5
      ColumnWidths    =   ""
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   True
      Height          =   436
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Name	Email	Website	Status	 "
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      ProcessingMessage=   ""
      RowCount        =   0
      RowSelectionType=   0
      Scope           =   2
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   399
      _mPanelIndex    =   -1
   End
   Begin WebTextField EmailTextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   "Email:"
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   2
      Height          =   70
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   2
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   98
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebTextField NameTextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   "Name:"
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   0
      Height          =   70
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   1
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   20
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebPopupMenu StatusPopupMenu
      ControlID       =   ""
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "New\nCreated\nDone\nCancelled"
      LastAddedRowIndex=   0
      LastRowIndex    =   0
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      RowCount        =   0
      Scope           =   2
      SelectedRowIndex=   0
      SelectedRowValue=   ""
      TabIndex        =   5
      Tooltip         =   ""
      Top             =   292
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebLabel StatusLabel
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   38
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   2
      TabIndex        =   4
      Text            =   "Status:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   254
      Underline       =   False
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebButton AddButton
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Add"
      ControlID       =   ""
      Default         =   True
      Enabled         =   True
      Height          =   38
      Index           =   -2147483648
      Indicator       =   1
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   6
      Tooltip         =   ""
      Top             =   418
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebTextField WebsiteTextField
      AllowAutoComplete=   False
      AllowSpellChecking=   False
      Caption         =   "Website:"
      ControlID       =   ""
      Enabled         =   True
      FieldType       =   5
      Height          =   70
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      MaximumCharactersAllowed=   0
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   3
      Text            =   ""
      TextAlignment   =   0
      Tooltip         =   ""
      Top             =   176
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
   Begin WebCheckbox WebCheckBoxSelected
      Caption         =   "Is Checked"
      ControlID       =   ""
      Enabled         =   True
      Height          =   34
      Indeterminate   =   False
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   438
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Scope           =   2
      TabIndex        =   7
      TabStop         =   True
      Tooltip         =   ""
      Top             =   355
      Value           =   False
      Visible         =   True
      Width           =   200
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ResetForm()
		  NameTextField.Text = ""
		  EmailTextField.Text = ""
		  WebsiteTextField.Text = ""
		  StatusPopupMenu.SelectedRowIndex = 0
		  WebCheckBoxSelected.Value = False
		  
		  NameTextField.SetFocus
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events ExampleListBox
	#tag Event
		Sub CustomCellAction(row as Integer, column as Integer, identifier as string, value as variant)
		  If identifier = "GroupButtonPressed" Then
		    Select Case value
		    Case "view"
		      Var checkCell As CheckCellRender = Me.CellTextAt(row,0)
		      Var name As String = checkCell.Caption
		      Var email As String = Me.CellTagAt(row, 1)
		      MessageBox(name + " <" + email + "> ; isChecked = "+checkCell.Checked.ToString)
		    Case "delete"
		      Me.RemoveRowAt(row)
		    End Select
		  End If
		  
		  If identifier = "StatusRefreshButtonPressed" Then
		    Me.CellTextAt(row, column) = New StatusCellRenderer(StatusCellRenderer.States.Healthy, "OK", False)
		  End If
		  
		  If identifier = "CheckPressed" Then
		    MessageBox(value)
		    Var checkCell As CheckCellRender = Me.CellTextAt(row,column)
		    Me.CellValueAt(row,column) = New CheckCellRender(checkCell.Caption, Not checkCell.Checked)
		    Me.CellTagAt(row, column) = Not checkCell.Checked
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddButton
	#tag Event
		Sub Pressed()
		  ExampleListBox.AddRow(NameTextField.Text, "email", "website", "status", "actions")
		  Var index As Integer = ExampleListBox.LastAddedRowIndex
		  
		  ' Checkbox cell with text
		  ExampleListBox.CellValueAt(index,0) = New CheckCellRender(NameTextField.Text,WebCheckBoxSelected.Value)
		  ExampleListBox.CellTagAt(index, 0) = WebCheckBoxSelected.Value
		  
		  ' Gravatar cell
		  ExampleListBox.CellValueAt(index, 1) = New GravatarCellRenderer(EmailTextField.Text, EmailTextField.Text)
		  ExampleListBox.CellTagAt(index, 1) = EmailTextField.Text
		  
		  ' Text with copy button cell
		  ExampleListBox.CellValueAt(index, 2) = New TextWithCopyButtonCellRenderer(WebsiteTextField.Text, True)
		  
		  ' Status cell
		  Var state As StatusCellRenderer.States
		  Select Case StatusPopupMenu.SelectedRowValue
		  Case "New"
		    state = StatusCellRenderer.States.Unknown
		  Case "Created"
		    state = StatusCellRenderer.States.Unknown
		  Case "Done"
		    state = StatusCellRenderer.States.Healthy
		  Case "Cancelled"
		    state = StatusCellRenderer.States.Unhealthy
		  End Select
		  ExampleListBox.CellValueAt(index, 3) = New StatusCellRenderer(state, StatusPopupMenu.SelectedRowValue, True)
		  
		  ' Actions cell
		  Var actionButtons() As GroupButtonItem
		  actionButtons.Add(New GroupButtonItem("view", "View"))
		  actionButtons.Add(New GroupButtonItem("delete", "Delete", "danger"))
		  ExampleListBox.CellValueAt(index, 4) = New GroupButtonsCellRenderer(actionButtons)
		  
		  
		  ResetForm
		End Sub
	#tag EndEvent
#tag EndEvents
