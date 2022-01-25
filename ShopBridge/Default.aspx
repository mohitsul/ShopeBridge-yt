<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ShopBridge.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 557px;
        }

        .auto-style6 {
            width: 86px;
        }

        .auto-style7 {
            width: 557px;
            height: 26px;
        }

        .auto-style8 {
            width: 86px;
            height: 26px;
        }

        .auto-style10 {
            width: 557px;
            height: 33px;
        }

        .auto-style11 {
            width: 86px;
            height: 33px;
        }

        .auto-style13 {
            height: 33px;
        }

        .auto-style14 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="font-size: x-large" align="center">ShopBridge Inventory..</div>
        <br />
        <asp:HiddenField ID="HdId" runat="server" />
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">Name</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Font-Size="Medium" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style10"></td>
                <td class="auto-style11">Decription</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TextBox2" runat="server" Font-Size="Medium" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">Price</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Font-Size="Medium" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td class="auto-style8"></td>
                <td class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" BackColor="#CC33FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" Text="save" OnClick="btnSave_Click" />
                    &nbsp;
                    <asp:Button ID="Clear" runat="server" BackColor="#CC33FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="Clear_Click" Text="Clear" />&nbsp;
                    <asp:Button ID="btnDelete" runat="server" BackColor="#CC33FF" Font-Bold="True" Font-Size="Medium" ForeColor="White" OnClick="btnDelete_Click" Text="Delete" />
                </td>
            </tr>
            <%--  <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblSuccess" runat="server" ForeColor="#33CC33"></asp:Label>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>--%>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td></td>
            </tr>
        </table>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="gvShopeBridge" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" AutoGenerateColumns="false" AllowPaging="true"
            OnPageIndexChanging="OnPageIndexChanging" PageSize="10" HorizontalAlign="Center">
            <Columns>
                <%--<asp:BoundField DataField="id" HeaderText="id" />--%>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Descriptions" HeaderText="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lkView" runat="server" CommandArgument='<% # Eval("id")%>' OnClick="lnk_View">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" BorderStyle="Solid" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" BorderStyle="Solid" ForeColor="Black" HorizontalAlign="Right" VerticalAlign="Middle" />
            <RowStyle BackColor="#DEDFDE" BorderStyle="Solid" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
    </form>
</body>
</html>
