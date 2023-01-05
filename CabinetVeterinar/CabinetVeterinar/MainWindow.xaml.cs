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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CabinetVeterinar
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
       
  
        public MainWindow()
        {
            InitializeComponent();

           

        }

        private void btnInregistrare_Click(object sender, RoutedEventArgs e)
        {
            Inregistrare inreg = new Inregistrare();
            inreg.Show();
            Hide();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

      
        private void BtnAutentificare_Click(object sender, RoutedEventArgs e)
        { //verificare parola mai trb
            string userName;
            string password;
          
            userName = (string)TxtUser.Text; //preiau userName ul din buton
            password = TxtParola.Password.ToString();
            var context = new HomeVetEntities1();
            var user = (from u in context.Utilizatori
                         where u.Email == userName
                         select u);

           

            if (user.Count() == 0)
            { 
                MessageBox.Show("User inexistent!", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                Inregistrare inreg = new Inregistrare();
                inreg.Show();
                Hide();
            }
            else
            {
                var passwd = (from u in context.Utilizatori
                              where u.Email == userName
                              select u.Parola); //selectex parola pt userul meu

                if (passwd.First().ToString() == password) //daca gasesc parola
                {
                    var credentials = (from u in context.Utilizatori
                                       where u.Email == userName
                                       select new
                                       {
                                           u.Prenume,
                                           u.Nume,
                                           u.idUtilizator,
                                           u.Tip
                                       }).First();
                    var tip = (from u in context.Utilizatori
                               where u.Email == userName
                               select u.Tip).First();
                    if (tip == "U")
                    { 
                         Autentificare_normal_user auth = new Autentificare_normal_user((int)credentials.idUtilizator, credentials.Prenume.ToString(), credentials.Nume.ToString(),credentials.Tip.ToString()); //user,parola
                         auth.Show();
                         Hide();
                     }
                    else if(tip == "M")
                    {
                        //to do autentificare_medic
                        Autentificare_medic medic = new Autentificare_medic(credentials.Nume.ToString(), credentials.Prenume.ToString());
                        medic.Show();
                        Hide();
                      
                    }
                    else if(tip == "A")
                    {
                        //to do autentificare_asistent
                    }
                }
                else
                {
                    MessageBox.Show("Parola gresita!\nVa rugam incercati din nou.", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

        }

        private void BtnServicii_Click(object sender, RoutedEventArgs e)
        {
            Servicii srv = new Servicii();
            srv.Show();
            Hide();
        }
    }
}
