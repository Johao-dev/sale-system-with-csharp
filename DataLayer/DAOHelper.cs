using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class DAOHelper<T> where T : new()
    {
        private readonly Func<SqlDataReader, T> _builder;

        public DAOHelper(Func<SqlDataReader, T> builder)
        {
            _builder = builder;
        }

        /**** START TRANSACTIONAL METHODS ****/

        public void ExecuteInTransaction(Action<SqlConnection, SqlTransaction> transactionAction)
        {
            using (var connection = Connection.Connect())
            {
                connection.Open();
                HandleTransaction(connection, transaction => transactionAction(connection, transaction));
            }
        }

        public T ExecuteSingleRowQuery(
            string sql,
            SqlConnection connection,
            SqlTransaction transaction,
            Action<SqlCommand> parameterSetter = null)
        {
            return ExecuteCommand(sql, connection, transaction, command =>
            {
                using (var reader = command.ExecuteReader())
                {
                    return reader.Read() ? _builder(reader) : default;
                }
            }, parameterSetter);
        }

        public List<T> ExecuteListQuery(
            string sql,
            SqlConnection connection,
            SqlTransaction transaction,
            Action<SqlCommand> parameterSetter = null)
        {
            return ExecuteCommand(sql, connection, transaction, command =>
            {
                var entities = new List<T>();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        entities.Add(_builder(reader));
                    }
                }
                return entities;
            }, parameterSetter);
        }

        public int ExecuteNonQuery(
            string sql,
            SqlConnection connection,
            SqlTransaction transaction,
            Action<SqlCommand> parameterSetter = null)
        {
            return ExecuteCommand(sql, connection, transaction, command => command.ExecuteNonQuery(), parameterSetter);
        }

        public object ExecuteScalar(
            string sql,
            SqlConnection connection,
            SqlTransaction transaction,
            Action<SqlCommand> parameterSetter = null)
        {
            return ExecuteCommand(sql, connection, transaction, command => command.ExecuteScalar(), parameterSetter);
        }

        /**** END TRANSACTIONAL METHODS ****/

        /**** START UNTRANSACTIONAL METHODS ****/

        public T ExecuteSingleRowQuery(
            string sql,
            Action<SqlCommand> parameterSetter = null)
        {
            using (var connection = Connection.Connect())
            {
                connection.Open();
                return ExecuteCommand(sql, connection, null, command =>
                {
                    using (var reader = command.ExecuteReader())
                    {
                        return reader.Read() ? _builder(reader) : default;
                    }
                }, parameterSetter);
            }
        }

        public List<T> ExecuteListQuery(
            string sql,
            Action<SqlCommand> parameterSetter = null)
        {
            using (var connection = Connection.Connect())
            {
                connection.Open();
                return ExecuteCommand(sql, connection, null, command =>
                {
                    var entities = new List<T>();
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            entities.Add(_builder(reader));
                        }
                    }
                    return entities;
                }, parameterSetter);
            }
        }

        public int ExecuteNonQuery(
            string sql,
            Action<SqlCommand> parameterSetter = null)
        {
            using (var connection = Connection.Connect())
            {
                connection.Open();
                return ExecuteCommand(sql, connection, null, command => command.ExecuteNonQuery(), parameterSetter);
            }
        }

        public object ExecuteScalar(
            string sql,
            Action<SqlCommand> parameterSetter = null)
        {
            using (var connection = Connection.Connect())
            {
                connection.Open();
                return ExecuteCommand(sql, connection, null, command => command.ExecuteScalar(), parameterSetter);
            }
        }

        /**** END UNTRANSACTIONAL METHODS ****/

        private TResult ExecuteCommand<TResult>(
            string sql,
            SqlConnection connection,
            SqlTransaction transaction,
            Func<SqlCommand, TResult> commandExecutor,
            Action<SqlCommand> parameterSetter = null)
        {
            using (var command = new SqlCommand(sql, connection, transaction))
            {
                command.CommandType = CommandType.Text;
                parameterSetter?.Invoke(command);
                return commandExecutor(command);
            }
        }

        private void HandleTransaction(SqlConnection connection, Action<SqlTransaction> transactionAction)
        {
            using (var transaction = connection.BeginTransaction())
            {
                try
                {
                    transactionAction(transaction);
                    transaction.Commit();
                }
                catch
                {
                    transaction.Rollback();
                    throw;
                }
            }
        }
    }
}
