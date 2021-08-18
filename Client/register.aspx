<%@ Page Title="" Language="VB" MasterPageFile="~/Client/ClientMasterPage.master"  AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid ">
					<div class="heading"><h2>New User ? Create An Account.</h2></div>
					<form name="form2" id="ff2" method="post" action="register.php">
						<div class="form-group">
							<asp:TextBox ID="txtfirstnm" runat="server" CssClass="form-control" placeholder="Enter Your Firstname"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtfirstnm" ErrorMessage="Enter Your Name" ForeColor="Red" 
                                SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </div>
						<div class="form-group">
							<asp:TextBox ID="txtusername" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Username"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtusername" ErrorMessage="Enter Your Username" 
                                ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtemail" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Email" TextMode="Email"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtphonenum" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Phone Number" MaxLength="10"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:RadioButton ID="rdbmale" runat="server" Text="Male" GroupName="gender" />
&nbsp;&nbsp;
                            <asp:RadioButton ID="rdbfemale" runat="server" Text="Female" 
                                GroupName="gender" />
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtpwd" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Password" TextMode="Password"></asp:TextBox>
						    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtpwd" ErrorMessage="Enter Your Password " ForeColor="Red" 
                                SetFocusOnError="True">*</asp:RequiredFieldValidator>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtconpass" runat="server" CssClass="form-control" 
                                placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
						    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtpwd" ControlToValidate="txtconpass" 
                                ErrorMessage="Password is not match" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
						</div>
						<div class="form-group">
                        <asp:CheckBox ID="chkagree" runat="server" Text="I agree your Terms &amp; Conditions" />
                            
						    <asp:Label ID="lblagree" runat="server" Text="Label" Visible="False" 
                                ForeColor="Red"></asp:Label>
                            
						</div>
						<asp:Button ID="btnregister" runat="server" Text="Create Account" CssClass="btn" style="background-color: black; color: white;"/>
						<br/>
						<br/>
					    <asp:HyperLink ID="loginlink" runat="server" 
                            CssClass="registerlink text-danger" NavigateUrl="~/Client/login.aspx">Already User? Login Here</asp:HyperLink>
					</form>
				</div>
</asp:Content>

