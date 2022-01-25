using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopBridge
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection("Data Source=DESKTOP-IRFQ2A8\\SQLEXPRESS;Initial Catalog=Test_DB;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindGrid();
                btnDelete.Enabled = false;
                FillGridView();

            }
        }


        public void clearall()
        {
            HdId.Value = "";
            TextBox1.Text = TextBox2.Text = TextBox3.Text = " ";
            //  lblSuccess.Text = lblError.Text = " ";

            btnSave.Text = "Save";
            btnDelete.Enabled = false;
        }
        protected void Clear_Click(object sender, EventArgs e)
        {
            clearall();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("DeleteShopeBridge", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ID", Convert.ToInt32(HdId.Value));
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            clearall();
            FillGridView();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Deleted the Record..');", true);
            // lblSuccess.Text = "Record Deleted Successfully";


        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // btnDelete.Visible = false;
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand cmd = new SqlCommand("InsertUpdateShopeBridge", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ID", (HdId.Value == "" ? 0 : Convert.ToInt32(HdId.Value)));
            cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", TextBox2.Text.Trim());
            cmd.Parameters.AddWithValue("@Price", TextBox3.Text.Trim());
            cmd.ExecuteNonQuery();

            sqlCon.Close();
            string id = HdId.Value;
            clearall();
            if (id == "")
                // lblSuccess.Text = "Saved Successfully...";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully save the Record..');", true);
            else
                // lblSuccess.Text = "Updated Succesfully...";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Successfully Updated the Record..');", true);
            FillGridView();

        }

        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("AllShopeBridge", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            sqlCon.Close();
            gvShopeBridge.DataSource = dt;
            gvShopeBridge.DataBind();
        }

        protected void lnk_View(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@id", id);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            sqlCon.Close();
            HdId.Value = id.ToString();
            TextBox1.Text = dt.Rows[0]["Name"].ToString();
            TextBox2.Text = dt.Rows[0]["Descriptions"].ToString();
            TextBox3.Text = dt.Rows[0]["Price"].ToString();
            btnSave.Text = "Update";
            btnDelete.Enabled = true;
        }

        private void BindGrid()
        {
            // string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //using (SqlConnection con = new SqlConnection(sqlCon))
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM ShopeBridge"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = sqlCon;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvShopeBridge.DataSource = dt;
                            gvShopeBridge.DataBind();
                        }
                    }
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvShopeBridge.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}