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
        private HomeVetEntities1 context;
        string numeMedic, prenumeMedic;
        int idMedic;

        public Autentificare_medic(int ID, string nume, string prenume)
        {
            numeMedic = nume;
            prenumeMedic = prenume;
            idMedic = ID;

            InitializeComponent();
            context = new HomeVetEntities1();
            WriteLblMedicName(prenume, nume);
        }

        public class Programare
        {
            public string numeStapan { get; set; }
            public string numePacient { get; set; }
            public string specie { get; set; }
            public string data { get; set; }
            public string tip { get; set; }

            public string ora { get; set; }
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void BtnDeconectare_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            Close();
            
        }

        private void BtnListaProgramari_Click(object sender, RoutedEventArgs e)
        {
            gridListaProgramari.Items.Clear();

            var programari = (from p in context.Programari
                              join a in context.Pacienti
                              on p.idPacient equals a.idPacient
                              join u in context.Utilizatori
                              on a.idUtilizator equals u.idUtilizator
                              join s in context.Specii
                              on a.idSpecie equals s.idSpecie
                              where p.StatusProgramare == "Accepted" && p.idMedic == idMedic
                              select new
                              {
                                  p.idProgramare,
                                  u.Nume,
                                  u.Prenume,
                                  NumeP = a.Nume,
                                  s.Denumire,
                                  p.DataProgramare,
                                  p.Tip,
                                  p.Ora
                              });


            if (programari.Count() != 0)
            {
                foreach (var item in programari)
                {
                    Programare prog = new Programare();
                    prog.numeStapan = item.Nume.ToString() + " " + item.Prenume.ToString();
                    prog.numePacient = item.NumeP.ToString();
                    prog.specie = item.Denumire.ToString();
                    prog.data = item.DataProgramare.Value.ToShortDateString();
                    prog.ora = item.Ora.ToString();

                    if (item.Tip == "D")
                        prog.tip = "Urgenta";
                    else
                        prog.tip = "Control";
                    gridListaProgramari.Items.Add(prog);
                }
            }
        }

        private void BtnProgramare_Click(object sender, RoutedEventArgs e)
        {
            ValidareProgramari prog = new ValidareProgramari(idMedic,numeMedic, prenumeMedic);
            prog.Show();
        }

        private void BtnRaspunsuri_Click(object sender, RoutedEventArgs e)
        {
            RaspunsuriMedic rsp = new RaspunsuriMedic(idMedic);
            rsp.Show();

        }

        private void BtnUpdatareProgramare_Click(object sender, RoutedEventArgs e)
        {
            ColecteazaProbe probe = new ColecteazaProbe(idMedic);
            probe.Show();
        }

        private void WriteLblMedicName(string prn, string name)
        {
            LblUserName.Content = "Hello, Dr. " + name + " " + prn; 
        }
    }
}
