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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FairWorksDeneme
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        public void button1_Click(object sender, RoutedEventArgs e)
        {
            Database db = new Database();
            Kullanicilar user = db.GetUser(textBox1.Text);

            try
            {
                if (passwordBox1.Password == user.Sifre)
                {
                    if (user.PersonelTuru == "Genel")
                    {
                        Window1 wndw = new Window1();
                        this.Close();
                        wndw.ShowDialog();
                    }
                    else if (user.PersonelTuru == "Satış")
                    {
                        WindowSatis ws = new WindowSatis();
                        this.Close();
                        ws.ShowDialog();
                    }
                }
                else
                {
                    MessageBox.Show("Lütfen girdiğiniz değerleri kontrol ediniz!!!");
                }
            }
            catch
            {
                MessageBox.Show("Lütfen girdiğiniz değerleri kontrol ediniz!!!");
            }

            
            
        }
    }
}
