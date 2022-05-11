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
    /// Interaction logic for GorusmeEkle.xaml
    /// </summary>
    public partial class GorusmeEkle : Window
    {
        public GorusmeEkle()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Database db = new Database();
            List<Personel> SatisPersonelleri = db.ListSalesmans();
            foreach (Personel p in SatisPersonelleri)
            {
                cb.Items.Add(p.PersonelAdi + " " + p.PersonelSoyadi);
            }
            List<Firma> firmalar = db.ListFirms();
            foreach (Firma f in firmalar) 
            {
                cb2.Items.Add(f.FirmaAdi);
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int pid = 0;
                int fid = 0;
                Database db = new Database();
                List<Kullanicilar> users = db.ListUsers();
                foreach (Kullanicilar k in users)
                {
                    if (k.PersonelAdi + " " + k.PersonelSoyadi == cb.SelectedItem.ToString())
                    {
                        if (tb.Password == k.Sifre)
                        {
                            List<Personel> SatisPersonelleri = db.ListSalesmans();
                            foreach (Personel p in SatisPersonelleri)
                            {
                                if (p.PersonelAdi + " " + p.PersonelSoyadi == cb.SelectedItem.ToString())
                                {
                                    pid = p.PersonelID;
                                    break;
                                }
                            }
                            List<Firma> firmalar = db.ListFirms();
                            foreach (Firma f in firmalar)
                            {
                                if (f.FirmaAdi == cb2.SelectedItem.ToString())
                                {
                                    fid = f.FirmaID;
                                    break;
                                }
                            }



                            SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=FairWorks;User ID=sa;Password=123");
                            if (connection.State == ConnectionState.Closed)
                                connection.Open();
                            SqlCommand command = new SqlCommand("Insert Into Gorusmeler(PersonelID,Tarih,GorusulenKisi,GorusuleninUnvani,TelNo,EPosta,FirmaID,Notlar) Values(@PID,@TARIH,@GK,@GU,@TN,@EP,@FID,@NOT)", connection);
                            command.Parameters.AddWithValue("@PID", pid);
                            command.Parameters.AddWithValue("@TARIH", dp.SelectedDate);
                            command.Parameters.AddWithValue("@GK", tb2.Text);
                            command.Parameters.AddWithValue("@GU", tb3.Text);
                            command.Parameters.AddWithValue("@TN", tb4.Text);
                            command.Parameters.AddWithValue("@EP", tb5.Text);
                            command.Parameters.AddWithValue("@FID", fid);
                            command.Parameters.AddWithValue("@NOT", tb6.Text);
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
                            break;
                        }
                        else
                        {
                            MessageBox.Show("Lütfen bilgilerinizi kontrol ediniz!");
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            WindowGorusme wg = new WindowGorusme();
            this.Close();
            wg.ShowDialog();
        }
    }
}
