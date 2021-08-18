Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Admin_Addtocart
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim strquery As String = ""
    Dim constring As String = ConfigurationManager.ConnectionStrings("ConnectionString").ToString()
    Dim pid As Integer
    Dim price As Integer
    Dim pname As String
    Dim qty As String = 1
    Dim total As Double
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("~/Client/login.aspx", False)
        End If
        If IsPostBack = False Then
            pid = Request.QueryString("id")
            'lbluname.Text = Session("username")
            pdata()
            addcart()
            grandtotal()
        Else
            fill()
        End If
    End Sub
    Sub pdata()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strquery = "select * from tblproductmaster where proid=@id"
            cmd = New SqlCommand(strquery, cnn)
            cmd.Parameters.AddWithValue("@id", pid)
            Dim dr As SqlDataReader
            dr = cmd.ExecuteReader()
            dr.Read()
            pname = dr("proname")
            price = dr("price")
            cnn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Sub addcart()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strquery = "select * from tbladdtocart where name='" & pname & "'"
            Dim cmd1 As New SqlCommand(strquery, cnn)
            Dim i As Integer = cmd1.ExecuteScalar
            If i > 0 Then
                strquery = "update tbladdtocart set qty=qty+1 where name='" & pname & "'"
                Dim cmd2 As New SqlCommand(strquery, cnn)
                cmd2.ExecuteNonQuery()
                strquery = "update tbladdtocart set tprice=qty*price where name='" & pname & "'"
                Dim cmd3 As New SqlCommand(strquery, cnn)
                cmd3.ExecuteNonQuery()
            Else
                total = price * qty
                strquery = "insert into tbladdtocart(name,price,qty,tprice)values('" & pname & "','" & price & "','" & qty & "','" & total & "')"
                cmd = New SqlCommand(strquery, cnn)
                cmd.ExecuteNonQuery()
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Sub grandtotal()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strquery = "select * from tbladdtocart"
            cmd = New SqlCommand(strquery, cnn)
            Dim item As Integer = cmd.ExecuteScalar
            strquery = "select sum(tprice) from tbladdtocart"
            Dim cmd2 As New SqlCommand(strquery, cnn)
            If item > 0 Then
                Dim did As Object
                did = cmd2.ExecuteScalar
                lbltotal.Text = did
            Else
                lbltotal.Text = "0"
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        edit()
    End Sub
    Sub edit()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strquery = "delete * from tbladdtocart where name='" & pname & "'"
            cmd = New SqlCommand(strquery, cnn)
            cmd.ExecuteNonQuery()
            MsgBox("Your item is deleted")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Sub fill()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strquery = "select * from tbladdtocart"
            cmd = New SqlCommand(strquery, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tbladdtocart")
            GridView1.DataSource = ds.Tables("tbladdtocart")
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
