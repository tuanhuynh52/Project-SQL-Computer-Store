VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Form_ShoppingcartForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Compare Database

Private Sub addCmd_Click()
    If Me.Txtord.Tag & "" = "" Then
        CurrentDb.Execute "INSERT INTO SHOPPINGCART(CustomerID, UPC, OrderNumber, Item_Price, Quantity) " & _
        "VALUES (" & Me.cbocusid & ",'" & Me.cboupc & "','" & Me.Txtord & "','" & _
        Me.Txtprice & "','" & Me.cboqty & "')"
        
    Else
        CurrentDb.Execute "UPDATE SHOPPINGCART " & _
            " SET CustomerID=" & Me.cbocusid & _
            ", UPC='" & Me.cboupc & "'" & _
            ", OrderNumber='" & Me.Txtord & "'" & _
            ", Item_Price='" & Me.Txtprice & "'" & _
            ", Quantity='" & Me.cboqty & "'" & _
            " WHERE OrderNumber =" & Me.Txtord.Tag
    End If
    
    clrCmd_Click
    Me.ShoppingcartsubForm.Form.Requery
    
    
End Sub

Private Sub closeCmd_Click()
    'quit the form
    DoCmd.Close
    
End Sub

Private Sub clrCmd_Click()
    'clear the form
    Me.cbocusid = ""
    Me.cboupc = ""
    Me.Txtord = ""
    Me.Txtprice = ""
    Me.cboqty = ""
    
    Me.cbocusid.SetFocus
    
    Me.editCmd.Enabled = True
    Me.addCmd.Caption = "ADD"
    Me.Txtord.Tag = ""
    
End Sub

Private Sub delCmd_Click()
    If Not (Me.ShoppingcartsubForm.Form.Recordset.EOF And Me.ShoppingcartsubForm.Form.Recordset.BOF) Then
        If MsgBox("Do you want to delete this record?", vbYesNo) = vbYes Then
            CurrentDb.Execute "DELETE FROM SHOPPINGCART " & _
            " WHERE OrderNumber=" & Me.ShoppingcartsubForm.Form.Recordset.Fields("OrderNumber") & _
            "  and CustomerID=" & Me.ShoppingcartsubForm.Form.Recordset.Fields("CustomerID") & _
            " and UPC=" & Me.ShoppingcartsubForm.Form.Recordset.Fields("UPC")
            
            Me.ShoppingcartsubForm.Form.Requery
        End If
    End If
End Sub

Private Sub editCmd_Click()
    'check data
    If Not (Me.ShoppingcartsubForm.Form.Recordset.EOF And Me.ShoppingcartsubForm.Form.Recordset.BOF) Then
        With Me.ShoppingcartsubForm.Form.Recordset
            Me.cbocusid = .Fields("CustomerID")
            Me.cboupc = .Fields("UPC")
            Me.Txtord = .Fields("OrderNumber")
            Me.Txtprice = .Fields("Item_Price")
            Me.cboqty = .Fields("Quantity")
            
            Me.Txtord.Tag = .Fields("OrderNumber")
            Me.addCmd.Caption = "UPDATE"
            Me.editCmd.Enabled = False
            
        End With
    End If
End Sub

Private Sub Txtext_Click()
    Me.Txtext.Enabled = False
End Sub
