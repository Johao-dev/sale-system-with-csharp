using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DataLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class SaleService
    {
        private readonly SaleDAO _saleDAO;
        private readonly ClientDAO _clientDAO;
        private readonly ProductDAO _productDAO;

        public SaleService()
        {
            _saleDAO = new SaleDAO();
            _clientDAO = new ClientDAO();
            _productDAO = new ProductDAO();
        }

        public void RegisterSale(SaleEntity sale, List<DetailEntity> details)
        {
            ValidateClient(sale.ClientId);
            ValidateSaleDetails(details);

            _saleDAO.Register(sale, details);
        }

        public List<SaleEntity> GetAllSales()
        {
            return _saleDAO.FindAll();
        }

        private void ValidateClient(int clientId)
        {
            var client = _clientDAO.FindById(clientId);
            if (client == null)
                throw new ArgumentException("Client not found.");
        }

        private void ValidateSaleDetails(List<DetailEntity> details)
        {
            if (details == null || details.Count == 0)
                throw new ArgumentException("Sale must have at least one detail.");

            foreach (var detail in details)
            {
                if (detail.Quantity <= 0)
                    throw new ArgumentException("Invalid quantity. Must be greater than zero.");

                var product = _productDAO.FindById(detail.ProductId);

                if (product == null)
                    throw new ArgumentException($"Product with ID {detail.ProductId} not found.");
            }
        }
    }
}
