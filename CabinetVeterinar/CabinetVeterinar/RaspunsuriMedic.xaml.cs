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
    public partial class RaspunsuriMedic : Window
    {
        private HomeVetEntities1 context;
        int id;
        int idMedic;
        int ok = 0;
     
        public class Intrebare
        {
            public int id { get; set; }
            public string intrebare { get; set; }
            public string raspuns { get; set; }
            public string user { get; set; }


        }
        public RaspunsuriMedic(int idm)
        {

            idMedic = idm;
            InitializeComponent();
            context = new HomeVetEntities1();
            LoadIntrebari();
        }
        public void LoadIntrebari()
        {
            gridRaspunsuri.Items.Clear();

            var intrebari = from i in context.Intrebari
                            join u in context.Utilizatori
                            on i.idUtilizator equals u.idUtilizator
                            where i.StatusIntrebare == "NU"
                            select new
                            {
                                u.Nume,
                                u.Prenume,
                                i.MesajIntrebare,
                              
                                i.idIntrebare
                            };

            foreach (var item in intrebari)
            {
                Intrebare intrb = new Intrebare();
                intrb.intrebare = item.MesajIntrebare.ToString();
                intrb.user = item.Nume.ToString() + " " + item.Prenume.ToString();
                intrb.id = item.idIntrebare;
                gridRaspunsuri.Items.Add(intrb);
            }

        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void gridRaspunsuri_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ok = 1;
            string cellValue = "";
            foreach (DataGridCellInfo cell in gridRaspunsuri.SelectedCells)
            {
                if (cell.Column.Header.ToString() == "IdIntrebare")
                {
                    object cellContent = cell.Column.GetCellContent(cell.Item);
                    if (cellContent is TextBlock)
                        cellValue = ((TextBlock)cellContent).Text;
                    break;
                }
            }
            Int32.TryParse(cellValue, out id);
        }
        private void btnRaspunde_Click(object sender, RoutedEventArgs e)
        {

            if (ok == 1)
            {
                var intrebare = (from i in context.Intrebari
                                 where i.idIntrebare == id
                                 select i).Single();
                intrebare.StatusIntrebare = "DA";
                intrebare.MesajRaspuns = txtRaspuns.Text;
                intrebare.idMedic = idMedic;

                context.SaveChanges();
                LoadIntrebari();
            }
        }
       
    }
}
