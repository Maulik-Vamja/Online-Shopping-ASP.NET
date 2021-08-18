<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="ProductMaster.aspx.vb" Inherits="Admin_ProductMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<head>
    <title>Royal Export</title>
    <link rel="stylesheet" href="~/css/bootstrap.min.css"  type="text/css" />
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="~/css/style.css" type="text/css" />
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="~/font-awesome/css/font-awesome.min.css"  type="text/css" />
    <link rel="stylesheet" href="~/fonts/font-slider.css" type="text/css" />
	
	<!-- jQuery and Modernizr-->
	<script src="~/js/jquery-2.1.1.js" type="text/javascript"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="~/js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        #linkarea
        {
            text-align: center;
        }
         .frm
        {
            padding:30px;
        }
         .btns
        {
            padding:8px 30px;
        }
        .style1
        {
            height: 56px;
        }
    </style>
</head>


 <div id="linkarea" runat="server" >
    
        <asp:LinkButton ID="linkbtn" runat="server" CausesValidation="False" style="text-align: center; margin-bottom:26px;" CssClass="btn btn-primary">Add new Record</asp:LinkButton>
    
    </div>

     <div id="inputarea" runat="server"  class="row" visible="false" >

     <div class="container"></div>
    
         <table class="style1 table">
             <tr>
                 <td class="style5" style="font-weight:bold;">
                     Select Category:</td>
                 <td class="style6">
                     <asp:DropDownList ID="ddlcat" runat="server" AutoPostBack="True" 
                         DataSourceID="SqlDataSource1" DataTextField="catname" 
                         DataValueField="catname" Height="29px" Width="152px" style="border:1px solid gray;">
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                         SelectCommand="SELECT [catname] FROM [tblcategory]"></asp:SqlDataSource>
                 </td>
             </tr>
             <tr>
                 <td class="style4" style="font-weight:bold;">
                     Select Sub-Category:</td>
                 <td class="style2">
                     <asp:DropDownList ID="ddlsubcat" runat="server" AutoPostBack="True" 
                         Height="29px" Width="150px" style="border:1px solid gray;">
                     </asp:DropDownList>
                 </td>
             </tr>
             <tr>
                 <td class="style3" style="font-weight:bold;">
                     Product Name:</td>
                 <td>
                     &nbsp;<asp:TextBox ID="txtname" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="lblproid" runat="server" Text="proid"></asp:Label>
                 </td>
             </tr>
             <tr>
                 <td class="style3" style="font-weight:bold;">
                     Product Image</td>
                 <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:FileUpload ID="FileUpload1" runat="server" CssClass="category" />
                 </td>
             </tr>
             <tr>
                 <td class="style3">Product Price</td>
                 <td>
                     <asp:TextBox ID="txtprice" runat="server" TextMode="Number"></asp:TextBox>
                 </td>
             </tr>
              <tr>
                 <td class="style3">
                     &nbsp;</td>
                 <td>
                     <asp:CheckBox ID="chkisactive" runat="server" Text="IsActive" />
                 </td>
             </tr>
             <tr>
                 <td class="style1">
                     </td>
                 <td class="style1">
                     <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary btns" />
                     <asp:Button ID="btnreset" runat="server" CausesValidation="False" 
                         Text="Cancel" CssClass="btn btn-primary btns" />
                 </td>
             </tr>
         </table>
    
    </div>
    
     <div id="displayarea" runat="server" >
    
         <asp:Label ID="lblmessage" runat="server"></asp:Label>
    
         <br />
         <br />
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
             Width="100%" CssClass="text-center bg-success" CaptionAlign="Bottom" 
            HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" 
             GridLines="None">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:TemplateField HeaderText="Product Id">
                     <ItemTemplate>
                         <asp:Label ID="lblgpid" runat="server" Text='<%# Eval("proid") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Images">
                     <ItemTemplate>
                         <img alt="" src="" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Product Name">
                     <ItemTemplate>
                         <asp:Label ID="lblgpname" runat="server" Text='<%# Eval("proname") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="In Stock">
                     <ItemTemplate>
                         <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("isactive") %>' 
                             Enabled="False" />
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Creat By">
                     <ItemTemplate>
                         <asp:Label ID="lblgcdby" runat="server" Text='<%# Eval("crtby") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Creat Date">
                     <ItemTemplate>
                         <asp:Label ID="lblgcdate" runat="server" Text='<%# Eval("crtdate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Alter By">
                     <ItemTemplate>
                         <asp:Label ID="lblgaltby" runat="server" Text='<%# Eval("altby") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Alter Date">
                     <ItemTemplate>
                         <asp:Label ID="lblgaltdate" runat="server" Text='<%# Eval("altdate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:ButtonField ButtonType="Button" CommandName="Edit" HeaderText="Edit" 
                     Text="Edit" ControlStyle-CssClass="btn btn-info">
<ControlStyle CssClass="btn btn-info"></ControlStyle>
                 </asp:ButtonField>
                 <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" 
                     Text="Delete" ControlStyle-CssClass="btn btn-danger">
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                 </asp:ButtonField>
             </Columns>
             <EditRowStyle BackColor="#2461BF" />
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#EFF3FB" />
             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F5F7FB" />
             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
             <SortedDescendingCellStyle BackColor="#E9EBEF" />
             <SortedDescendingHeaderStyle BackColor="#4870BE" />
         </asp:GridView>
         <br />
    
    </div>
</asp:Content>

