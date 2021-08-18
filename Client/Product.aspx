<%@ Page Title="" Language="VB" MasterPageFile="~/Client/MasterPage.master" AutoEventWireup="false" CodeFile="Product.aspx.vb" Inherits="Client_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<style type = "text/css" >
    .css
    {
        border-radius:5px;
    }
    .style1
    {
        height: 9px;
    }
    .style2
    {
        height: 42px;
    }
</style>
    <table class="nav-justified">
        <tr>
            <td>
                Filter Your Product</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select Category:&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="catname" DataValueField="catid" 
                    Height="20px" Width="162px" CssClass = "bg-info css">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [catid], [catname] FROM [tblcategory]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Select SubCategory:&nbsp; <asp:DropDownList ID="DropDownList2" runat="server" 
                    Height="16px" Width="140px" CssClass ="bg-info css ">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnsearch" runat="server" CssClass="btn" Text="Search" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
<div style ="height:100%">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" 
        RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="nav-justified">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("proid") %>' 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <img alt="" src="" />
                    </td>
                </tr>
                <tr>
                    <td style="font-size: small" class="style2">
                        Product Name:<asp:Label ID="lblname" runat="server" 
                            Text='<%# Eval("proname") %>'></asp:Label>
                    </td>
                    <td class="style2">
                        Price:<asp:Label ID="Label1" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1" colspan="2" style="font-size: small">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="font-size: xx-small">
                        <a href ="Addtocart.aspx?id=<%# Eval("proid") %>"><asp:Label ID="lbladd" runat="server" CssClass="btn btn-2" Text="Add to Cart"></asp:Label></a>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [tblproductmaster]"></asp:SqlDataSource>
</div>
</asp:Content>

