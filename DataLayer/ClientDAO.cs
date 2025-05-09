using EntityLayer;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class ClientDAO
    {
        private readonly DAOHelper<ClientEntity> _helper;

        public ClientDAO()
        {
            _helper = new DAOHelper<ClientEntity>(BuildClient);
        }

        private static ClientEntity BuildClient(SqlDataReader reader)
        {
            return new ClientEntity
            {
                Id = Convert.ToInt32(reader["id"]),
                Name = Convert.ToString(reader["nombre"]),
                Ruc = Convert.ToString(reader["numruc"]),
                Address = Convert.ToString(reader["direccion"]),
                Phone = Convert.ToString(reader["telefono"]),
            };
        }

        public List<ClientEntity> FindAll()
        {
            string sql = "SELECT * FROM cliente";
            return _helper.ExecuteListQuery(sql);
        }

        public ClientEntity FindById(int id)
        {
            string sql = "SELECT * FROM cliente WHERE id = @id";
            return _helper.ExecuteSingleRowQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", id);
            });
        }

        public List<ClientEntity> FindByName(string name)
        {
            string sql = "SELECT * FROM cliente WHERE nombre LIKE @nombre";
            return _helper.ExecuteListQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@nombre", "%" + name + "%");
            });
        }

        public void Insert(ClientEntity client)
        {
            string sql = @"
                INSERT INTO cliente
                    (nombre, numruc, direccion, telefono)
                VALUES (@nombre, @numruc, @direccion, @telefono);";

            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@nombre", client.Name);
                command.Parameters.AddWithValue("@numruc", client.Ruc);
                command.Parameters.AddWithValue("@direccion", client.Address);
                command.Parameters.AddWithValue("@telefono", client.Phone);
            });
        }

        public void Update(ClientEntity client)
        {
            string sql = @"
                UPDATE cliente
                SET nombre = @nombre,
                    numruc = @numruc,
                    direccion = @direccion,
                    telefono = @telefono
                WHERE id = @id;";

            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", client.Id);
                command.Parameters.AddWithValue("@nombre", client.Name);
                command.Parameters.AddWithValue("@numruc", client.Ruc);
                command.Parameters.AddWithValue("@direccion", client.Address);
                command.Parameters.AddWithValue("@telefono", client.Phone);
            });
        }

        public void Delete(int id)
        {
            string sql = "DELETE FROM cliente WHERE id = @id";
            _helper.ExecuteNonQuery(sql, command =>
            {
                command.Parameters.AddWithValue("@id", id);
            });
        }

        public void DeleteClientAndRelatedSales(int id)
        {
            string deleteDetailSql = @"
                DELETE FROM detalle
                WHERE idVenta IN (
                    SELECT id FROM venta WHERE idCliente = @idCliente
                );";

            string deleteSaleSql = @"
                DELETE FROM venta
                WHERE idCliente = @idCliente;";

            string deleteClientSql = @"
                DELETE FROM cliente
                WHERE id = @idCliente;";

            _helper.ExecuteInTransaction((connection, transaction) =>
            {
                // 1. Delete details related to the sales of the client
                _helper.ExecuteNonQuery(deleteDetailSql, connection, transaction, command =>
                {
                    command.Parameters.AddWithValue("@idCliente", id);
                });

                // 2. Delete sales related to the client
                _helper.ExecuteNonQuery(deleteSaleSql, connection, transaction, command =>
                {
                    command.Parameters.AddWithValue("@idCliente", id);
                });

                // 3. Delete the client
                _helper.ExecuteNonQuery(deleteClientSql, connection, transaction, command =>
                {
                    command.Parameters.AddWithValue("@idCliente", id);
                });
            });
        }

        public bool HasSales(int clientId)
        {
            string sql = "SELECT COUNT(*) FROM venta WHERE idCliente = @idCliente";

            var result = _helper.ExecuteScalar(sql, command =>
            {
                command.Parameters.AddWithValue("@idCliente", clientId);
            });

            return Convert.ToInt32(result) > 0;
        }
    }
}
