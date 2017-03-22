VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_CustomerForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub addCmd_Click()
    If Me.cusIDtxt.Tag & "" = "" Then
        'add data to table
        CurrentDb.Execute "INSERT INTO CUSTOMER(CustomerID, FName, LName, Address, Email, Phone) " & _
        " VALUES (" & Me.cusIDtxt & ",'" & Me.fnametxt & "','" & Me.lnametxt & "','" & _
        Me.addresstxt & "','" & Me.emailtxt & "','" & Me.phonetxt & "')"
    
    Else
        'otherwise, Tag of customerID store the id of customer to be modified
        CurrentDb.Execute "UPDATE CUSTOMER " & _
                " SET CustomerID=" & Me.cusIDtxt & _
                ", FName='" & Me.fnametxt & "'" & _
                ", LName='" & Me.lnametxt & "'" & _
                ", Address='" & Me.addresstxt & "'" & _
                ", Email='" & Me.emailtxt & "'" & _
                ", Phone='" & Me.phonetxt & "'" & _
                " WHERE CustomerID=" & Me.cusIDtxt.Tag
 
    End If
    
    'clear form after insert
    clrCmd_Click
    'refresh the subform
    Customersubform.Form.Requery
    
End Sub

Private Sub clrCmd_Click()
    'clear form
    Me.cusIDtxt = ""
    Me.fnametxt = ""
    Me.lnametxt = ""
    Me.addresstxt = ""
    Me.emailtxt = ""
    Me.phonetxt = ""
    'set focus on Id text box
    Me.cusIDtxt.SetFocus
    'set EDIT button to enable
    Me.editCmd.Enabled = True
    'Change caption of add button to ADD
    Me.addCmd.Caption = "ADD"
    'clear tag on customerId for reset
    Me.cusIDtxt.Tag = ""
    
End Sub

Private Sub delCmd_Click()
    'Delete a record in table
    'check existing record
    'confirm delete
    If Me.cusIDtxt.Tag & "" = "" Or Not (Me.Customersubform.Form.Recordset.EOF And Me.Customersubform.Form.Recordset.BOF) Then
        If MsgBox("Do you want to delete?", vbYesNo) = vbYes Then
            'Delete row
            CurrentDb.Execute "DELETE FROM CUSTOMER " & _
            " WHERE CustomerID=" & Me.Customersubform.Form.Recordset.Fields("CustomerID")
            'refresh data in the table
            Me.Customersubform.Form.Requery
            
        End If
    End If
End Sub

Private Sub editCmd_Click()
    'check if exists data in the table
    If Not (Me.Customersubform.Form.Recordset.EOF And Me.Customersubform.Form.Recordset.BOF) Then
        'get data to text box control
        With Me.Customersubform.Form.Recordset
            Me.cusIDtxt = .Fields("CustomerID")
            Me.fnametxt = .Fields("FName")
            Me.lnametxt = .Fields("LName")
            Me.addresstxt = .Fields("Address")
            Me.emailtxt = .Fields("Email")
            Me.phonetxt = .Fields("Phone")
            
            'store customerId in TAg in case id is modified
            Me.cusIDtxt.Tag = .Fields("CustomerID")
            'Change the ADD button to UPDATE and disable EDIT button while updating
            Me.addCmd.Caption = "UPDATE"
            Me.editCmd.Enabled = False
       End With
    End If
End Sub

Private Sub exitCmd_Click()
    DoCmd.Close
End Sub

