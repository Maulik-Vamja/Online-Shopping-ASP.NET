Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Partial Class Admin_Subcatmaster
    Inherits System.Web.UI.Page
    Dim cnn As SqlConnection
    Dim cmd As SqlCommand
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim constring As String = ConfigurationManager.ConnectionStrings("connectionString").ToString
    Dim strqur As String

    Protected Sub btnsave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsave.Click
        Try

            cnn = New SqlConnection(constring)
            cnn.Open()
            Dim isactive As Boolean
            If chckactive.Checked Then
                isactive = True
            Else
                isactive = False
            End If

            Dim str As String
            strqur = "select catid from tblcategory where catname='" & dblcatname.SelectedItem.Value & "'; select scope_identity()"
            'strqur = "select c.catid from tblcategory c, tblcatsubmaster s where c.catid=s.catid and c.catname='" & dblcatname.SelectedItem.ToString & "'; select scope_identity()"
            cmd = New SqlCommand(strqur, cnn)
            ' Dim str As String = "select catid from tblcategoty where catname='" & dblcatname.SelectedItem.ToString & "'"
            str = cmd.ExecuteScalar()

            If btnsave.Text = "Save" Then
                strqur = "select * from tblcatsubmaster where subcatname ='" & txtsubcatname.Text & "'; select scope_identity()"
                cmd = New SqlCommand(strqur, cnn)
                Dim subcid As Integer = cmd.ExecuteScalar()

                If subcid > 0 Then
                    lblmessage.Visible = True
                    lblmessage.Text = "record already exists"
                Else
                    strqur = "insert into tblcatsubmaster(subcatname,catid,isactive,crtby) values('" & txtsubcatname.Text & "'," & str & ",'" & isactive & "','Admin'); select scope_identity()"
                    cmd = New SqlCommand(strqur, cnn)

                    'code for img insert
                    Dim imgid As Integer = cmd.ExecuteScalar()
                    Dim stri As String
                    stri = Server.MapPath("~/Image/subcatogary")
                    If imgupload.HasFile = True Then
                        stri = stri & "\" & imgid & ".jpg"
                        imgupload.SaveAs(stri)
                        lblmessage.Visible = True
                        lblmessage.Text = "File has be successfully uploaded at " & stri
                    Else
                        lblmessage.Visible = True
                        lblmessage.Text = "Error: file has not uploaded"
                    End If

                    lblmessage.Visible = True
                    lblmessage.Text = "record is inserted"

                End If
            Else
                strqur = "update tblcatsubmaster set subcatname = '" & txtsubcatname.Text & "',catid='" & str & "',isactive='" & isactive & "',altby='Admin',altdate='" & DateTime.Now & "' where subcatid= '" & lblsubcid.Text & "'"
                cmd = New SqlCommand(strqur, cnn)
                cmd.ExecuteNonQuery()

                'code file upload image in Iamge Folder
                Dim stri As String
                stri = Server.MapPath("~/Image/subcatogary")
                If imgupload.HasFile = True Then
                    stri = stri & "\" & lblsubcid.Text & ".jpg"
                    imgupload.SaveAs(stri)
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

    Protected Sub btnlink_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnlink.Click
        inputarea.Visible = True
        displayarea.Visible = False
        btnlink.Visible = False
    End Sub

    Sub fillgrid()
        Try
            cnn = New SqlConnection(constring)
            cnn.Open()
            strqur = "select * from tblcatsubmaster"
            cmd = New SqlCommand(strqur, cnn)
            da = New SqlDataAdapter(cmd)
            ds = New DataSet
            da.Fill(ds, "tblcatsubmaster")
            GridView1.DataSource = ds.Tables("tblcatsubmaster")
            GridView1.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack = False Then
            fillgrid()
        End If
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            Dim lblscatid, lblscatname, lblcatid As New Label
            cnn = New SqlConnection(constring)
            cnn.Open()
            lblscatid = GridView1.Rows(e.RowIndex).FindControl("subcatid")
            lblscatname = GridView1.Rows(e.RowIndex).FindControl("subcatname")
            lblcatid = GridView1.Rows(e.RowIndex).FindControl("scatid")
            strqur = "delete from tblcatsubmaster where subcatid =" & lblscatid.Text & ""
            cmd = New SqlCommand(strqur, cnn)
            cmd.ExecuteNonQuery()

            'code for delete image
            Dim fileexit As String = Server.MapPath("Admin\Image\subcatogary\" & lblscatid.Text & ".jpg")
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


    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        Try
            Dim lblscatid, lblscatname As New Label
            lblscatid = GridView1.Rows(e.NewEditIndex).FindControl("subcatid")
            lblscatname = GridView1.Rows(e.NewEditIndex).FindControl("subcatname")
            btnsave.Text = "update"
            inputarea.Visible = True
            displayarea.Visible = False
            lblsubcid.Text = lblscatid.Text
            txtsubcatname.Text = lblscatname.Text
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
