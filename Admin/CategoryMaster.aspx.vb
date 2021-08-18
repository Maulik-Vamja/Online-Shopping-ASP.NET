Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Admin_CategoryMaster
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String
    Protected Sub btnsave_Click(sender As Object, e As System.EventArgs) Handles btnsave.Click
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            Dim isactive As Boolean
            If chckactive.Checked Then
                isactive = True
            Else
                isactive = False
            End If

            If btnsave.Text = "Save" Then
                strqur = "select * from tblcategory where catname ='" & txtcatogary.Text & "'"
                cmd = New SqlCommand(strqur, cnn)
                Dim catid As Integer = cmd.ExecuteScalar()

                If catid > 0 Then
                    lblmessage.Visible = True
                    lblmessage.Text = "record already exists"
                Else
                    strqur = "insert into tblcategory(catname,isactive,createby) values('" & txtcatogary.Text & "','" & isactive & "','Admin') ;select scope_identity()"
                    cmd = New SqlCommand(strqur, cnn)


                    'code for img insert
                    Dim imgid As Integer = cmd.ExecuteScalar()
                    Dim str As String
                    str = Server.MapPath("Admin\Image\catogary")
                    If FileUpload1.HasFile = True Then
                        str = str & "\" & imgid & ".jpg"
                        FileUpload1.SaveAs(str)
                        lblmessage.Visible = True
                        lblmessage.Text = "File has be successfully uploaded at " & str
                    Else
                        lblmessage.Visible = True
                        lblmessage.Text = "Error: file has not uploaded"
                    End If
                End If
            Else
                strqur = "update tblcategory set catname = '" & txtcatogary.Text & "',isactive='" & isactive & "',altby='Admin',altdate='" & Today.Date.ToString() & "' where catid = " & lblcid.Text & ""
                cmd = New SqlCommand(strqur, cnn)
                cmd.ExecuteNonQuery()

                'code file upload image in Iamge Folder
                Dim str As String
                str = Server.MapPath("Admin\Image\catogary")
                If FileUpload1.HasFile = True Then
                    str = str & "\" & lblcid.Text & ".jpg"
                    FileUpload1.SaveAs(str)
                    lblmessage.Visible = True
                    lblmessage.Text = "File has be successfully uploaded at " & str
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
            strqur = "select * from tblcategory"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblcategory")
            GridView1.DataSource = ds.Tables("tblcategory")
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub btnlink_Click(sender As Object, e As System.EventArgs) Handles btnlink.Click
        displayarea.Visible = False
        inputarea.Visible = True
        btnlink.Visible = False
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            fillgrid()
        End If
    End Sub


    Protected Sub GridView1_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
    End Sub
    Protected Sub GridView1_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        Try
            Dim lblcatid, lblcatname As New Label
            lblcatid = GridView1.Rows(e.NewEditIndex).FindControl("lcatid")
            lblcatname = GridView1.Rows(e.NewEditIndex).FindControl("lcatname")
            btnsave.Text = "update"
            inputarea.Visible = True
            displayarea.Visible = False
            lblcid.Text = lblcatid.Text
            txtcatogary.Text = lblcatname.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
    Protected Sub GridView1_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            Dim lblcatid, lblcatname As New Label
            cnn = New SqlConnection(constring)
            cnn.Open()
            lblcatid = GridView1.Rows(e.RowIndex).FindControl("lcatid")
            lblcatname = GridView1.Rows(e.RowIndex).FindControl("lcatname")
            strqur = "delete from tblcategory where catid =" & lblcatid.Text & ""
            cmd = New SqlCommand(strqur, cnn)
            cmd.ExecuteNonQuery()

            'code for delete image
            Dim fileexit As String = Server.MapPath("Admin\Image\catogary\" & lblcatid.Text & ".jpg")
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
End Class
