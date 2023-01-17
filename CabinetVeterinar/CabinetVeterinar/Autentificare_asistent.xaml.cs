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
 
    public partial class Autentificare_asistent : Window
    {
        private HomeVetEntities1 context;
        int idAsistent;
        int idMedic;
        string nume, prenume;
        public Autentificare_asistent(int ID,int IDM, string Nume, string Prenume)
        {
            idAsistent = ID;
            idMedic = IDM;
            nume = Nume;
            prenume = Prenume;

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


        private void BtnDeconectare_Click_1(object sender, RoutedEventArgs e)
        {
            this.Close();
            Application.Current.MainWindow.Show();
        }

        private void WriteLblMedicName(string prn, string name)
        {
            LblUserName.Content = "Hello, Asist. " + name + " " + prn; 
        }

        private void BtnListaProbeColectate_Click(object sender, RoutedEventArgs e)
        {
            gridListaProgramari.Items.Clear();

            var programari = (from p in context.ProbeColectate
                              join pr in context.Programari
                              on p.idProgramare equals pr.idProgramare
                              join a in context.Pacienti
                              on pr.idPacient equals a.idPacient
                              join u in context.Utilizatori
                              on a.idUtilizator equals u.idUtilizator
                              join s in context.Specii
                              on a.idSpecie equals s.idSpecie
                              select new
                              {
                                  p.idProgramare,
                                  u.Nume,
                                  u.Prenume,
                                  NumeP = a.Nume,
                                  s.Denumire,
                                  pr.DataProgramare,
                                  p.Locatie,
                                  pr.Ora
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
                    prog.tip = item.Locatie.ToString();
                    prog.ora = item.Ora.ToString();
                    gridListaProgramari.Items.Add(prog);
                }
            }
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
                              where p.StatusProgramare == "Accepted" && p.idMedic==idMedic
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
                    prog.data = item.DataProgramare.ToString();
                    prog.ora = item.Ora.ToString();

                    if (item.Tip == "D")
                        prog.tip = "Urgenta";
                    else
                        prog.tip = "Control";
                    gridListaProgramari.Items.Add(prog);
                }
            }
        }
    }
}
