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
    public partial class ProgramariUser : Window
    {
        private HomeVetEntities1 context;
        private int idu;
        public class Programare
        {

            public string animal { get; set; }
            public string medic { get; set; }
            public string data { get; set; }
            public string ora { get; set; }


        }
        public ProgramariUser(int id)
        {
            idu = id;
            InitializeComponent();
            context = new HomeVetEntities1();
            ShowProgramari();

        }

        public void ShowProgramari()
        {
            gridProgramari.Items.Clear();

            var programari = from p in context.Programari
                             join a in context.Pacienti
                             on p.idPacient equals a.idPacient
                             join m in context.Medici
                             on p.idMedic equals m.idMedic
                             where a.idUtilizator == idu
                             select new
                             {
                                 numeA = a.Nume,
                                 m.Nume,
                                 m.Prenume,
                                 p.DataProgramare,
                                 p.Ora
                             };

            if(programari.Count()>0)
            {
                foreach(var item in programari)
                {
                    Programare prog = new Programare();
                    prog.animal = item.numeA.ToString();
                    prog.medic = item.Nume.ToString() + " " + item.Prenume.ToString();
                    prog.data = item.DataProgramare.Value.ToShortDateString();
                    prog.ora = item.Ora.ToString();

                    gridProgramari.Items.Add(prog);
                }
            }
        
        }
   
        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
