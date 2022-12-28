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
       
        public IEnumerable<string> ColectieOrase
        {
            get { return orase; }
            set
            {
                orase = value;

            }
        }

        public void LoadOrase()
        {
            var context = new HomeVetEntities1();
            var cities = from o in context.Cabinete
                         select o.Oras;

            foreach (var item in cities)
                ColectieOrase.Append(item);
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
       
      
    }
}
