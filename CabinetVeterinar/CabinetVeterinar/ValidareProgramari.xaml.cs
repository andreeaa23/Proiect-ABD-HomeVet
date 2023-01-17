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
  
    public partial class ValidareProgramari : Window
    {
        string numeMedic, prenumeMedic;
        int id;
        int idMedic;
        int ok;
      
        public class Programare
        {
            public int idProg { get; set; }
            public string numeStapan { get; set; }
            public string numePacient { get; set; }

            public string specie { get; set; }
            public string data { get; set; }
            public string tip { get; set; }
        }
        public ValidareProgramari(int idM, string nume, string prenume)
        {
            idMedic = idM;
            ok = 0;
            numeMedic = nume;
            prenumeMedic = prenume;
           
            InitializeComponent();
            LoadProgramari();
        }


        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BtnAcceptare_Click(object sender, RoutedEventArgs e)
        {
            
            if(ok == 1)
            {
                var context = new HomeVetEntities1();
                var acceptare = (from p in context.Programari
                                 where p.idProgramare == id && p.idMedic == idMedic
                                 select p).Single();
                acceptare.StatusProgramare = "Accepted";
                context.SaveChanges();
                dataGridProgramari.Items.Clear();
                LoadProgramari();
                
            }
        }

        private void BtnRaspingere_Click(object sender, RoutedEventArgs e)
        {
            if (ok == 1)
            {
                var context = new HomeVetEntities1();
                var acceptare = (from p in context.Programari 
                                 where p.idProgramare == id && p.idMedic == idMedic
                                 select p).Single();
                acceptare.StatusProgramare = "Refused";
                context.SaveChanges();
                dataGridProgramari.Items.Clear();
                LoadProgramari();
                

            }
        }

        private void dataGridProgramari_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ok = 1;
            string cellValue = "";
            foreach (DataGridCellInfo cell in dataGridProgramari.SelectedCells)
            {
                if (cell.Column.Header.ToString() == "IdProgramare")
                {
                    object cellContent = cell.Column.GetCellContent(cell.Item);
                    if (cellContent is TextBlock)
                        cellValue = ((TextBlock)cellContent).Text;
                    break;
                }
            }
            Int32.TryParse(cellValue, out id);
        }

        void LoadProgramari()
        {
            //trb sa corespunda cu id -ul medicului cu care ma loghez
            var context = new HomeVetEntities1();
            var programari = (from p in context.Programari
                              join a in context.Pacienti
                              on p.idPacient equals a.idPacient
                              join u in context.Utilizatori
                              on a.idUtilizator equals u.idUtilizator
                              join s in context.Specii
                              on a.idSpecie equals s.idSpecie
                              where p.StatusProgramare == "Pending" && p.idMedic == idMedic
                              select new
                              {
                                  p.idProgramare,
                                  u.Nume,
                                  u.Prenume,
                                  NumeP = a.Nume,
                                  s.Denumire,
                                  p.DataProgramare,
                                  p.Tip
                              }) ;
       

                if (programari.Count() !=0)
                {
                 foreach(var item in programari)
                 {
                    Programare prog = new Programare();
                    prog.numeStapan = item.Nume.ToString() + " " + item.Prenume.ToString();
                    prog.numePacient = item.NumeP.ToString();
                    prog.specie = item.Denumire.ToString();
                    prog.data = item.DataProgramare.ToString();
                    prog.idProg = item.idProgramare;

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
