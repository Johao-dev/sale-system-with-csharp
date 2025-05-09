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

namespace PresentationLayer
{
    public partial class StartView : UserControl
    {
        private readonly ClientService clientService;
        private readonly ProductService productService;
        private readonly SaleService saleService;

        public StartView()
        {
            InitializeComponent();
            clientService = new ClientService();
            productService = new ProductService();
            saleService = new SaleService();
            this.StartView_Load(null, null);
        }

        private void StartView_Load(object sender, EventArgs e)
        {
            string totalClients = clientService.GetAllClients().Count().ToString();
            string totalProducts = productService.GetAllProducts().Count().ToString();
            string totalSales = saleService.GetAllSales().Count().ToString();

            lblTotalClients.Text = totalClients;
            lblTotalProducts.Text = totalProducts;
            lblTotalSales.Text = totalSales;
        }
    }
}
