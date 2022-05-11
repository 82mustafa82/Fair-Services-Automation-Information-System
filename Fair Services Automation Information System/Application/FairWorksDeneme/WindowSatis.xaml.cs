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
    /// Interaction logic for WindowSatis.xaml
    /// </summary>
    public partial class WindowSatis : Window
    {
        public WindowSatis()
        {
            InitializeComponent();
        }

        private void button4_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, RoutedEventArgs e)
        {
            WindowGorusme wg = new WindowGorusme();
            wg.ShowDialog();
        }

        private void button2_Click(object sender, RoutedEventArgs e)
        {
            WindowTeklif wt = new WindowTeklif();
            wt.ShowDialog();
        }
    }
}
