using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using EntityLayer;
using BusinessLayer;
using System.Xml.Linq;

namespace PresentationLayer
{
    public partial class ProductView: UserControl
    {
        private readonly ProductService productService;

        private static ProductView instance;

        private ProductView()
        {
            InitializeComponent();

            productService = new ProductService();

            this.ProductView_Load(null, null);
        }

        public static ProductView GetInstance()
        {
            if (instance == null)
                instance = new ProductView();

            return instance;
        }

        private void ProductView_Load(object sender, EventArgs e)
        {
            LoadProducts();
        }

        private void LoadProducts()
        {
            List<ProductEntity> products = productService.GetAllProducts();
            dgvProducts.AutoGenerateColumns = true;
            dgvProducts.DataSource = products;

            dgvProducts.Columns["Description"].HeaderText = "Descripción";
            dgvProducts.Columns["Category"].HeaderText = "Categoría";
            dgvProducts.Columns["Price"].HeaderText = "Precio";
            dgvProducts.ReadOnly = true;
            dgvProducts.MultiSelect = false;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            txtCode.Text = "";
            txtDescription.Text = "";
            txtPrice.Text = "";
            txtCategory.Text = "";

            txtFindByCode.Text = "";
            txtFindByCategory.Text = "";

            txtCode.Focus();
        }

        private void dgvProducts_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvProducts.Rows[e.RowIndex];

                txtCode.Text = row.Cells["Id"].Value.ToString();
                txtDescription.Text = row.Cells["Description"].Value.ToString();
                txtCategory.Text = row.Cells["Category"].Value.ToString();
                txtPrice.Text = row.Cells["Price"].Value.ToString();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ProductEntity product = new ProductEntity
                {
                    Id = int.Parse(txtCode.Text),
                    Description = txtDescription.Text,
                    Category = txtCategory.Text,
                    Price = Convert.ToDecimal(txtPrice.Text),
                };

                if (product.Id == 0)
                {
                    productService.AddProduct(product);
                    ViewsHelper.ShowSuccessMessage("Producto agregado correctamente.", "Éxito");
                }
                else
                {
                    productService.UpdateProduct(product);
                    ViewsHelper.ShowSuccessMessage("Producto actualizado correctamente.", "Éxito");
                }
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
            finally
            {
                LoadProducts();
                btnNew_Click(sender, e);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = ViewsHelper.ShowQuestionMessage("¿Está seguro de querer eliminar este producto?",
                "Confirmar eliminación");

            if (result == DialogResult.No)
                return;

            try
            {
                int productId = int.Parse(txtCode.Text);
                productService.RemoveProduct(productId);
                ViewsHelper.ShowSuccessMessage("Producto eliminado correctamente.", "Éxito");
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
            finally
            {
                LoadProducts();
                btnNew_Click(sender, e);
            }
        }

        private void btnFindByCode_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtFindByCode.Text, out int id))
            {
                ViewsHelper.ShowErrorMessage("ID inválido", "Error");
                return;
            }

            try
            {
                ProductEntity product = productService.GetProductById(int.Parse(txtFindByCode.Text));

                if (product == null)
                {
                    ViewsHelper.ShowWarningMessage("Producto no encontrado.", "Advertencia");
                    return;
                }

                dgvProducts.DataSource = new List<ProductEntity> { product };

            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
        }

        private void btnFindByCategory_Click(object sender, EventArgs e)
        {
            string category = txtFindByCategory.Text.Trim();

            if (string.IsNullOrEmpty(category))
            {
                ViewsHelper.ShowErrorMessage("Categoria inválido", "Error");
                return;
            }

            try
            {
                List<ProductEntity> products = productService.GetProductsByCategory(category);

                if (products == null)
                {
                    ViewsHelper.ShowWarningMessage("No se encontraron productos de esa categoria.",
                        "Advertencia");
                    return;
                }

                if (!products.Any())
                {
                    ViewsHelper.ShowWarningMessage("No se encontraron productos de esa categoria.",
                        "Advertencia");
                    return;
                }

                dgvProducts.DataSource = products;
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
        }

        private void btnFindAll_Click(object sender, EventArgs e)
        {
            LoadProducts();
            btnNew_Click(sender, e);
        }
    }
}
