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

namespace PresentationLayer
{
    public partial class ClientView: UserControl
    {
        private readonly ClientService clientService;
        private static ClientView instance;

        private ClientView()
        {
            InitializeComponent();
            clientService = new ClientService();
            this.ClientView_Load(null, null);
        }

        public static ClientView GetInstance()
        {
            if (instance == null)
                instance = new ClientView();

            return instance;
        }

        private void ClientView_Load(object sender, EventArgs e)
        {
            LoadClients();
        }

        private void LoadClients()
        {
            List<ClientEntity> clients = clientService.GetAllClients();

            dgvClients.AutoGenerateColumns = true;
            dgvClients.DataSource = clients;

            dgvClients.Columns["Name"].HeaderText = "Nombre";
            dgvClients.Columns["Ruc"].HeaderText = "RUC";
            dgvClients.Columns["Address"].HeaderText = "Dirección";
            dgvClients.Columns["Phone"].HeaderText = "Teléfono";
            dgvClients.ReadOnly = true;
            dgvClients.MultiSelect = false;
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            txtCode.Text = "";
            txtName.Text = "";
            txtRuc.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";

            txtFindByCode.Text = "";
            txtFindByName.Text = "";

            txtCode.Focus();
        }

        private void dgvClients_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvClients.Rows[e.RowIndex];

                txtCode.Text = row.Cells["Id"].Value.ToString();
                txtName.Text = row.Cells["Name"].Value.ToString();
                txtRuc.Text = row.Cells["Ruc"].Value.ToString();
                txtAddress.Text = row.Cells["Address"].Value.ToString();
                txtPhone.Text = row.Cells["Phone"].Value.ToString();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                ClientEntity client = new ClientEntity
                {
                    Id = int.Parse(txtCode.Text),
                    Name = txtName.Text,
                    Ruc = txtRuc.Text,
                    Address = txtAddress.Text,
                    Phone = txtPhone.Text
                };

                if (client.Id == 0)
                {
                    clientService.AddClient(client);
                    ViewsHelper.ShowSuccessMessage("Cliente agregado correctamente.", "Éxito");
                }
                else
                {
                    clientService.UpdateClient(client);
                    ViewsHelper.ShowSuccessMessage("Cliente actualizado correctamente.", "Éxito");
                }
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
            finally
            {
                LoadClients();
                btnNew_Click(sender, e);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            DialogResult result = ViewsHelper.ShowQuestionMessage(
                "¿Está seguro de que desea eliminar este cliente? Se eliminaran todas sus ventas relacionadas.",
                "Confirmar eliminación");

            if (result == DialogResult.No)
                return;

            try
            {
                int clientId = int.Parse(txtCode.Text);
                clientService.RemoveClient(clientId);
                ViewsHelper.ShowSuccessMessage("Cliente eliminado correctamente.", "Éxito");
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
            finally
            {
                LoadClients();
                btnNew_Click(sender, e);
            }
        }

        private void btnFindByCode_Click(object sender, EventArgs e)
        {
            if (!int.TryParse(txtFindByCode.Text, out int id))
            {
                ViewsHelper.ShowErrorMessage("ID del cliente invalido.", "Error");
                return;
            }

            try
            {
                ClientEntity client = clientService.GetClientById(int.Parse(txtFindByCode.Text));

                if (client == null)
                {
                    ViewsHelper.ShowErrorMessage("Cliente no encontrado.", "Error");
                    return;
                }

                dgvClients.DataSource = new List<ClientEntity> { client };

            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
        }

        private void btnFindByName_Click(object sender, EventArgs e)
        {
            string name = txtFindByName.Text.Trim();

            if (string.IsNullOrEmpty(name))
            {
                ViewsHelper.ShowWarningMessage("Nombre inválido", "Advertencia");
                return;
            }

            try
            {
                List<ClientEntity> clients = clientService.GetClientsByName(name);

                if (clients == null)
                {
                    ViewsHelper.ShowErrorMessage("No se encontraron clientes.", "Error");
                    return;
                }

                if (!clients.Any())
                {
                    ViewsHelper.ShowErrorMessage("No se encontraron clientes con ese nombre.", "Error");
                    return;
                }

                dgvClients.DataSource = clients;
            }
            catch (Exception ex)
            {
                ViewsHelper.ShowErrorMessage(ex.Message, "Error");
            }
        }

        private void btnFindAll_Click(object sender, EventArgs e)
        {
            LoadClients();
            btnNew_Click(sender, e);
        }
    }
}
