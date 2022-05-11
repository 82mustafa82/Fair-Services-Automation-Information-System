using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FairWorksDeneme
{
    class Teklif
    {
        public int TeklifID { get; set; }
        public DateTime Tarih { get; set; }
        public int SalonNo { get; set; }
        public int StandKodu { get; set; }
        public int TeklifVerilenm2 { get; set; }
        public decimal m2BirimFiyati { get; set; }
        public string DovizCinsi { get; set; }
        public int DovizKuru { get; set; }
        public int VadeSayisi { get; set; }
        public string OdemePlani { get; set; }
        public DateTime SonTarih { get; set; }
        public int FirmaID { get; set; }
        public string FirmaAdi { get; set; }
    }
}
