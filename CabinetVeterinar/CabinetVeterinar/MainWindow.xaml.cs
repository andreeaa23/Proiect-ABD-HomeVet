using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
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
            LoadTypes();

        }

        private void btnInregistrare_Click(object sender, RoutedEventArgs e)
        {
            Inregistrare inreg = new Inregistrare();
            inreg.Show();
            Hide();
            TxtParola.Clear();
            TxtUser.Clear();
        }
        public void LoadTypes()
        {
            cbTip.Items.Add("Utilizator");
            cbTip.Items.Add("Medic");
            cbTip.Items.Add("Asistent");
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
        private void BtnAutentificare_Click(object sender, RoutedEventArgs e)
        { 
            string userName;
            string password;
          
            userName = TxtUser.Text; //preiau userName ul din buton
            password = TxtParola.Password.ToString();


            var context = new HomeVetEntities1();
            if (string.IsNullOrEmpty(cbTip.Text))
            {
                MessageBox.Show("Va rugam selectati tipul utilizatorului!", "ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            else if (cbTip.SelectedItem.ToString() == "Utilizator")
            {
                var user = (from u in context.Utilizatori
                            where u.Email == userName
                            select u);

                if (user.Count() == 0)
                {
                    MessageBox.Show("User inexistent!", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

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
                                               u.idUtilizator

                                           }).First();

                        Autentificare_normal_user auth = new Autentificare_normal_user((int)credentials.idUtilizator, credentials.Prenume.ToString(), credentials.Nume.ToString()); //user,parola
                        auth.Show();
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Parola gresita!\nVa rugam incercati din nou.", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else if (cbTip.SelectedItem.ToString() == "Medic")
            {
                var user = (from m in context.Medici
                            where m.Email == userName
                            select m);

                if (user.Count() == 0)
                {
                    MessageBox.Show("User inexistent!", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

                }
                else
                {
                    var passwd = (from m in context.Medici
                                  where m.Email == userName
                                  select m.Parola); //selectex parola pt userul meu

                    if (passwd.First().ToString() == password) //daca gasesc parola
                    {
                        var credentials = (from u in context.Medici
                                           where u.Email == userName
                                           select new
                                           {
                                               u.Prenume,
                                               u.Nume,
                                               u.idMedic

                                           }).First();

                        Autentificare_medic auth = new Autentificare_medic((int)credentials.idMedic, credentials.Prenume.ToString(), credentials.Nume.ToString()); //user,parola
                        auth.Show();
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Parola gresita!\nVa rugam incercati din nou.", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else if (cbTip.SelectedItem.ToString() == "Asistent")
            {
                var user = (from a in context.Asistenti
                            where a.Email == userName
                            select a);

                if (user.Count() == 0)
                {
                    MessageBox.Show("User inexistent!", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

                }
                else
                {
                    var passwd = (from a in context.Asistenti
                                  where a.Email == userName
                                  select a.Parola); //selectex parola pt userul meu

                    if (passwd.First().ToString() == password) //daca gasesc parola
                    {
                        var credentials = (from u in context.Asistenti
                                           where u.Email == userName
                                           select new
                                           {
                                               u.Prenume,
                                               u.Nume,
                                               u.idAsistent,
                                               u.idMedic

                                           }).First();

                        Autentificare_asistent auth = new Autentificare_asistent((int)credentials.idAsistent,(int)credentials.idMedic, credentials.Prenume.ToString(), credentials.Nume.ToString()); //user,parola
                        auth.Show();
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Parola gresita!\nVa rugam incercati din nou.", "Login ERROR", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }

          
}

        private void BtnServicii_Click(object sender, RoutedEventArgs e)
        {
            Servicii srv = new Servicii();
            srv.Show();
            Hide();
            TxtParola.Clear();
            TxtUser.Clear();
        }
    }
    
}
