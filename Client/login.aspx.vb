Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class login
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim dt As DataTable
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub btnlogin_Click(sender As Object, e As System.EventArgs) Handles btnlogin.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            Dim cmd As New SqlCommand(strqur, cnn)
            strqur = "select * from tbluser where username='" & txtusernm.Text & "' and pass='" & txtpwd.Text & "' and usertype='1'"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            dt = New DataTable
            da.Fill(dt)
            If dt.Rows.Count.ToString() = 1 Then
                Response.Redirect("~/Admin/AdminHome.aspx", False)
            Else
                Response.Redirect("~/Client/Home.aspx", False)
            End If
            strqur = "select * from tbluser where username='" & txtusernm.Text & "' and pass='" & txtpwd.Text & "'"
                        Dim c As New HttpCookie("login")
            c("Username") = txtusernm.Text
            c("password") = txtpwd.Text
            Response.Cookies.Add(c)
            c.Expires = DateTime.Now.AddMinutes(10)
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
    End Sub
End Class
