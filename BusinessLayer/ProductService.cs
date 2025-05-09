using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DataLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class ProductService
    {
        private readonly ProductDAO _productDAO;

        public ProductService()
        {
            _productDAO = new ProductDAO();
        }

        public List<ProductEntity> GetAllProducts()
        {
            var products = _productDAO.FindAll();

            if (products == null || products.Count == 0)
                throw new KeyNotFoundException("No products found.");

            return products;
        }

        public ProductEntity GetProductById(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid product ID.");

            ProductEntity product = _productDAO.FindById(id);

            if (product == null)
                throw new KeyNotFoundException($"Product with ID {id} not found.");

            return product;
        }

        public List<ProductEntity> GetProductsByCategory(string category)
        {
            if (string.IsNullOrWhiteSpace(category))
                throw new ArgumentException("Category cannot be null or empty.");

            var products = _productDAO.FindByCategory(category);

            if (products == null || products.Count == 0)
                throw new KeyNotFoundException($"No products found for category: {category}");

            return products;
        }

        public void AddProduct(ProductEntity product)
        {
            if (product == null)
                throw new ArgumentNullException(nameof(product), "Product cannot be null.");

            _productDAO.Insert(product);
        }

        public void UpdateProduct(ProductEntity product)
        {
            if (product == null)
                throw new ArgumentNullException(nameof(product), "Product cannot be null.");

            var productToUpdate = _productDAO.FindById(product.Id);

            if (productToUpdate == null)
                throw new KeyNotFoundException($"Product with ID {product.Id} not found.");

            _productDAO.Update(product);
        }

        public void RemoveProduct(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid product ID.");

            var productToDelete = _productDAO.FindById(id);

            if (productToDelete == null)
                throw new KeyNotFoundException($"Product with ID {id} not found.");

            _productDAO.Delete(id);
        }
    }
}
