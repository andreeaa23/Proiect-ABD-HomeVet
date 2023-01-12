using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
    public partial class Inregistrare : Window
    {
        private HomeVetEntities1 context;
        public Inregistrare()
        {
            context = new HomeVetEntities1();
            InitializeComponent();
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
      
        private void btnLogare_Click_1(object sender, RoutedEventArgs e)
        {
            string nume = txtNume.Text;
            string prenume = txtPrenume.Text;
            string email = txtEmail.Text;
            string parola = txtParola.Text;
            string hashedPass;
            DateTime data = DateTime.Now;

            var user = (from u in context.Utilizatori
                        where u.Email == email
                        select u);

            if (user.Count() != 0)
            {
                MessageBox.Show("User deja existent!", "Register ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

            }
            else
            {
                byte[] passwdBytes = Encoding.UTF8.GetBytes(parola);

                using (var sha256 = SHA256.Create())
                {
                    byte[] hash = sha256.ComputeHash(passwdBytes);
                    hashedPass= Encoding.UTF8.GetString(hash);
                }
                var newUser = new Utilizatori()
                {
                    Email = email,
                    Nume = nume,
                    Prenume = prenume,
                    Parola = hashedPass,
                    DataInregistrare = data
                    
                    
                };
                context.Utilizatori.Add(newUser);
                context.SaveChanges();

                MessageBox.Show("Inregistrare cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);

                MainWindow main = new MainWindow();
                main.Show();

                this.Hide();
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }
    }
}
