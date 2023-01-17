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
    public partial class Intrebari_user : Window
    {
        private HomeVetEntities1 context;
        int idUser;

        public class Intrebare
        {
            
            public string intrebare { get; set; }
            public string raspuns { get; set; }
            public string medic { get; set; }


        }

        public Intrebari_user(int ID)
        {
            idUser = ID;
            context = new HomeVetEntities1();
            InitializeComponent();
            context = new HomeVetEntities1();
            LoadIntrebari();
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

        private void BtnAdaugaIntrebare_Click(object sender, RoutedEventArgs e)
        {

            if (txtIntrebare.Text!="")

            {
                string intrebare = txtIntrebare.Text; //preiau ce scriun in text box

                //introducere intrebare in BD

                var intrebareNoua = new Intrebari()
                {
                    idUtilizator = idUser,
                    idMedic = null,

                    MesajIntrebare = intrebare,
                    MesajRaspuns = "",
                    StatusIntrebare = "NU"

                };

                context.Intrebari.Add(intrebareNoua);
                context.SaveChanges();
                MessageBox.Show("Intrebare inregistrata cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
                txtIntrebare.Clear();
                LoadIntrebari();
            }
        }

        public void LoadIntrebari()
        {
            gridIntrebari.Items.Clear();

            var intrebari = (from i in context.Intrebari
                             join m in context.Medici on i.idMedic equals m.idMedic
                             where i.idUtilizator == idUser
                             select new
                             {
                                 m.Nume,
                                 m.Prenume,
                                 i
                             });

            if (intrebari.Count() != 0)
            {
                foreach (var item in intrebari)
                {
                    Intrebare intrb = new Intrebare();
                    intrb.intrebare = item.i.MesajIntrebare.ToString();
                    intrb.raspuns = item.i.MesajRaspuns.ToString();
                    intrb.medic = item.Nume.ToString() + " " + item.Prenume.ToString();
      
                    gridIntrebari.Items.Add(intrb);

                }
            }

        }
        
    }
}
