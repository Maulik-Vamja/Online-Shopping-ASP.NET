
Partial Class Admin_AdminMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub btncart_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btncart.Click
        Response.Redirect("~/Client/Addtocart.aspx", False)
    End Sub
End Class

