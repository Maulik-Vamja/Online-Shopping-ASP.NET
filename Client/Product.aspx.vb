Imports System.Data.SqlClient
Imports System.Data
Imports System.IO

Partial Class Client_Product
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim dt As DataTable
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub DropDownList1_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.TextChanged
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            'strqur = "select subcatname from tblcatsubmaster where catid = "&&""
            strqur = "select s.subcatname,s.subcatid from tblcatsubmaster s,tblcategory c where s.catid=c.catid and c.catid='" & DropDownList1.SelectedItem.Value & "'"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblcatsubmaster")
            DropDownList2.DataSource = ds.Tables("tblcatsubmaster")
            DropDownList2.DataTextField = "subcatname"
            DropDownList2.DataValueField = "subcatid"
            DropDownList2.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnsearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsearch.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strqur = "select * from tblproductmaster where proid='" & DropDownList2.SelectedItem.Value & "'"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblproductmaster")
            DataList1.DataSource = ds.Tables("tblproductmaster")
            DataList1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("~/Client/login.aspx", False)
        End If
        If IsPostBack = False Then
            DropDownList2.Items.Clear()
            DropDownList2.Items.Add("Select SubCategory")
            filllist()
        End If
    End Sub
    Sub filllist()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strqur = "select * from tblproductmaster"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblproductmaster")
            DataList1.DataSource = ds.Tables("tblproductmaster")
            DataList1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
