﻿using System;
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
    /// Interaction logic for Inregistrare.xaml
    /// </summary>
    public partial class Inregistrare : Window
    {
        public Inregistrare()
        {
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
            string tip = txtTip.Text;
            DateTime data = DateTime.Now;

            var context = new HomeVetEntities1();
            var user = (from u in context.Utilizatori
                        where u.Email == email
                        select u);

            if (user.Count() != 0)
            {
                MessageBox.Show("User deja existent!", "Register ERROR", MessageBoxButton.OK, MessageBoxImage.Error);

            }
            else
            {
                var newUser = new Utilizatori()
                {
                    Email = email,
                    Nume = nume,
                    Prenume = prenume,
                    Parola = parola,
                    DataInregistrare = data,
                    Tip = tip
                    
                };
                context.Utilizatori.Add(newUser);
                context.SaveChanges(); 

                var credentials = (from u in context.Utilizatori
                                   where u.Email == email
                                   select new
                                   {
                                       u.Prenume,
                                       u.Nume,
                                       u.idUtilizator,
                                       u.Tip
                                   }).First();
                MainWindow main = new MainWindow();
                main.Show();
                Hide();
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }
    }
}
