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
    /// Interaction logic for Programare.xaml
    /// </summary>
    public partial class Programare : Window
    {
        int id; //pacient
        DateTime data;
  
        public Programare(int ID)
        {
            id = ID;
            data = DateTime.Now;


            InitializeComponent();
            LoadListaAnimale();
            LoadListaOrase();
            LoadTipProgramare();

        }

        private void Window_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                DragMove();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.Show();
            this.Close();
        }

        private void btnProgramare_Click(object sender, RoutedEventArgs e)
        {
            var context = new HomeVetEntities1();
            string tipProg = cbTipProgramare.SelectedItem.ToString();
            string tip ="";

            if (tipProg == "Urgenta")
                tip = "D";
            else if (tipProg == "Control")
                tip = "N";

            var newProg = new Programari()
            {
                idPacient = id,
                idMedic = getIdMedic(),
                DataProgramare = data,
                Tip = tip

            };

            context.Programari.Add(newProg);
            context.SaveChanges();

         }   

        public void LoadListaAnimale()
        {
            var context = new HomeVetEntities1();
            var animals = (from a in context.Pacienti
                           where a.idUtilizator == id
                          select a.Nume).Distinct();

            foreach (var c in animals)
                cbListaAnimale.Items.Add(c.ToString());
        }

        public void LoadListaOrase()
        {
            var context = new HomeVetEntities1();
            var cities = (from c in context.Cabinete
                           select c.Oras).Distinct();

            foreach (var c in cities)
                cbOras.Items.Add(c.ToString());
        }

        public void LoadListaCabinete()
        {
            var context = new HomeVetEntities1();
            var oras = cbOras.SelectedItem.ToString();

            var cabinete = (from c in context.Cabinete
                            where c.Oras == oras
                            select c.Adresa);

            foreach (var c in cabinete)
                cbCabinet.Items.Add(c.ToString());
        }

        private void cbOras_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadListaCabinete();
        }

        public void LoadTipProgramare()
        {
            cbTipProgramare.Items.Add("Urgenta");
            cbTipProgramare.Items.Add("Control");
        }

        public void LoadSectie()
        {
            var context = new HomeVetEntities1();
            var cabinetSelectat = cbCabinet.SelectedItem.ToString();

            var sectii = (from cs in context.CabineteSectii
                         join c in context.Cabinete
                         on cs.idCabinet equals c.idCabinet
                         join s in context.Sectii
                         on cs.idSectie equals s.idSectie
                         where c.Adresa == cabinetSelectat
                          select s.Denumire).Distinct();

            foreach (var item in sectii)
                cbSectie.Items.Add(item.ToString());

        }

        private void cbCabinet_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadSectie();
        }

        private void cbSectie_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadMedici();
        }

        public void LoadMedici()
        {
            var context = new HomeVetEntities1();
            var sectieSelectata = cbSectie.SelectedItem.ToString();

            var medici = (from cs in context.CabineteSectii
                          join m in context.Medici
                          on cs.idCabineteSectii equals m.idCabineteSectii
                          join s in context.Sectii
                          on cs.idSectie equals s.idSectie
                          where s.Denumire == sectieSelectata
                          select new
                          {
                              m.Nume,
                              m.Prenume
                          }).Distinct();
            
            foreach (var item in medici)
                cbMedic.Items.Add(item.Nume.ToString() +" "+ item.Prenume.ToString());
        }

        public int getIdMedic()
        {
            var context = new HomeVetEntities1();
            var medicSelectat = cbMedic.SelectedItem.ToString();
            Int32 count = 2;
            string[] sep = { " " };
            string[] creds = medicSelectat.Split(sep,count,StringSplitOptions.RemoveEmptyEntries);

            var medici = (from m in context.Medici.ToList()
                         where m.Nume == creds.ElementAt(0) && m.Prenume == creds.ElementAt(1)
                         select m.idMedic).First();

             return (int)medici;
        }
    }
}
