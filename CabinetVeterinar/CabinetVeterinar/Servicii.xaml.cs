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

namespace CabinetVeterinar
{
    /// <summary>
    /// Interaction logic for Servicii.xaml
    /// </summary>
    public partial class Servicii : Window
    {
        public IEnumerable<string> orase;

       
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

        private void boxOras_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            boxOras.DataContext = orase;

        }
    }
}
