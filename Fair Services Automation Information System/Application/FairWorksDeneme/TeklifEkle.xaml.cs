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
    /// Interaction logic for TeklifEkle.xaml
    /// </summary>
    public partial class TeklifEkle : Window
    {
        public TeklifEkle()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Database db = new Database();
            List<Firma> firmalar = db.ListFirms();
            foreach (Firma f in firmalar)
            {
                cb3.Items.Add(f.FirmaAdi);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            WindowTeklif wt = new WindowTeklif();
            this.Close();
            wt.ShowDialog();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                int fid = 0;
                Database db = new Database();
                List<Firma> firmalar = db.ListFirms();
                foreach (Firma f in firmalar)
                {
                    if (f.FirmaAdi == cb3.SelectedItem.ToString())
                    {
                       fid = f.FirmaID;
                       break;
                    }
                }
                            SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=FairWorks;User ID=sa;Password=123");
                            if (connection.State == ConnectionState.Closed)
                                connection.Open();
                            SqlCommand command = new SqlCommand("Insert Into Teklifler(Tarih,SalonNo,StandKodu,TeklifVerilenm2,m2BirimFiyati,DovizCinsi,DovizKuru,VadeSayisi,OdemePlani,SonTarih,FirmaID) Values(@TARIH,@SNO,@SKOD,@TVM2,@M2BF,@DC,@DK,@VS,@OP,@ST,@FID)", connection);
                            command.Parameters.AddWithValue("@TARIH", dp.SelectedDate);
                            command.Parameters.AddWithValue("@SNO", int.Parse(tb.Text));
                            command.Parameters.AddWithValue("@SKOD", int.Parse(tb2.Text));
                            command.Parameters.AddWithValue("@TVM2", int.Parse(tb3.Text));
                            command.Parameters.AddWithValue("@M2BF", Convert.ToDecimal(tb4.Text));
                            command.Parameters.AddWithValue("@DC", tb5.Text);
                            command.Parameters.AddWithValue("@DK", int.Parse(tb6.Text));
                            command.Parameters.AddWithValue("@VS", int.Parse(tb7.Text));
                            command.Parameters.AddWithValue("@OP", tb8.Text);
                            command.Parameters.AddWithValue("@ST", dp2.SelectedDate);
                            command.Parameters.AddWithValue("@FID", fid);
                            try
                            {
                                int sonuc = command.ExecuteNonQuery();
                                if (sonuc > 0)
                                    MessageBox.Show("Kayıt başarılı");
                                else
                                    MessageBox.Show("Kayıt başarısız");
                            }
                            catch (Exception ex)
                            {
                                MessageBox.Show(ex.Message);
                            }
                            finally
                            {
                                connection.Close();
                                command.Dispose();
                            }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
