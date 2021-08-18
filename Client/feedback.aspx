<%@ Page Title="" Language="VB" MasterPageFile="~/Client/ClientMasterPage.master"  AutoEventWireup="false" CodeFile="feedback.aspx.vb" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h1>CONTACT | FEEDBACK</h1></div>
				</div>
				<div class="col-md-12" style="margin-bottom: 30px;">
					<form name="form1" id="ff">
						<div class="form-group">
							<asp:TextBox ID="txtnm" runat="server" CssClass="form-control" placeholder="Enter Your Name*"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtemail" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Email*" TextMode="Email"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtphonenum" runat="server" CssClass="form-control" 
                                placeholder="Enter Your Phone Number*" TextMode="Number"></asp:TextBox>
						</div>
						<div class="form-group">
							<asp:TextBox ID="txtmsg" runat="server" CssClass="form-control" 
                                placeholder="Your Message*" TextMode="MultiLine"></asp:TextBox>
						</div>
                          <asp:Button ID="btnsendmsg" runat="server" Text="Send Message" CssClass="btn btn-1"/>
						
					</form>
				  
				</div>
			</div>
		</div>
	</div>
</asp:Content>

