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

namespace FairWorksDeneme
{
    /// <summary>
    /// Interaction logic for WindowTeklif.xaml
    /// </summary>
    public partial class WindowTeklif : Window
    {
        public WindowTeklif()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            
        }

        private void Window_Loaded_1(object sender, RoutedEventArgs e)
        {
            try
            {
                Database db = new Database();
                grid.DataContext = db.GetOffer(1);
                Teklif tek = db.GetOffer(1);
                cb.SelectedItem = tek.FirmaAdi;
                List<Teklif> teklifler = db.ListOffers();
                foreach (Teklif t in teklifler)
                {
                    lb.Items.Add(t.FirmaAdi + " - " + t.Tarih.ToShortDateString());
                }
                List<Firma> firmalar = db.ListFirms();
                foreach (Firma f in firmalar)
                {
                    cb.Items.Add(f.FirmaAdi);
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
            List<Teklif> teklifler = db.ListOffers();
            foreach (Teklif t in teklifler)
            {
                if (t.FirmaAdi + " - " + t.Tarih.ToShortDateString() == lb.SelectedItem.ToString())
                {
                    grid.DataContext = db.GetOffer(t.TeklifID);
                    cb.SelectedItem = t.FirmaAdi;
                    break;
                }
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            TeklifEkle te = new TeklifEkle();
            this.Close();
            te.ShowDialog();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Database db = new Database();
            db.ListOffers();
            List<Teklif> teklifler = db.ListOffers();
            foreach (Teklif t in teklifler)
            {
                if (t.FirmaAdi + " - " + t.Tarih.ToShortDateString() == lb.SelectedItem.ToString())
                {
                    db.DeleteOffer(t.TeklifID);
                    break;
                }
            }
            WindowTeklif wt = new WindowTeklif();
            MessageBox.Show("Teklif başarıyla silindi!");
            this.Close();
            wt.ShowDialog();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            try
            {
                Database db = new Database();
                bool result = db.UpdateOffer((Teklif)grid.DataContext);
                if (result)
                {
                    MessageBox.Show("Bilgiler güncellendi!");
                }
                else
                {
                    MessageBox.Show("Güncellenemedi!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(String.Format("Hata Oluştu: {0}", ex.Message));
            }
        }
    }
}
