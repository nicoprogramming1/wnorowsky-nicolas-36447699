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
            GridViewCuentas.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {

            /*
            int result = SqlDataSourceCuentasCRUD.Insert();
            if (result > 0)
            {
                LabelResult.Text = $"Se insertaron {result} registro/s";
                GridViewCuentas.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se insertaron registros";
            }
            TextBoxDescripcion.Text = string.Empty;
            */

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string addUser = $"insert into Cuentas(descripcion) values ('{TextBoxDescripcion.Text}')";
            SqlCommand sqlCommand = new SqlCommand(addUser, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            sqlConnection.Close();
            
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            /*
            int result = SqlDataSourceCuentasCRUD.Update();
            if (result > 0)
            {
                LabelResult.Text = $"Se modificaron {result} registro/s";
                GridViewCuentas.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se modificaron registros";
            }
            TextBoxDescripcion.Text = string.Empty;
            */

            string descripcion = TextBoxDescripcion.Text;

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["cadena"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            sqlConnection.Open();
            string updateUser = $"UPDATE Cuentas SET descripcion = '{descripcion}' WHERE id = '{id}'";
            SqlCommand sqlCommand = new SqlCommand(updateUser, sqlConnection);
            sqlCommand.ExecuteNonQuery();
            DropDownList1.DataBind();
            sqlConnection.Close();
        }

        protected void GridViewCuentas_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxDescripcion.Text = GridViewCuentas.SelectedRow.Cells[1].Text;
        }
    }
}