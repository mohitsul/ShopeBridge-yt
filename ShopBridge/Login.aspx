<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShopBridge.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .newStyle1 {
            text-decoration: underline;
            font-size: x-large;
        }

        .auto-style1 {
            text-align: center;
            color: #CC33FF;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            text-align: right;
            width: 666px;
        }

        .auto-style4 {
            width: 666px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">

            <strong class="newStyle1">ShopeBridge Admin Login<br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </strong>

        </div>
        <table class="auto-style2">
            <tr>
                <td class="auto-style3">UserName</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UsName" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please Enter UserName" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Password</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Pass" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text="Incorrect User Credentials"></asp:Label>
                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="btn_Login" runat="server" OnClick="btn_Login_Click" Text="Login" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
