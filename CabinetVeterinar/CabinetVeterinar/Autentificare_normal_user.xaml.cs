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
    /// Interaction logic for Autentificare.xaml
    /// </summary>
    public partial class Autentificare_normal_user : Window
    {
        int id;
        string nume;
        string prenume;
        string tip;
        public Autentificare_normal_user(int ID,string Prenume, string Nume, string Tip)
        {
            id = ID;
            nume = Nume;
            prenume = Prenume;
            tip = Tip;
          
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

        }

        private void BtnIntrebari_Click(object sender, RoutedEventArgs e)
        {
            Intrebari_user intrb = new Intrebari_user();
            intrb.Show();
        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }
    }
}
