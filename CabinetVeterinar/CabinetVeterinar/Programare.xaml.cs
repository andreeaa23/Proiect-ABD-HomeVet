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
    public partial class Programare : Window
    {
        int idUser; //utilizator
        int idA;
        DateTime data;
        private HomeVetEntities1 context;

        private static bool isLoadedCabinete = false;
        private static bool isLoadedSectii = false;
        public Programare(int ID)
        {
            idUser = ID;
            data = DateTime.Now;
            context = new HomeVetEntities1();

            InitializeComponent();
            LoadListaAnimale();
            LoadListaOrase();
            LoadTipProgramare();

        }
        public void LoadListaOrase()
        {

            var cities = (from c in context.Cabinete
                          select c.Oras).Distinct().ToList();

            cbOras.ItemsSource = cities;
        }

        private void cbOras_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            isLoadedCabinete = false;
            cbCabinet.SelectedItem = null;
            LoadListaCabinete();

        }

        public void LoadListaCabinete()
        {

            var oras = cbOras.SelectedItem.ToString();

            var cabinete = (from c in context.Cabinete
                            where c.Oras == oras
                            select c.Adresa).ToList();

            cbCabinet.ItemsSource = cabinete;
            isLoadedCabinete = true;
        }

        private void cbCabinet_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (isLoadedCabinete)
            {
                LoadSectie();

            }
            isLoadedCabinete = false;
            cbSectie.SelectedItem = null;
        }

        public void LoadSectie()
        {

            var cabinetSelectat = cbCabinet.SelectedItem.ToString();

            var sectii = (from cs in context.CabineteSectii
                          join c in context.Cabinete
                          on cs.idCabinet equals c.idCabinet
                          join s in context.Sectii
                          on cs.idSectie equals s.idSectie
                          where c.Adresa == cabinetSelectat
                          select s.Denumire).ToList();

            cbSectie.ItemsSource = sectii;
            isLoadedSectii = true;

        }
        private void cbSectie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (isLoadedSectii)
            {
                LoadMedici();

            }
            isLoadedSectii = false;
            cbMedic.SelectedItem = null;

        }

        public void LoadMedici()
        {

            var sectieSelectata = cbSectie.SelectedItem.ToString();
            var cabinetSelectat = cbCabinet.SelectedItem.ToString();
            var medici = (from m in context.Medici
                          join cs in context.CabineteSectii
                          on m.idCabineteSectii equals cs.idCabineteSectii
                          join s in context.Sectii
                          on cs.idSectie equals s.idSectie
                          join c in context.Cabinete
                          on cs.idCabinet equals c.idCabinet
                          where s.Denumire == sectieSelectata && c.Adresa == cabinetSelectat
                          select

                             m.Nume + " " + m.Prenume

                         ).ToList();

            cbMedic.ItemsSource = medici; //to do

        }
        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            //Application.Current.MainWindow.Show();
            this.Close();
        }

        private void btnProgramare_Click(object sender, RoutedEventArgs e)
        {
            if (cbMedic.SelectedItem!=null)
            {
                string tipProg = cbTipProgramare.SelectedItem.ToString();
                string tip = "";

                if (tipProg == "Urgenta")
                    tip = "D";
                else if (tipProg == "Control")
                    tip = "N";

                var newProg = new Programari()
                {
                    idPacient = idA,
                    idMedic = getIdMedic(),
                    DataProgramare = data,
                    Tip = tip,
                    StatusProgramare = "Pending"
                };

                context.Programari.Add(newProg);
                context.SaveChanges();

                MessageBox.Show("Programare realizata cu succes!", "Succes", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
               
            }
        }   

        public void LoadListaAnimale()
        {
           
            var animals = (from a in context.Pacienti
                           where a.idUtilizator == idUser
                          select a.Nume).Distinct();

            foreach (var c in animals)
                cbListaAnimale.Items.Add(c.ToString());
        }
        public void LoadTipProgramare()
        {
            cbTipProgramare.Items.Add("Urgenta");
            cbTipProgramare.Items.Add("Control");
        }
      
        public int getIdMedic()
        {
           
            var medicSelectat = cbMedic.SelectedItem.ToString();
            Int32 count = 2;
            string[] sep = { " " };
            string[] creds = medicSelectat.Split(sep,count,StringSplitOptions.RemoveEmptyEntries);

            var medici = (from m in context.Medici.ToList()
                         where m.Nume == creds.ElementAt(0) && m.Prenume == creds.ElementAt(1)
                         select m.idMedic).First();

             return (int)medici;
        }

        private void cbListaAnimale_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            idA = (from a in context.Pacienti
                      where a.Nume == cbListaAnimale.SelectedItem.ToString() && a.idUtilizator==idUser
                      select a.idPacient).First();

                      
        }
    }
}
