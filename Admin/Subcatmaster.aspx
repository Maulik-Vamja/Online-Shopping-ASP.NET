<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="Subcatmaster.aspx.vb" Inherits="Admin_Subcatmaster" %>

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
        
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 612px;
        }
        .frm
        {
            padding:30px;
        }
        .btns
        {
            padding:8px 30px;
        }
    </style>
</head>

   <div id="linkarea" runat ="server" visible ="true" >
    
        <asp:LinkButton ID="btnlink" runat="server" style="margin-bottom:20px;" 
            CssClass="btn btn-primary" CausesValidation="False">Add New Record</asp:LinkButton>
    
    </div>
    
    <div id="inputarea" runat ="server" visible ="false">
    
        <table class="style1 table">
            <tr>
                <td colspan="2" style="text-align: center" class="bg-primary">
                    <strong>INSERT SUB CATEGORY</strong></td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" Text="Category Name"></asp:Label>
                </td>
                <td class="text-left">
                    <div class="text-left">
&nbsp;<asp:DropDownList ID="dblcatname" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="catname" 
                        DataValueField="catname" Width="200px" style="border:1px solid gray;">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT [catname] FROM [tblcategory]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="style2">
                    <strong>Sub Category Name</strong></td>
                <td>
                    <asp:TextBox ID="txtsubcatname" runat="server"></asp:TextBox>
                    <asp:Label ID="lblsubcid" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="style2">
                    <strong>Image</strong></td>
                <td>
                   <div class="custom-file">
                            <asp:FileUpload ID="imgupload" runat="server" Width="327px"/>

                    </div>
                </td>
            </tr>
            <tr>
                <td style="text-align: center" class="style2">
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chckactive" runat="server" style="text-align: center" 
                        Text="Isactive"  />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-primary btns" />
&nbsp;
                    <asp:Button ID="btnreset" runat="server" CausesValidation="False" 
                        Text="Reset" CssClass="btn btn-primary btns" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>

    <div id="displayarea" runat ="server" visible ="true">
    
        <asp:Label ID="lblmessage" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            Width="100%" CssClass="text-center bg-success" CaptionAlign="Bottom" 
            HorizontalAlign="Center" CellPadding="4" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="subcatid" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="subcatid" runat="server" Text='<%# Eval("subcatid") %>'></asp:Label>
                    </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="image">
                    <ItemTemplate>
                        <img alt="" src="../Image/subcatogary/<%# Eval("subcatid") %>.jpg"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="subcatname">
                    <ItemTemplate>
                        <asp:Label ID="subcatname" runat="server" Text='<%# Eval("subcatname") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsActive">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("isactive") %>' 
                            Enabled="False" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="create by">
                    <ItemTemplate>
                        <asp:Label ID="crtby" runat="server" Text='<%# Eval("crtby") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="create date">
                    <ItemTemplate>
                        <asp:Label ID="crtdate" runat="server" Text='<%# Eval("crtdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="alter by">
                    <ItemTemplate>
                        <asp:Label ID="altby" runat="server" Text='<%# Eval("altby") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="alter date">
                    <ItemTemplate>
                        <asp:Label ID="altdate" runat="server" Text='<%# Eval("altdate") %>'></asp:Label>
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

