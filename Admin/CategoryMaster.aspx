<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="CategoryMaster.aspx.vb" Inherits="Admin_CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<head>
    <title>Royal Export</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css" />
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" />
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css" />
    <link rel="stylesheet" href="fonts/font-slider.css" type="text/css" />
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js" type="text/javascript"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <style type="text/css">
        #linkarea
        {
            text-align: center;
        }
        .style1
        {
            width: 100%;
        }
        .frm
        {
            padding:30px;
        }
        #displayarea
        {
        }
        .btns
        {
            padding:8px 30px;
        }
    </style>
</head>

    <div id="linkarea" runat="server" visible="true">
    
        <asp:LinkButton ID="btnlink" runat="server" 
            style="text-align: center; margin-bottom:26px;" CssClass="btn btn-primary" 
            CausesValidation="False">Add New Record</asp:LinkButton>
    
    </div>
    <div id= "inputarea" runat="server" visible="false">
    
        <table class="style1 table">
            <tr>
                <td colspan="2" style="text-align: center; font-weight:bold;" class="bg-primary">
                    INSERT CATEGORY ITEM</td>
            </tr>
            <tr>
                <td style="text-align: right; font-weight:bold;">
                    Catogary Name&nbsp; -
                </td>
                <td>
                    <asp:TextBox ID="txtcatogary" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblcid" runat="server" Text="catid"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; font-weight:bold;">
                    Category Image&nbsp; -
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right">
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chckactive" runat="server" />
&nbsp;Is Active</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary btns" />
&nbsp;<asp:Button ID="btnreset" runat="server" CausesValidation="False" Text="Reset" CssClass="btn btn-primary btns"/>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    
    </div>
    <div id= "displayarea" runat="server" visible="true">
    
                    <asp:Label ID="lblmessage" runat="server" Text="Label" Visible="false"></asp:Label>
    
                    <br />
                    <br />
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="catid" Width="100%" CssClass="text-center bg-success" CaptionAlign="Bottom" 
            HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="cat_id">
                    <ItemTemplate>
                        <asp:Label ID="lcatid" runat="server" Text='<%# Eval("catid") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <img alt="" src="Admin/Image/catogary/<%# Eval("catid") %>.jpg" width="100" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="cat_name">
                    <ItemTemplate>
                        <asp:Label ID="lcatname" runat="server" Text='<%# Eval("catname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" CommandName="edit" HeaderText="Edit" 
                    Text="Edit" ControlStyle-CssClass="btn btn-info" >
<ControlStyle CssClass="btn btn-info"></ControlStyle>
                </asp:ButtonField>
                <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="Delete" 
                    Text="Delete" ControlStyle-CssClass="btn btn-danger" >
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
                </asp:ButtonField>
                <asp:CheckBoxField DataField="isactive" HeaderText="Isactive" />
                <asp:TemplateField HeaderText="Create by">
                    <ItemTemplate>
                        <asp:Label ID="lcreateby" runat="server" Text='<%# Eval("createby") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Create Date">
                    <ItemTemplate>
                        <asp:Label ID="lcrdate" runat="server" Text='<%# Eval("crdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Alter by">
                    <ItemTemplate>
                        <asp:Label ID="laltby" runat="server" Text='<%# Eval("altby") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Alter date">
                    <ItemTemplate>
                        <asp:Label ID="laltdate" runat="server" Text='<%# Eval("altdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
    
     </div>
</asp:Content>

