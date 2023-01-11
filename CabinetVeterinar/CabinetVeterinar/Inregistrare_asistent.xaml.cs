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
    /// <summary>
    /// Interaction logic for Inregistrare_asistent.xaml
    /// </summary>
    public partial class Inregistrare_asistent : Window
    {
        public Inregistrare_asistent()
        {
            InitializeComponent();
            LoadListaOrase();
        }
        public void LoadListaOrase()
        {
            var context = new HomeVetEntities1();
            var cities = (from c in context.Cabinete
                          select c.Oras).Distinct();

            foreach (var c in cities)
                cbOras.Items.Add(c.ToString());
        }

        private void cbOras_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadListaCabinete();

        }

        public void LoadListaCabinete()
        {
            var context = new HomeVetEntities1();
            var oras = cbOras.SelectedItem.ToString();

            var cabinete = (from c in context.Cabinete
                            where c.Oras == oras
                            select c.Adresa);

            foreach (var c in cabinete)
                cbCabinet.Items.Add(c.ToString());
        }

        private void cbCabinet_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadSectie();
        }

        public void LoadSectie()
        {
            var context = new HomeVetEntities1();
            var cabinetSelectat = cbCabinet.SelectedItem.ToString();

            var sectii = (from cs in context.CabineteSectii
                          join c in context.Cabinete
                          on cs.idCabinet equals c.idCabinet
                          join s in context.Sectii
                          on cs.idSectie equals s.idSectie
                          where c.Adresa == cabinetSelectat
                          select s.Denumire).Distinct();

            foreach (var item in sectii)
                cbSectie.Items.Add(item.ToString());

        }



        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }
        public int getIdMedic()
        {
            var context = new HomeVetEntities1();
            var medicSelectat = cbMedic.SelectedItem.ToString();
            Int32 count = 2;
            string[] sep = { " " };
            string[] creds = medicSelectat.Split(sep, count, StringSplitOptions.RemoveEmptyEntries);

            var medici = (from m in context.Medici.ToList()
                          where m.Nume == creds.ElementAt(0) && m.Prenume == creds.ElementAt(1)
                          select m.idMedic).First();

            return (int)medici;
        }
        private void btnLogare_Click(object sender, RoutedEventArgs e)
        {
            
            string nume = txtNume.Text;
            string prenume = txtPrenume.Text;
            string email = txtEmail.Text;
            string parola = txtParola.Text;
            string hashedPass;
            int idM = getIdMedic();
      
            string medic = cbMedic.SelectedItem.ToString();

            var context = new HomeVetEntities1();
            var user = (from u in context.Medici
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
                    hashedPass = Encoding.UTF8.GetString(hash);
                    // Store the `storedPasswordHash` in your database
                }
                var newAsistent = new Asistenti()
                {
                    Email = email,
                    Nume = nume,
                    Prenume = prenume,
                    Parola = hashedPass,
                    idMedic = idM

                };
                context.Asistenti.Add(newAsistent);
                context.SaveChanges();
                MessageBox.Show("Inregistrare cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
                MainWindow main = new MainWindow();
                main.Show();
                Hide();
            }
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
        private void cbSectie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadMedici();
        }

        public void LoadMedici()
        {
            var context = new HomeVetEntities1();
            var sectieSelectata = cbSectie.SelectedItem.ToString();
            var cabinetSelectat = cbCabinet.SelectedItem.ToString();
            var medici = (from m in context.Medici
                          join cs in context.CabineteSectii
                          on m.idCabineteSectii equals cs.idCabineteSectii
                          join s in context.Sectii
                          on cs.idSectie equals s.idSectie
                          join c in context.Cabinete
                          on cs.idCabinet equals c.idCabinet
                          where s.Denumire == sectieSelectata && c.Adresa == cabinetSelectat
                          select new
                          {
                              m.Nume,
                              m.Prenume
                          });

            foreach (var item in medici)
                cbMedic.Items.Add(item.Nume.ToString() + " " + item.Prenume.ToString());
        }

        
    }
}
