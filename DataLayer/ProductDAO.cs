using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using EntityLayer;

namespace DataLayer
{
    public class ProductDAO
    {
        private readonly DAOHelper<ProductEntity> _helper;

        public ProductDAO()
        {
            _helper = new DAOHelper<ProductEntity>(BuildProduct);
        }

        private static ProductEntity BuildProduct(SqlDataReader reader)
        {
            return new ProductEntity
            {
                Id = Convert.ToInt32(reader["id"]),
                Description = Convert.ToString(reader["descripcion"]),
                Category = Convert.ToString(reader["categoria"]),
                Price = Convert.ToDecimal(reader["precio"]),
            };
        }

        public List<ProductEntity> FindAll()
        {
            string sql = "SELECT * FROM producto";
            return _helper.ExecuteListQuery(sql);
        }

        public ProductEntity FindById(int id)
        {
            string sql = "SELECT * FROM producto WHERE id = @id";
            return _helper.ExecuteSingleRowQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", id);
            });
        }

        public List<ProductEntity> FindByCategory(string category)
        {
            string sql = "SELECT * FROM producto WHERE categoria LIKE @category";
            return _helper.ExecuteListQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@category", "%" + category + "%");
            });
        }

        public void Insert(ProductEntity product)
        {
            string sql = "INSERT INTO producto (descripcion, categoria, precio) VALUES (@descripcion, @categoria, @precio)";
            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@descripcion", product.Description);
                command.Parameters.AddWithValue("@categoria", product.Category);
                command.Parameters.AddWithValue("@precio", product.Price);
            });
        }

        public void Update(ProductEntity product)
        {
            string sql = "UPDATE producto SET descripcion = @descripcion, categoria = @categoria, precio = @precio WHERE id = @id";
            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", product.Id);
                command.Parameters.AddWithValue("@descripcion", product.Description);
                command.Parameters.AddWithValue("@categoria", product.Category);
                command.Parameters.AddWithValue("@precio", product.Price);
            });
        }

        public void Delete(int id)
        {
            string sql = "DELETE FROM producto WHERE id = @id";
            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", id);
            });
        }
    }
}
