﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PresentationLayer
{
    public partial class Main: Form
    {
        public Main()
        {
            InitializeComponent();
            ShowView(new StartView());
        }

        private void ShowView(UserControl view)
        {
            mainPanel.Controls.Clear();
            view.Dock = DockStyle.Fill;
            mainPanel.Controls.Add(view);
        }

        private void salirToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void clienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowView(ClientView.GetInstance());
        }

        private void inicioToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowView(new StartView());
        }

        private void productoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowView(ProductView.GetInstance());
        }

        private void ventaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ShowView(SaleView.GetInstance());
        }
    }
}
