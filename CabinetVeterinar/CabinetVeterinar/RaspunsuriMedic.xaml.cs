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
    /// Interaction logic for RaspunsuriMedic.xaml
    /// </summary>
    public partial class RaspunsuriMedic : Window
    {
         int idMedic;
      
       
        public class Raspuns
        {
            public string user { get; set; }

            public string intrebare { get; set; }

            public string raspuns { get; set; }

        }
        public RaspunsuriMedic(int idm)
        {
            
            idMedic = idm;
            InitializeComponent();
            LoadIntrebari();
        }
        public void LoadIntrebari()
        {
            gridRaspunsuri.Items.Clear();

            var context = new HomeVetEntities1();

            var intrb = from i in context.Intrebari
                        join u in context.Utilizatori
                        on i.idUtilizator equals u.idUtilizator
                        where i.StatusIntrebare == "NU"
                        select new
                        {
                            u.Nume,
                            u.Prenume,
                            i.MesajIntrebare,
                            
                        };

            foreach(var item in intrb)
            {
                Raspuns rsp = new Raspuns();
                rsp.intrebare = item.MesajIntrebare.ToString();
                rsp.user = item.Nume.ToString() + " " + item.Prenume.ToString();
                rsp.raspuns = "";
                gridRaspunsuri.Items.Add(rsp);
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
    }
}
