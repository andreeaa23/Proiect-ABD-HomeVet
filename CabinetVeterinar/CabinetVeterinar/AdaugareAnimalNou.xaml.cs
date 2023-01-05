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
    /// Interaction logic for AdaugareAnimalNou.xaml
    /// </summary>
    public partial class AdaugareAnimalNou : Window
    {
        int idUser;
        public AdaugareAnimalNou(int ID)
        {
            idUser = ID;
            InitializeComponent();
           // LoadAnimalNou();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        public void LoadAnimalNou()
        {
            var context = new HomeVetEntities1();
            string numeAnimal = txtNume.Text;
            string specie = txtSpecie.Text;
            decimal greutate;
            Decimal.TryParse(txtGreutate.Text, out greutate);
            int varsta;
            Int32.TryParse(txtvarsta.Text, out varsta);

            var specii = from s in context.Specii
                         where s.Denumire == specie
                         select s; //daca am deja specia in tabel sa n o mai adaug iar

            if (specii.Count() == 0) //daca n am specia, o adaug in tabel
            {
                var specieNoua = new Specii()
                {
                    Denumire = specie
                };
                context.Specii.Add(specieNoua);
            }

            foreach (var item in specii) //o sa trb sa am una singura gen
            {

                var pacientNou = new Pacienti()
                {
                    idUtilizator = idUser,
                    idSpecie = item.idSpecie,
                    Nume = numeAnimal,
                    Varsta = varsta,
                    Greutate = greutate
                };
                context.Pacienti.Add(pacientNou);
            }
            context.SaveChanges();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Hide();
        }

        private void btnAdaugare_Click(object sender, RoutedEventArgs e)
        {
            LoadAnimalNou();
            MessageBox.Show("Adaugare animal cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
        }
    }
}
