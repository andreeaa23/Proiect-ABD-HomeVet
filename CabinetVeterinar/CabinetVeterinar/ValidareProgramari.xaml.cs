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
    /// Interaction logic for ValidareProgramari.xaml
    /// </summary>
    public partial class ValidareProgramari : Window
    {
        string numeMedic, prenumeMedic;

        public class Programare
        {
            public string numeStapan { get; set; }
            public string numePacient { get; set; }

            public string specie { get; set; }
            public string data { get; set; }
            public string tip { get; set; }
        }
        public ValidareProgramari(string nume, string prenume)
        {
            numeMedic = nume;
            prenumeMedic = prenume;

            LoadProgramari();
            InitializeComponent();
        }


        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

     

        void LoadProgramari()
        {
            var context = new HomeVetEntities1();
            var programari = (from p in context.Programari
                              join a in context.Pacienti
                              on p.idPacient equals a.idPacient
                              join u in context.Utilizatori
                              on a.idUtilizator equals u.idUtilizator
                              join s in context.Specii
                              on a.idSpecie equals s.idSpecie
                              select new
                              {
                                  u.Nume,
                                  u.Prenume,
                                  NumeP=a.Nume,
                                  s.Denumire,
                                  p.DataProgramare,
                                  p.Tip
                              });
       

                if (programari.Count() !=0)
            {
                foreach(var item in programari)
                {
                    Programare prog = new Programare();
                    prog.numeStapan = item.Nume.ToString() + " " + item.Prenume.ToString();
                    prog.numePacient = item.NumeP.ToString();
                    prog.specie = item.Denumire.ToString();
                    prog.data = item.DataProgramare.ToString();

                    if (item.Tip == "D")
                        prog.tip = "Urgenta";
                    else
                        prog.tip = "Control";
                    dataGridProgramari.Items.Add(prog);
                }
            }
        }
    }
}
