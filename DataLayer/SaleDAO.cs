using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using EntityLayer;

namespace DataLayer
{
    public class SaleDAO
    {
        private readonly DAOHelper<SaleEntity> _saleHelper;
        private readonly DAOHelper<DetailEntity> _detailHelper;

        public SaleDAO()
        {
            _saleHelper = new DAOHelper<SaleEntity>(BuildSale);
            _detailHelper = new DAOHelper<DetailEntity>(BuildDetail);
        }

        private static SaleEntity BuildSale(SqlDataReader reader)
        {
            return new SaleEntity
            {
                Id = Convert.ToInt32(reader["id"]),
                Date = Convert.ToDateTime(reader["fecventa"]),
                ClientId = Convert.ToInt32(reader["idCliente"]),
            };
        }

        private static DetailEntity BuildDetail(SqlDataReader reader)
        {
            return new DetailEntity
            {
                Id = Convert.ToInt32(reader["id"]),
                SaleId = Convert.ToInt32(reader["idVenta"]),
                ProductId = Convert.ToInt32(reader["idProducto"]),
                Quantity = Convert.ToInt32(reader["cantidad"]),
            };
        }

        public void Register(SaleEntity sale, List<DetailEntity> details)
        {
            _saleHelper.ExecuteInTransaction((connection, transaction) =>
            {
                // 1. insert a sale and get its generated id
                string insertSql = "INSERT INTO venta (fecventa, idCliente) VALUES (@Date, @ClientId); SELECT SCOPE_IDENTITY();";
                int saleId = Convert.ToInt32(_saleHelper.ExecuteScalar(insertSql, connection, transaction, cmd =>
                {
                    cmd.Parameters.AddWithValue("@Date", sale.Date);
                    cmd.Parameters.AddWithValue("@ClientId", sale.ClientId);
                }));

                // 2. insert details for the sale
                foreach (var detail in details)
                {
                    string detailSql = "INSERT INTO detalle (idVenta, idProducto, cantidad) VALUES (@SaleId, @ProductId, @Quantity)";
                    _detailHelper.ExecuteNonQuery(detailSql, connection, transaction, cmd =>
                    {
                        cmd.Parameters.AddWithValue("@SaleId", saleId);
                        cmd.Parameters.AddWithValue("@ProductId", detail.ProductId);
                        cmd.Parameters.AddWithValue("@Quantity", detail.Quantity);
                    });
                }
            });
        }

        public List<SaleEntity> FindAll()
        {
            string sql = "SELECT * FROM venta";
            return _saleHelper.ExecuteListQuery(sql);
        }
    }
}
