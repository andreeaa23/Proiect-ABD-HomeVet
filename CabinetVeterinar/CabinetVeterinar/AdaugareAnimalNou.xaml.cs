using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
    public partial class AdaugareAnimalNou : Window
    {
        private HomeVetEntities1 context;
        int idUser;
        public AdaugareAnimalNou(int ID)
        {
            idUser = ID;
            InitializeComponent();
            context = new HomeVetEntities1();
   
        }
        public void AdaugaSpecie(string specie)
        {
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
                context.SaveChanges();
             
            }
            

        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
        
        public void LoadAnimalNou()
        {
            string numeAnimal = txtNume.Text;
            string specie = txtSpecie.Text;
            decimal greutate;
            Decimal.TryParse(txtGreutate.Text, out greutate);
            int varsta;
            Int32.TryParse(txtvarsta.Text, out varsta);
            AdaugaSpecie(specie);
            var specii = (from s in context.Specii
                         where s.Denumire == specie
                         select s.idSpecie).First();

                    var pacientNou = new Pacienti()
                    {
                        idUtilizator = idUser,
                        idSpecie = specii,
                        Nume = numeAnimal,
                        Varsta = varsta,
                        Greutate = greutate
                    };
                    context.Pacienti.Add(pacientNou);

                    context.SaveChanges();
                
           
        }
        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnAdaugare_Click(object sender, RoutedEventArgs e)
        {
            LoadAnimalNou();

            MessageBox.Show("Adaugare animal cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
            this.Close();
        }
    }
}
