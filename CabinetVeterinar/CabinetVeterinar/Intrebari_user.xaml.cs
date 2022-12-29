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
        int idUser;
        DateTime data;

        public class Intrebare
        {
            public string intrebare { get; set; }
            public string raspuns { get; set; }
        }

        public Intrebari_user(int ID)
        {
            idUser = ID;
            data = DateTime.Now;
            InitializeComponent();
            LoadIntrebari();
        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            // Application.Current.MainWindow.Show();
            // this.Close();
            this.Close();
            
        }

        private void BtnListaAnimale_Click(object sender, RoutedEventArgs e)
        {
            var context = new HomeVetEntities1();
            string intrebare = txtIntrebare.Text; //preiau ce scriun in text box

            //introducere intrebare in BD

            var intrebareNoua = new Intrebari()
            {
                idUtilizator = idUser,
                MesajIntrebare = intrebare,
                DataIntrebare = data
            };

            context.Intrebari.Add(intrebareNoua);
            context.SaveChanges();
        }

        public void LoadIntrebari()
        {
            var context = new HomeVetEntities1();
            var intrebari = (from i in context.Intrebari
                            where i.idUtilizator == idUser
                            select i).Distinct();

            int ok;

            if (intrebari.Count() != 0)
            {
                foreach (var item in intrebari)
                {

                    var raspunsuri = (from r in context.Raspunsuri
                                      select r).Distinct(); //pt fiecare intrebare ii iau raspunsul

                    Intrebare intrb = new Intrebare();
                    intrb.intrebare = item.MesajIntrebare.ToString();

                    ok = 0;

                    foreach (var itemR in raspunsuri)
                    {
                        if (item.idIntrebare == itemR.idIntrebare)
                        {
                            ok = 1;
                            intrb.raspuns = itemR.MesajRaspuns;
                        }
                     
                     if(ok==0)
                         intrb.raspuns = "-";
                     
                    }
                    gridIntrebari.Items.Add(intrb);

                }
            }

        }
        
    }
}
