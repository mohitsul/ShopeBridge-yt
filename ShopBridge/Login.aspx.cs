using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ShopBridge
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection("Data Source=DESKTOP-IRFQ2A8\\SQLEXPRESS;Initial Catalog=Test_DB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMsg.Visible = false;

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            sqlCon.Open();
            string query = "SELECT COUNT(1) FROM Login WHERE UserName=@UserName AND Password=@Password";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
            int Count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            sqlCon.Close();

            if (Count == 1)
            {
                Session["UserName"] = txtUserName.Text.Trim();
                Response.Redirect("Default.aspx");
            }
            else
            {

                lblErrorMsg.Visible = true;

            }
        }
    }
}