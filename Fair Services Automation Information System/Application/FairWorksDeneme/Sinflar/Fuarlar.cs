using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FairWorksDeneme
{
    class Fuarlar
    {
            public int FuarId { get; set; }
            public string FuarAdi { get; set; }
            public int SehirID { get; set; }
            public int UlkeID { get; set; }
            public DateTime Tarih { get; set; }
            public string Salon { get; set; }
            public string SatisMuduru { get; set; }
            public string SatisPersoneli { get; set; }
    }
}
