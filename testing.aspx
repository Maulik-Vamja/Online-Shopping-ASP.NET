<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testing.aspx.vb" Inherits="testing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grvtest" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="proid" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="proid" HeaderText="proid" InsertVisible="False" 
                    ReadOnly="True" SortExpression="proid" />
                <asp:BoundField DataField="catid" HeaderText="catid" 
                    SortExpression="catid" />
                <asp:BoundField DataField="subcatid" HeaderText="subcatid" 
                    SortExpression="subcatid" />
                <asp:BoundField DataField="proname" HeaderText="proname" 
                    SortExpression="proname" />
                <asp:CheckBoxField DataField="isactive" HeaderText="isactive" 
                    SortExpression="isactive" />
                <asp:BoundField DataField="crtby" HeaderText="crtby" SortExpression="crtby" />
                <asp:BoundField DataField="crtdate" HeaderText="crtdate" 
                    SortExpression="crtdate" />
                <asp:BoundField DataField="altby" HeaderText="altby" SortExpression="altby" />
                <asp:BoundField DataField="altdate" HeaderText="altdate" 
                    SortExpression="altdate" />
            </Columns>
        </asp:GridView>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [tblproductmaster]" 
            ConflictDetection="CompareAllValues" 
            DeleteCommand="DELETE FROM [tblproductmaster] WHERE [proid] = @original_proid AND [catid] = @original_catid AND [subcatid] = @original_subcatid AND (([proname] = @original_proname) OR ([proname] IS NULL AND @original_proname IS NULL)) AND (([isactive] = @original_isactive) OR ([isactive] IS NULL AND @original_isactive IS NULL)) AND (([crtby] = @original_crtby) OR ([crtby] IS NULL AND @original_crtby IS NULL)) AND (([crtdate] = @original_crtdate) OR ([crtdate] IS NULL AND @original_crtdate IS NULL)) AND (([altby] = @original_altby) OR ([altby] IS NULL AND @original_altby IS NULL)) AND (([altdate] = @original_altdate) OR ([altdate] IS NULL AND @original_altdate IS NULL))" 
            InsertCommand="INSERT INTO [tblproductmaster] ([catid], [subcatid], [proname], [isactive], [crtby], [crtdate], [altby], [altdate]) VALUES (@catid, @subcatid, @proname, @isactive, @crtby, @crtdate, @altby, @altdate)" 
            OldValuesParameterFormatString="original_{0}" 
            UpdateCommand="UPDATE [tblproductmaster] SET [catid] = @catid, [subcatid] = @subcatid, [proname] = @proname, [isactive] = @isactive, [crtby] = @crtby, [crtdate] = @crtdate, [altby] = @altby, [altdate] = @altdate WHERE [proid] = @original_proid AND [catid] = @original_catid AND [subcatid] = @original_subcatid AND (([proname] = @original_proname) OR ([proname] IS NULL AND @original_proname IS NULL)) AND (([isactive] = @original_isactive) OR ([isactive] IS NULL AND @original_isactive IS NULL)) AND (([crtby] = @original_crtby) OR ([crtby] IS NULL AND @original_crtby IS NULL)) AND (([crtdate] = @original_crtdate) OR ([crtdate] IS NULL AND @original_crtdate IS NULL)) AND (([altby] = @original_altby) OR ([altby] IS NULL AND @original_altby IS NULL)) AND (([altdate] = @original_altdate) OR ([altdate] IS NULL AND @original_altdate IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_proid" Type="Int32" />
                <asp:Parameter Name="original_catid" Type="Int32" />
                <asp:Parameter Name="original_subcatid" Type="Int32" />
                <asp:Parameter Name="original_proname" Type="String" />
                <asp:Parameter Name="original_isactive" Type="Boolean" />
                <asp:Parameter Name="original_crtby" Type="String" />
                <asp:Parameter DbType="Date" Name="original_crtdate" />
                <asp:Parameter Name="original_altby" Type="String" />
                <asp:Parameter DbType="Date" Name="original_altdate" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="catid" Type="Int32" />
                <asp:Parameter Name="subcatid" Type="Int32" />
                <asp:Parameter Name="proname" Type="String" />
                <asp:Parameter Name="isactive" Type="Boolean" />
                <asp:Parameter Name="crtby" Type="String" />
                <asp:Parameter DbType="Date" Name="crtdate" />
                <asp:Parameter Name="altby" Type="String" />
                <asp:Parameter DbType="Date" Name="altdate" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="catid" Type="Int32" />
                <asp:Parameter Name="subcatid" Type="Int32" />
                <asp:Parameter Name="proname" Type="String" />
                <asp:Parameter Name="isactive" Type="Boolean" />
                <asp:Parameter Name="crtby" Type="String" />
                <asp:Parameter DbType="Date" Name="crtdate" />
                <asp:Parameter Name="altby" Type="String" />
                <asp:Parameter DbType="Date" Name="altdate" />
                <asp:Parameter Name="original_proid" Type="Int32" />
                <asp:Parameter Name="original_catid" Type="Int32" />
                <asp:Parameter Name="original_subcatid" Type="Int32" />
                <asp:Parameter Name="original_proname" Type="String" />
                <asp:Parameter Name="original_isactive" Type="Boolean" />
                <asp:Parameter Name="original_crtby" Type="String" />
                <asp:Parameter DbType="Date" Name="original_crtdate" />
                <asp:Parameter Name="original_altby" Type="String" />
                <asp:Parameter DbType="Date" Name="original_altdate" />
            </UpdateParameters>
        </asp:SqlDataSource>
       
    </div>
    </form>
</body>
</html>
