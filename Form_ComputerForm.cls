VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_ComputerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub addCmd_Click()

    'like customer form, ADD button has 2 options while editing: add and update
    If Me.upctxt.Tag & "" = "" Then
        'add computer data to table
        CurrentDb.Execute "INSERT INTO COMPUTER(UPC, Type, Description, Qty_InStock, Qty_Sold, Price) " & _
        " VALUES (" & Me.upctxt & ",'" & Me.typeCombo & "','" & Me.dsctxt & "','" & _
        Me.qtytxt & "','" & Me.qtysotxt & "','" & Me.pricetxt & "')"
    
    Else
        'otherwise, store the upc to be modified and update
        CurrentDb.Execute "UPDATE COMPUTER " & _
                "SET UPC =" & Me.upctxt & _
                ", Type='" & Me.typeCombo & "'" & _
                ", Description='" & Me.dsctxt & "'" & _
                ", Qty_InStock='" & Me.qtytxt & "'" & _
                ", Qty_Sold='" & Me.qtysotxt & "'" & _
                ", Price='" & Me.pricetxt & "'" & _
                " WHERE UPC=" & Me.upctxt.Tag
                
    End If
    
    'clear form after data added
    clrCmd_Click
    'refresh data
    Computersubform.Form.Requery
End Sub

Private Sub closeCmd_Click()
    'close the form
    DoCmd.Close
    
End Sub

Private Sub clrCmd_Click()
    Me.upctxt = ""
    Me.typeCombo = ""
    Me.dsctxt = ""
    Me.qtytxt = ""
    Me.qtysotxt = ""
    Me.pricetxt = ""
    
    'focus on UPC text box
    Me.upctxt.SetFocus
    
    'set EDIT button enable if form cleared
    Me.editCmd.Enabled = True
    
    'Change UPDATE button back to ADD
    Me.addCmd.Caption = "ADD"
    
    'clear tag on upc for reseting
    Me.upctxt.Tag = ""
    
End Sub

Private Sub delCmd_Click()
    'Delete a record in table
    'check existing record
    If Me.upctxt.Tag & "" = "" Or Not (Me.Computersubform.Form.Recordset.EOF And Me.Computersubform.Form.Recordset.BOF) Then
    'confirm delete
        If MsgBox("Do you want to delete?", vbYesNo) = vbYes Then
            'Delete row
            CurrentDb.Execute "DELETE FROM COMPUTER " & _
            " WHERE UPC=" & Me.Computersubform.Form.Recordset.Fields("UPC")
            'refresh data in the table
            Me.Computersubform.Form.Requery
        End If
    End If
End Sub

Private Sub editCmd_Click()
    'check if data exists in the table
    If Not (Me.Computersubform.Form.Recordset.EOF And Me.Computersubform.Form.Recordset.BOF) Then
        With Me.Computersubform.Form.Recordset
            Me.upctxt = .Fields("UPC")
            Me.typeCombo = .Fields("Type")
            Me.dsctxt = .Fields("Description")
            Me.qtytxt = .Fields("Qty_InStock")
            Me.qtysotxt = .Fields("Qty_Sold")
            Me.pricetxt = .Fields("Price")
            
            'store UPC in Tag in case upc is modified
            Me.upctxt.Tag = .Fields("UPC")
            
            'Change ADD button to UPDATE
            Me.addCmd.Caption = "UPDATE"
            
            'disable EDIT button while updating data
            Me.editCmd.Enabled = False
        End With
    End If
End Sub
