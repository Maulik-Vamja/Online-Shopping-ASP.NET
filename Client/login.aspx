<%@ Page Title="" Language="VB" MasterPageFile="~/Client/ClientMasterPage.master"  AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="heading"><h2>Login</h2></div>
					<form name="form1" id="ff1" method="post" action="login.php">
						<div class="form-group">
							<asp:TextBox ID="txtusernm" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Username"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" placeholder="Enter Your Password"></asp:TextBox>
						</div>

						<asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="btn" style="background-color: black; color: white;"/>
						<br />
                        <br />
						<asp:HyperLink ID="loginlink" runat="server" CssClass="text-success">Forgot Your Password?</asp:HyperLink>
						<br/>
						<br/>
						<asp:HyperLink ID="HyperLink1" runat="server" 
                            CssClass="registerlink text-danger" NavigateUrl="~/Client/register.aspx">New User? Create An Account</asp:HyperLink>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</asp:Content>

