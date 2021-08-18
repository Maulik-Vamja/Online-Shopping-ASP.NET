Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Partial Class Admin_ProductMaster
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim dt As DataTable
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub linkbtn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkbtn.Click
        inputarea.Visible = True
        displayarea.Visible = False
        linkbtn.Visible = False
    End Sub
    Protected Sub ddlcat_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlcat.SelectedIndexChanged
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            'strqur = "select subcatname from tblcatsubmaster where catid = "&&""
            strqur = "select s.subcatname,s.subcatid from tblcatsubmaster s,tblcategory c where s.catid=c.catid and c.catname='" & ddlcat.SelectedItem.ToString() & "'"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblcatsubmaster")
            ddlsubcat.DataSource = ds.Tables("tblcatsubmaster")
            ddlsubcat.DataTextField = "subcatname"
            ddlsubcat.DataValueField = "subcatid"
            ddlsubcat.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            ddlsubcat.Items.Clear()
            ddlsubcat.Items.Add("Select SubCategory")
            fillgrid()
            If Session("username") = "" Then
                Response.Redirect("~/Client/login.aspx", False)
            End If
        End If
    End Sub

    Protected Sub btnsubmit_Click(sender As Object, e As System.EventArgs) Handles btnsubmit.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            Dim isactive As Boolean
            If chkisactive.Checked Then
                isactive = True
            Else
                isactive = False
            End If

            Dim str As String
            strqur = "select catid from tblcategory where catname='" & ddlcat.SelectedItem.Value & "'; select scope_identity()"
            cmd = New SqlCommand(strqur, cnn)
            str = cmd.ExecuteScalar()
            Dim str1 As String
            strqur = "select subcatid from tblcatsubmaster where subcatname='" & ddlsubcat.SelectedItem.Value & "'; select scope_identity()"
            cmd = New SqlCommand(strqur, cnn)
            str1 = cmd.ExecuteScalar()

            If btnsubmit.Text = "Submit" Then
                strqur = "select * from tblproductmaster where proname ='" & txtname.Text & "'"
                cmd = New SqlCommand(strqur, cnn)
                Dim pid As Integer = cmd.ExecuteScalar()

                If pid > 0 Then
                    lblmessage.Visible = True
                    lblmessage.Text = "record already exists"
                Else
                    strqur = "insert into tblproductmaster(catid,subcatid,proname,isactive,crtby,price) values('" & str & "','" & str1 & "','" & txtname.Text & "','" & isactive & "','Admin','" & txtprice.Text & "') ;select scope_identity()"
                    cmd = New SqlCommand(strqur, cnn)
                    'code for img insert
                    Dim imgid As Integer = cmd.ExecuteScalar()
                    Dim stri As String
                    stri = Server.MapPath("~/Image/Products")
                    If FileUpload1.HasFile = True Then
                        stri = stri & "/" & imgid & ".jpg"
                        FileUpload1.SaveAs(stri)
                        lblmessage.Visible = True
                        lblmessage.Text = "File has be successfully uploaded at " & stri
                    Else
                        lblmessage.Visible = True
                        lblmessage.Text = "Error: file has not uploaded"
                    End If
                    lblmessage.Visible = True
                    lblmessage.Text = "record inserted successfully"
                End If
            Else
                strqur = "update tblproductmaster set catid='" & str & "',subcatid='" & str1 & "',proname = '" & txtname.Text & "',isactive='" & isactive & "',altby='Admin',altdate='" & Today.Date.ToString() & "',price='" & txtprice.Text & "' where proid = " & lblproid.Text & ""
                cmd = New SqlCommand(strqur, cnn)
                cmd.ExecuteNonQuery()

                'code file upload image in Iamge Folder
                Dim stri As String
                stri = Server.MapPath("~/Image/Products")
                If FileUpload1.HasFile = True Then
                    stri = stri & "/" & lblproid.Text & ".jpg"
                    FileUpload1.SaveAs(stri)
                    lblmessage.Visible = True
                    lblmessage.Text = "File has be successfully uploaded at " & stri
                Else
                    lblmessage.Visible = True
                    lblmessage.Text = "Error: file has not uploaded"
                End If
                lblmessage.Visible = True
                lblmessage.Text = "record updated successfully"
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        fillgrid()
        displayarea.Visible = True
        inputarea.Visible = False
    End Sub
    Sub fillgrid()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strqur = "select * from tblproductmaster"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblproductmaster")
            GridView1.DataSource = ds.Tables("tblproductmaster")
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            Dim lblproid, lblproname As New Label
            cnn = New SqlConnection(constring)
            cnn.Open()
            lblproid = GridView1.Rows(e.RowIndex).FindControl("lblgpid")
            lblproname = GridView1.Rows(e.RowIndex).FindControl("lblgpname")
            strqur = "delete from tblproductmaster where proid =" & lblproid.Text & ""
            cmd = New SqlCommand(strqur, cnn)
            cmd.ExecuteNonQuery()

            'code for delete image
            Dim fileexit As String = Server.MapPath("~\Admin\Image\Products\" & lblproid.Text & ".jpg")
            If (File.Exists(fileexit)) Then
                File.Delete(fileexit)
            End If
            lblmessage.Visible = True
            lblmessage.Text = "record deleted successfully"
            fillgrid()
            cnn.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub GridView1_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        Try
            Dim lblpid, lblproname As New Label
            lblpid = GridView1.Rows(e.NewEditIndex).FindControl("lblgpid")
            lblproname = GridView1.Rows(e.NewEditIndex).FindControl("lblgpname")
            btnsubmit.Text = "update"
            inputarea.Visible = True
            displayarea.Visible = False
            lblproid.Text = lblpid.Text
            txtname.Text = lblproname.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
