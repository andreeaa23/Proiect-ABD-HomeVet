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
    /// Interaction logic for Autentificare.xaml
    /// </summary>
    public partial class Autentificare_normal_user : Window
    {
        int id;
        string nume;
        string prenume;
        

        public class Animale
        {
            public string numeAnimal { get; set; }
            public string specie { get; set; }
            public string varsta { get; set; }
            public string greutate { get; set; }


        }

        public Autentificare_normal_user(int ID,string Prenume, string Nume)
        {
            id = ID;
            nume = Nume;
            prenume = Prenume;
           
          
            InitializeComponent();
            WriteLblUserName(prenume,nume);
        }

        private void WriteLblUserName(string prn, string name)
        {
            LblUserName.Content = "Hello, " + name + " " + prn;
        }
        private void BtnProgramare_Click(object sender, RoutedEventArgs e)
        {
            Programare programare = new Programare(id);
            programare.Show();
           
        }

        private void BtnListaAnimale_Click(object sender, RoutedEventArgs e)
        {
            gridListaAnimale.Items.Clear();

            var context = new HomeVetEntities1();
            var animale =  from a in context.Pacienti
                           join s in context.Specii
                           on a.idSpecie equals s.idSpecie
                           where a.idUtilizator == id
                           select new
                           {
                               a.Nume,
                               a.Varsta,
                               a.Greutate,
                               s.Denumire,

                           };


            if (animale.Count() != 0)
            {
                foreach (var item in animale)
                {
                    Animale animal = new Animale();
                    animal.numeAnimal = item.Nume.ToString();
                    animal.specie = item.Denumire.ToString();
                    animal.varsta = item.Varsta.ToString();
                    animal.greutate = item.Greutate.ToString();
                    gridListaAnimale.Items.Add(animal);
                }
            }

          
        }

        private void BtnIntrebari_Click(object sender, RoutedEventArgs e)
        {
            Intrebari_user intrb = new Intrebari_user(id);
            intrb.Show();
          
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void BtnAdaugaAnimale_Click(object sender, RoutedEventArgs e)
        {
            AdaugareAnimalNou animalNou = new AdaugareAnimalNou(id);
            animalNou.Show();
        }

        private void BtnDeconectare_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
            Application.Current.MainWindow.Show();
        }

        private void BtnIstoricProg_Click(object sender, RoutedEventArgs e)
        {
            ProgramariUser prog = new ProgramariUser(id);
            prog.Show();

            
        }
    }
}
