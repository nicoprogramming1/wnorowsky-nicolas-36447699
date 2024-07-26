using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wnorowsky_nicolas_36447699
{
    public partial class GestionMovimientosContables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                GridViewMovimientos.DataBind();
            }
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceMovimientosCRUD.Insert();
            if (result > 0)
            {
                LabelResult.Text = $"Se insertaron {result} registro/s";
                GridViewMovimientos.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se insertaron registros";
            }
            TextBoxFecha.Text = string.Empty;
            TextBoxMonto.Text = string.Empty;
            TextBoxTipo.Text = string.Empty;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int result = SqlDataSourceMovimientosCRUD.Update();
            if (result > 0)
            {
                LabelResult.Text = $"Se modificaron {result} registro/s";
                GridViewMovimientos.DataBind();
            }
            else
            {
                LabelResult.Text = $"No se modificaron registros";
            }
            TextBoxFecha.Text = string.Empty;
            TextBoxMonto.Text = string.Empty;
            TextBoxTipo.Text = string.Empty;
        }

        protected void GridViewMovimientos_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxFecha.Text = DateTime.Parse(GridViewMovimientos.SelectedRow.Cells[1].Text).ToString("yyyy-MM-dd");
            TextBoxMonto.Text = GridViewMovimientos.SelectedRow.Cells[2].Text;
            TextBoxTipo.Text = GridViewMovimientos.SelectedRow.Cells[3].Text;
            DropDownListCuentas.SelectedValue = GridViewMovimientos.SelectedRow.Cells[4].Text;
        }

        protected void ButtonFilter_Click(object sender, EventArgs e)
        {
            SqlDataSourceMovimientosCRUD.FilterExpression = "idCuenta = " + DropDownListFiltro.SelectedValue;
            GridViewMovimientos.DataBind();
        }

        protected void ButtonUnfilter_Click(object sender, EventArgs e)
        {
            SqlDataSourceMovimientosCRUD.FilterExpression = string.Empty;
            SqlDataSourceMovimientosCRUD.FilterParameters.Clear();
            GridViewMovimientos.DataBind();
        }
    }
}