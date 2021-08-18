Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class feedback
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub btnsendmsg_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsendmsg.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strqur = "insert into tblfeedback(name,email,phno,feedback)values('" & txtnm.Text & "','" & txtemail.Text & "','" & txtphonenum.Text & "','" & txtmsg.Text & "')"
            cmd = New SqlCommand(strqur, cnn)
            cmd.ExecuteNonQuery()
            Response.Write("Thanks for giving Feedback")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("~/Client/login.aspx", False)
        End If
    End Sub
End Class
