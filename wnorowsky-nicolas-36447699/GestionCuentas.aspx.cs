using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wnorowsky_nicolas_36447699
{
    public partial class GestionCuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string addUser = $"insert into Cuentas(descripcion) values ('{TextBoxDescripcion.Text}')";
            SqlCommand sqlCommand = new SqlCommand(addUser, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            DropDownList1.DataBind();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {

            string descripcion = TextBoxDescripcion.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string updateUser = $"UPDATE Cuentas SET descripcion = '{descripcion}' WHERE id = '{DropDownList1.SelectedValue}'";
            SqlCommand sqlCommand = new SqlCommand(updateUser, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            DropDownList1.DataBind();
            sqlConnection.Close();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            string cuenta = DropDownList1.SelectedValue.ToString();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string deleteCuenta = $"delete from Cuentas where id = '{cuenta}'";
            SqlCommand sqlCommand = new SqlCommand(deleteCuenta, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            DropDownList1.DataBind();

            sqlConnection.Close();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = DropDownList1.SelectedValue.ToString();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string selectUserById = $"select descripcion from Cuentas where id = '{id}'";
            SqlCommand sqlCommand = new SqlCommand(selectUserById, sqlConnection);
            SqlDataReader cuenta = sqlCommand.ExecuteReader();

            if (cuenta.Read())
            {
                TextBoxDescripcion.Text = cuenta["descripcion"].ToString();
            }
            sqlConnection.Close();
        }
    }
}