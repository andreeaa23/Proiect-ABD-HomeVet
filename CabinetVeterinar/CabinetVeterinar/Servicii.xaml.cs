using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
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
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CabinetVeterinar
{
    /// <summary>
    /// Interaction logic for Servicii.xaml
    /// </summary>
    public partial class Servicii : Window
    {
        public class OrasSelectat
        {
            public string adresa { get; set; }
            public string nrTelef { get; set; }
            public string program { get; set; }

        }
        string selectedCity;
        public Servicii()
        {
            InitializeComponent();
            LoadOrase();
         
        }
       
        public void LoadOrase()
        {
            var context = new HomeVetEntities1();
            var cities = (from o in context.Cabinete
                         select o.Oras).Distinct();

            foreach (var c in cities)
                boxOras.Items.Add(c.ToString());
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void afisareDetalii_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
         
            var context = new HomeVetEntities1();
            var orasSelectat = boxOras.SelectedItem.ToString(); //preiau ce am selectat in combobox
           
            var cabinete = from c in context.Cabinete
                              where c.Oras == selectedCity
                              select new
                              {
                                  c.Adresa,
                                  c.NrTelefon,
                                  c.Program
                              }; //preiau toate cabinetele din acel oras selectat


            //de ce nu le afiseaza?????????????????????/
            if (cabinete.Count() != 0) //daca am mai multe cabinete in acel oras
            { 
                OrasSelectat city = new OrasSelectat(); //creez un cabinet nou ca sa l bag in data grid
                foreach (var item in cabinete)
                {

                    city.adresa = item.Adresa.ToString();
                    city.nrTelef = item.NrTelefon.ToString();
                    city.program = item.Program.ToString();

                }
                afisareDetalii.Items.Add(city);
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }
    }
}
