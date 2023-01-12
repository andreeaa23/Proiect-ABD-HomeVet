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

    public partial class ColecteazaProbe : Window
    {
        int ok = 0;
        int idProgramare;
        int idAsistent;
        int idMedic;
        public ColecteazaProbe(int id)
        {
            idMedic = id;
            InitializeComponent();
            LoadProgramari();
            LoadAsistenti();
        }
       
        public class Programare
        {
            public int id { get; set; }
            public string numeStapan { get; set; }
            public string numePacient { get; set; }

            public string specie { get; set; }
            public string data { get; set; }
            public string tip { get; set; }
        }


        public void LoadLocatieProgramare()
        {
            cbLocatie.Items.Clear();
            cbLocatie.Items.Add("Domiciliu");
            cbLocatie.Items.Add("Cabinet");
        }

        public void LoadAsistenti()
        {
            
            var context = new HomeVetEntities1();

            var asistenti = from a in context.Asistenti
                            where a.idMedic == idMedic
                            select new
                            {
                                a.Nume,
                                a.Prenume
                            };

            if(asistenti.Count()!=0)
            {
                foreach(var item in asistenti)
                {
                    cbAsistenti.Items.Add(item.Nume + " " + item.Prenume);
                } 
            }

        }
         public void LoadProgramari()
        {
            gridListaProgramari.Items.Clear();
            var context = new HomeVetEntities1();
            var programari = (from p in context.Programari
                              join a in context.Pacienti
                              on p.idPacient equals a.idPacient
                              join u in context.Utilizatori
                              on a.idUtilizator equals u.idUtilizator
                              join s in context.Specii
                              on a.idSpecie equals s.idSpecie
                              where p.StatusProgramare == "Accepted" && p.idMedic == idMedic
                              orderby p.Tip descending ,p.DataProgramare
                              select new
                              {
                                  p.idProgramare,
                                  u.Nume,
                                  u.Prenume,
                                  NumeP = a.Nume,
                                  s.Denumire,
                                  p.DataProgramare,
                                  p.Tip
                              });


            if (programari.Count() != 0)
            {
                foreach (var item in programari)
                {
                    Programare prog = new Programare();
                    prog.id = item.idProgramare;
                    prog.numeStapan = item.Nume.ToString() + " " + item.Prenume.ToString();
                    prog.numePacient = item.NumeP.ToString();
                    prog.specie = item.Denumire.ToString();
                    prog.data = item.DataProgramare.ToString();

                    if (item.Tip == "D")
                        prog.tip = "Urgenta";
                    else
                        prog.tip = "Control";
                    gridListaProgramari.Items.Add(prog);
                }
            }

        }

        private void gridListaProgramari_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ok = 1;
          
            string cellValue = "";
            foreach (DataGridCellInfo cell in gridListaProgramari.SelectedCells)
            {
                if (cell.Column.Header.ToString() == "ID")
                {
                    object cellContent = cell.Column.GetCellContent(cell.Item);
                    if (cellContent is TextBlock)
                        cellValue = ((TextBlock)cellContent).Text;
                    break;
                }
            }
            Int32.TryParse(cellValue, out idProgramare);
       
        }

        private void cbAsistenti_SelectionChanged_1(object sender, SelectionChangedEventArgs e)
        {
            LoadLocatieProgramare();
            var context = new HomeVetEntities1();
            string[] vars = cbAsistenti.SelectedItem.ToString().Split(' ');
            string n = vars[0];
            string p = vars[1];
            var id = (from a in context.Asistenti
                     where a.Nume == n && a.Prenume == p
                     select a.idAsistent).First();

            idAsistent = id;
            //aici trb sa preluam id ul asistentului
        }

        private void BtnModifica_Click(object sender, RoutedEventArgs e)
        {
            
            var context = new HomeVetEntities1();

            var newUpdate = new ProbeColectate()
            {
                idProgramare = idProgramare,
                Locatie = cbLocatie.Text,
                idAsistent=idAsistent
            };
            context.ProbeColectate.Add(newUpdate);
            context.SaveChanges();

            MessageBox.Show("Programare modificata!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
            
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
