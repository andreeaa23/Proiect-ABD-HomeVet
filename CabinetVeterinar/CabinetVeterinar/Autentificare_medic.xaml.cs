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
        
    
    public partial class Autentificare_medic : Window
    {
        string numeMedic, prenumeMedic;

        public Autentificare_medic(string nume, string prenume)
        {
            numeMedic = nume;
            prenumeMedic = prenume;

            InitializeComponent();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void BtnProgramare_Click(object sender, RoutedEventArgs e)
        {
            ValidareProgramari prog = new ValidareProgramari(numeMedic, prenumeMedic);
            prog.Show();
            this.Hide();
        }
    }
}
