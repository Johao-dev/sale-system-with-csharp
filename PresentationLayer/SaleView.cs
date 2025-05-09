using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BusinessLayer;
using EntityLayer;

namespace PresentationLayer
{
    public partial class SaleView: UserControl
    {
        private readonly ClientService clientService;
        private readonly ProductService productService;
        private readonly SaleService saleService;

        private decimal totalAmount;

        private static SaleView instance;

        private SaleView()
        {
            InitializeComponent();

            clientService = new ClientService();
            productService = new ProductService();
            saleService = new SaleService();

            this.totalAmount = 0.0m;
        }

        public static SaleView GetInstance()
        {
            if (instance == null)
                instance = new SaleView();

            return instance;
        }

        private void btnFindClient_Click(object sender, EventArgs e)
        {
            try
            {
                ClientEntity client = clientService.GetClientById(Convert.ToInt32(txtClient.Text));
                txtClientName.Text = client.Name;
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage($"Ocurrió un error al buscar el cliente: {ex.Message}", "Error");
                return;
            }

            txtProduct.Focus();
        }

        private void btnFindProduct_Click(object sender, EventArgs e)
        {
            try
            {
                ProductEntity product = productService.GetProductById(Convert.ToInt32(txtProduct.Text));
                txtProductDescription.Text = product.Description;
                txtProductPrice.Text = product.Price.ToString();
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage($"Ocurrió un error al buscar el producto: {ex.Message}", "Error");
                return;
            }

            txtQuantity.Focus();
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (!TryGetProductAndQuantity(out ProductEntity product, out int quantity))
                return;

            decimal subtotal = CalculateSubtotal(product, quantity);
            AddDetailToGrid(product, quantity, subtotal);
            UpdateTotal(subtotal);
            ClearProductInputs();
        }

        private void btnRegisterSale_Click(object sender, EventArgs e)
        {
            if (!TryBuildSale(out SaleEntity sale, out List<DetailEntity> details))
                return;

            try
            {
                saleService.RegisterSale(sale, details);
                ViewsHelper.ShowSuccessMessage("Venta registrada exitosamente.", "Éxito");
                ClearFields();
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage($"Ocurrió un error al registrar la venta: {ex.Message}", "Error");
            }
        }

        private bool TryGetProductAndQuantity(out ProductEntity product, out int quantity)
        {
            product = null;
            quantity = 0;

            if (!int.TryParse(txtProduct.Text, out int productId))
            {
                ViewsHelper.ShowErrorMessage("ID de producto inválido.", "Error");
                return false;
            }

            product = productService.GetProductById(productId);
            if (product == null)
            {
                ViewsHelper.ShowErrorMessage("Producto no encontrado.", "Error");
                return false;
            }

            if (!int.TryParse(txtQuantity.Text, out quantity) || quantity <= 0)
            {
                ViewsHelper.ShowErrorMessage("Cantidad inválida.", "Error");
                return false;
            }

            return true;
        }

        private decimal CalculateSubtotal(ProductEntity product, int quantity)
        {
            return product.Price * quantity;
        }

        private void AddDetailToGrid(ProductEntity product, int quantity, decimal subtotal)
        {
            dgvDetails.Rows.Add(new object[]
            {
                product.Id,
                product.Description,
                product.Price,
                quantity,
                subtotal
            });
        }

        private void UpdateTotal(decimal subtotal)
        {
            totalAmount += subtotal;
            txtTotalPrice.Text = totalAmount.ToString("F2");
        }

        private void ClearProductInputs()
        {
            txtProduct.Text = "";
            txtProductDescription.Text = "";
            txtProductPrice.Text = "";
            txtQuantity.Text = "";
            txtProduct.Focus();
        }

        private bool TryBuildSale(out SaleEntity sale, out List<DetailEntity> details)
        {
            sale = null;
            details = new List<DetailEntity>();

            if (!int.TryParse(txtClient.Text, out int clientId))
            {
                ViewsHelper.ShowErrorMessage("ID de cliente inválido.", "Error");
                return false;
            }

            if (dgvDetails.Rows.Count == 0)
            {
                ViewsHelper.ShowErrorMessage("No se puede registrar una venta sin productos.", "Error");
                return false;
            }

            foreach (DataGridViewRow row in dgvDetails.Rows)
            {
                if (!TryBuildDetailFromRow(row, out DetailEntity detail))
                    return false;

                details.Add(detail);
            }

            sale = new SaleEntity
            {
                Date = DateTime.Now,
                ClientId = clientId
            };

            return true;
        }

        private bool TryBuildDetailFromRow(DataGridViewRow row, out DetailEntity detail)
        {
            detail = null;

            if (!int.TryParse(row.Cells["ProductId"].Value?.ToString(), out int productId) ||
                !int.TryParse(row.Cells["Quantity"].Value?.ToString(), out int quantity))
            {
                ViewsHelper.ShowErrorMessage("Error al procesar detalles de productos. Verifica que todos los valores sean válidos.", "Error");
                return false;
            }

            detail = new DetailEntity
            {
                ProductId = productId,
                Quantity = quantity
            };

            return true;
        }


        private void ClearFields()
        {
            txtClient.Text = "";
            txtClientName.Text = "";
            txtProduct.Text = "";
            txtProductDescription.Text = "";
            txtProductPrice.Text = "";
            txtQuantity.Text = "";
            txtTotalPrice.Text = "";
            dgvDetails.Rows.Clear();
            totalAmount = 0.0m;
        }
    }
}
