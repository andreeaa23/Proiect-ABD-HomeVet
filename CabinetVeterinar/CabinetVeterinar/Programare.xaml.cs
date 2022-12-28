using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace CabinetVeterinar
{
    /// <summary>
    /// Interaction logic for Programare.xaml
    /// </summary>
    public partial class Programare : Window
    {
        public Programare()
        {
            InitializeComponent();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }

        private void btnProgramare_Click(object sender, RoutedEventArgs e)
        {
            string nume = txtNume.Text;
            string specie = txtSpecie.Text;
            string varsta = txtVarsta.Text;
            string greutate = txtGreutate.Text;
            string oras = cbOras.SelectedItem.ToString();
            string cabinet = cbCabinet.SelectedItem.ToString();
            string tipProg = cbTipProgramare.SelectedItem.ToString();
            string sectie = cbSectie.SelectedItem.ToString();


        }
    }
}
