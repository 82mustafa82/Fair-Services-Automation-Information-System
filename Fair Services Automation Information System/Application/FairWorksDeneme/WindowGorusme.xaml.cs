using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;
using System.Data;

namespace FairWorksDeneme
{
    /// <summary>
    /// Interaction logic for WindowGorusme.xaml
    /// </summary>
    public partial class WindowGorusme : Window
    {
        public WindowGorusme()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                Database db = new Database();
                grid.DataContext = db.GetMeeting(1);
                List<Gorusme> gorusmeler = db.ListMeetings();
                foreach (Gorusme grsm in gorusmeler)
                {
                    lb.Items.Add(grsm.GorusulenKisi + " - " + grsm.Tarih.ToShortDateString());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(String.Format("Hata Oluştu: {0}", ex.Message));
            }
        }

        private void lb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Database db = new Database();
            db.ListMeetings();
            List<Gorusme> gorusmeler = db.ListMeetings();
            foreach (Gorusme grsm in gorusmeler)
            {
                if (grsm.GorusulenKisi + " - " + grsm.Tarih.ToShortDateString() == lb.SelectedItem.ToString())
                {
                    grid.DataContext = db.GetMeeting(grsm.GorusmeID);
                    break;
                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            GorusmeEkle ge = new GorusmeEkle();
            this.Close();
            ge.ShowDialog();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (lb.SelectedItem == null)
            {
                MessageBox.Show("Silme işlemi için lütfen bir görüşme seçiniz!");
            }
            else
            {
                Database db = new Database();
                db.ListMeetings();
                List<Gorusme> gorusmeler = db.ListMeetings();
                foreach (Gorusme grsm in gorusmeler)
                {
                    if (grsm.GorusulenKisi + " - " + grsm.Tarih.ToShortDateString() == lb.SelectedItem.ToString())
                    {
                        db.DeleteMeeting(grsm.GorusmeID);
                        break;
                    }
                }
                WindowGorusme wg = new WindowGorusme();
                MessageBox.Show("Görüşme başarıyla silindi!");
                this.Close();
                wg.ShowDialog();
            }
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(tb.Content.ToString());
        }




    }
}
