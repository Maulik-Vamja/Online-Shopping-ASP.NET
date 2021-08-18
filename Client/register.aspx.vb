Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class register
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub btnregister_Click(sender As Object, e As System.EventArgs) Handles btnregister.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            Dim rdbgen As String
            If rdbmale.Checked = True Then
                rdbgen = "Male"
            Else
                rdbgen = "Female"
            End If
            If chkagree.Checked = True Then
                strqur = "insert into tbluser(fname,username,email,gender,phno,pass,usertype) values('" & txtfirstnm.Text & "','" & txtusername.Text & "','" & txtemail.Text & "','" & rdbgen & "','" & txtphonenum.Text & "','" & txtpwd.Text & "','0')"
                cmd = New SqlCommand(strqur, cnn)
                cmd.ExecuteNonQuery()
            Else
                lblagree.Visible = True
                lblagree.Text = "*"
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        Response.Redirect("login.aspx", False)
    End Sub
End Class
