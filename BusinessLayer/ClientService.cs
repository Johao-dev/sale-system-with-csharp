using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DataLayer;
using EntityLayer;

namespace BusinessLayer
{
    public class ClientService
    {
        private readonly ClientDAO _clientDAO;

        public ClientService()
        {
            _clientDAO = new ClientDAO();
        }

        public List<ClientEntity> GetAllClients()
        {
            var clients = _clientDAO.FindAll();

            if (clients == null || clients.Count == 0)
                throw new KeyNotFoundException("No clients found.");

            return clients;
        }

        public ClientEntity GetClientById(int id)
        {
            if (id <= 0)
                throw new ArgumentException("Invalid client ID.");

            ClientEntity client = _clientDAO.FindById(id);

            if (client == null)
                throw new KeyNotFoundException($"Client with ID {id} not found.");

            return client;
        }

        public List<ClientEntity> GetClientsByName(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Name cannot be null or empty.");

            var clients = _clientDAO.FindByName(name);

            if (clients == null || clients.Count == 0)
                throw new KeyNotFoundException($"No clients found for name: {name}");

            return clients;
        }

        public void AddClient(ClientEntity client)
        {
            if (client == null)
                throw new ArgumentNullException(nameof(client), "Client cannot be null.");

            _clientDAO.Insert(client);
        }

        public void UpdateClient(ClientEntity client)
        {
            if (client == null)
                throw new ArgumentNullException(nameof(client), "Client cannot be null.");

            var existingClient = _clientDAO.FindById(client.Id);

            if (existingClient == null)
                throw new KeyNotFoundException($"Client with ID {client.Id} not found.");

            _clientDAO.Update(client);
        }

        public void RemoveClient(int clientId)
        {
            if (clientId <= 0)
                throw new ArgumentException("Invalid client ID.");

            var clientToDelete = _clientDAO.FindById(clientId);

            if (clientToDelete == null)
                throw new KeyNotFoundException($"Client with ID {clientId} not found.");

            bool hasSales = _clientDAO.HasSales(clientId);

            if (hasSales)
                _clientDAO.DeleteClientAndRelatedSales(clientId);
            else
                _clientDAO.Delete(clientId);
        }
    }
}
