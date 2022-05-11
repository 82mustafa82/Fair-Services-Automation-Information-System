using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace FairWorksDeneme
{
    class Database
    {

        //---------------------Deneme--------------------------------------------

        private readonly string connectionString = "Data Source=.;Initial Catalog=FairWorks;User ID=sa;Password=123";

        public bool UpdateFair(Fuarlar fuar)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Update Fuarlar Set FuarAdi=@AD,SehirID=@SID,UlkeID=@UID,Tarih=@TARIH,Salon=@SALON,SatisMuduru=@SMUDURU,SatisPersoneli=@SPERSONELI Where FuarID=@ID", connection);
            command.Parameters.AddWithValue("@AD", fuar.FuarAdi);
            command.Parameters.AddWithValue("@SID", fuar.SehirID);
            command.Parameters.AddWithValue("@UID", fuar.UlkeID);
            command.Parameters.AddWithValue("@TARIH", fuar.Tarih);
            command.Parameters.AddWithValue("@SALON", fuar.Salon);
            command.Parameters.AddWithValue("@SMUDURU", fuar.SatisMuduru);
            command.Parameters.AddWithValue("@SPERSONELI", fuar.SatisPersoneli);
            command.Parameters.AddWithValue("@ID", fuar.FuarId);
            bool sonuc = false;
            try
            {
                connection.Open();
                sonuc = command.ExecuteNonQuery() > 0 ? true : false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return sonuc;
        }



        public Fuarlar GetFair(int Id)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Select * From Fuarlar Where FuarID=@ID", connection);

            command.Parameters.AddWithValue("@ID", Id);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.SingleRow);
                if (reader.Read())
                {
                    Fuarlar fuar = new Fuarlar
                    {
                        FuarId = (int)reader["FuarId"],
                        FuarAdi = (string)reader["FuarAdi"],
                        SehirID = (int)reader["SehirID"],
                        UlkeID = (int)reader["UlkeID"],
                        Tarih = (DateTime)reader["Tarih"],
                        Salon = (string)reader["Salon"],
                        SatisMuduru = (string)reader["SatisMuduru"],
                        SatisPersoneli = (string)reader["SatisPersoneli"]
                    };
                    return fuar;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        //-------------------------Kullanicilar--------------------------------------

        public Kullanicilar GetUser(string Ad)
        {
            SqlConnection con = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Select k.KullaniciID,k.KullaniciAdi,k.Sifre,k.PersonelID,p.PersonelAdi,p.PersonelSoyadi,p.PersonelTuru From Kullanicilar k join Personeller p on p.PersonelID=k.PersonelID where KullaniciAdi=@AD", con);

            command.Parameters.AddWithValue("@AD", Ad);

            try
            {
                con.Open();
                SqlDataReader reader = command.ExecuteReader(CommandBehavior.SingleRow);
                if (reader.Read())
                {
                    Kullanicilar user = new Kullanicilar
                    {
                        KullaniciID = (int)reader["KullaniciID"],
                        KullaniciAdi = (string)reader["KullaniciAdi"],
                        Sifre = (string)reader["Sifre"],
                        PersonelID = (int)reader["PersonelID"],
                        PersonelAdi = (string)reader["PersonelAdi"],
                        PersonelSoyadi = (string)reader["PersonelSoyadi"],
                        PersonelTuru = (string)reader["PersonelTuru"]
                    };
                    return user;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Kullanicilar> ListUsers()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Select k.KullaniciID,k.KullaniciAdi,k.Sifre,k.PersonelID,p.PersonelAdi,p.PersonelSoyadi,p.PersonelTuru From Kullanicilar k join Personeller p on p.PersonelID=k.PersonelID", connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                List<Kullanicilar> users = new List<Kullanicilar>();
                while (reader.Read())
                {
                    users.Add(
                    new Kullanicilar
                    {
                        KullaniciID = (int)reader["KullaniciID"],
                        KullaniciAdi = (string)reader["KullaniciAdi"],
                        Sifre = (string)reader["Sifre"],
                        PersonelID = (int)reader["PersonelID"],
                        PersonelAdi = (string)reader["PersonelAdi"],
                        PersonelSoyadi = (string)reader["PersonelSoyadi"],
                        PersonelTuru = (string)reader["PersonelTuru"]
                    }
                    );

                }
                return users;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        //------------------Görüşmeler-------------------------------------------

        public Gorusme GetMeeting(int Id)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Select g.GorusmeID,p.PersonelAdi,p.PersonelSoyadi,g.Tarih,g.GorusulenKisi,g.GorusuleninUnvani,g.TelNo,g.EPosta,f.FirmaAdi,g.Notlar From Gorusmeler g join Personeller p on p.PersonelID=g.PersonelID join Firmalar f on f.FirmaID=g.FirmaID Where GorusmeID=@ID", connection);

            command.Parameters.AddWithValue("@ID", Id);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    Gorusme gorusme = new Gorusme
                    {
                        GorusmeID = (int)reader["GorusmeID"],
                        PersonelAdi = (string)reader["PersonelAdi"],
                        PersonelSoyadi = (string)reader["PersonelSoyadi"],
                        Tarih = (DateTime)reader["Tarih"],
                        GorusulenKisi = (string)reader["GorusulenKisi"],
                        GorusuleninUnvani = (string)reader["GorusuleninUnvani"],
                        TelNo = (string)reader["TelNo"],
                        EPosta = (string)reader["EPosta"],
                        FirmaAdi = (string)reader["FirmaAdi"],
                        Notlar = (string)reader["Notlar"]
                    };
                    return gorusme;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public int DeleteMeeting(int id)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Delete From Gorusmeler Where GorusmeID=@ID", connection);
            command.Parameters.AddWithValue("@ID", id);
            int sonuc = 0;
            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                sonuc = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
            return sonuc;
        }

        public List<Gorusme> ListMeetings()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Select g.GorusmeID,p.PersonelAdi,p.PersonelSoyadi,g.Tarih,g.GorusulenKisi,g.GorusuleninUnvani,g.TelNo,g.EPosta,f.FirmaAdi,g.Notlar From Gorusmeler g join Personeller p on p.PersonelID=g.PersonelID join Firmalar f on f.FirmaID=g.FirmaID", connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                List<Gorusme> gorusmeler = new List<Gorusme>();
                while (reader.Read())
                {
                        gorusmeler.Add(
                        new Gorusme
                        {
                            GorusmeID = (int)reader["GorusmeID"],
                            PersonelAdi = (string)reader["PersonelAdi"],
                            PersonelSoyadi = (string)reader["PersonelSoyadi"],
                            Tarih = (DateTime)reader["Tarih"],
                            GorusulenKisi = (string)reader["GorusulenKisi"],
                            GorusuleninUnvani = (string)reader["GorusuleninUnvani"],
                            TelNo = (string)reader["TelNo"],
                            EPosta = (string)reader["EPosta"],
                            FirmaAdi = (string)reader["FirmaAdi"],
                            Notlar = (string)reader["Notlar"]
                        }
                        );
                        
                }
                return gorusmeler;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        //-------------------Personeller------------------------------------------------

        public List<Personel> ListSalesmans()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("select * from Personeller where Unvan='Satış Personeli'", connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                List<Personel> personeller = new List<Personel>();
                while (reader.Read())
                {
                    personeller.Add(
                    new Personel
                    {
                        PersonelID = (int)reader["PersonelID"],
                        PersonelAdi = (string)reader["PersonelAdi"],
                        PersonelSoyadi = (string)reader["PersonelSoyadi"],
                        PersonelTuru = (string)reader["PersonelTuru"],
                        Unvan = (string)reader["Unvan"]
                    }
                    );

                }
                return personeller;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        //----------------Firmalar----------------------------

        public List<Firma> ListFirms()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("select f.FirmaID,f.FirmaAdi,s.SehirAdi,u.UlkeAdi,f.Adres,f.Yetkilisi,f.YetkiliUnvani,f.Telefon,f.Dahili,f.DirektTel,f.EPosta,f.Faks,se.SektorAdi,f.FuarYetkilisi,f.VergiNo,f.VergiDairesi,f.Profil,f.ilgilendigiFuarlar,f.ilgilendigiSalonlar from Firmalar f join Sehirler s on s.SehirID=f.SehirID join Ulkeler u on u.UlkeID=f.UlkeID join Sektorler se on se.SektorID=f.SektorID", connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                List<Firma> firmalar = new List<Firma>();
                while (reader.Read())
                {
                    firmalar.Add(
                    new Firma
                    {
                        FirmaID = (int)reader["FirmaID"],
                        FirmaAdi = (string)reader["FirmaAdi"],
                        SehirAdi = (string)reader["SehirAdi"],
                        UlkeAdi = (string)reader["UlkeAdi"],
                        Adres = (string)reader["Adres"],
                        Yetkilisi = (string)reader["Yetkilisi"],
                        YetkiliUnvani = (string)reader["YetkiliUnvani"],
                        Telefon = (string)reader["Telefon"],
                        Dahili = (string)reader["Dahili"],
                        DirektTel = (string)reader["DirektTel"],
                        EPosta = (string)reader["EPosta"],
                        Faks = (string)reader["Faks"],
                        SektorAdi = (string)reader["SektorAdi"],
                        FuarYetkilisi = (string)reader["FuarYetkilisi"],
                        VergiNo = (string)reader["VergiNo"],
                        VergiDairesi = (string)reader["VergiDairesi"],
                        Profil = (string)reader["Profil"],
                        ilgilendigiFuarlar = (string)reader["ilgilendigiFuarlar"],
                        ilgilendigiSalonlar = (string)reader["ilgilendigiSalonlar"]
                    }
                    );

                }
                return firmalar;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public Teklif GetOffer(int Id)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("select t.TeklifID,t.Tarih,t.SalonNo,t.StandKodu,t.TeklifVerilenm2,t.m2BirimFiyati,t.DovizCinsi,t.DovizKuru,t.VadeSayisi,t.OdemePlani,t.SonTarih,f.FirmaAdi from Teklifler t join Firmalar f on f.FirmaID=t.FirmaID Where TeklifID=@ID", connection);

            command.Parameters.AddWithValue("@ID", Id);

            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    Teklif teklif = new Teklif
                    {
                        TeklifID = (int)reader["TeklifID"],
                        Tarih = (DateTime)reader["Tarih"],
                        SalonNo = (int)reader["SalonNo"],
                        StandKodu = (int)reader["StandKodu"],
                        TeklifVerilenm2 = (int)reader["TeklifVerilenm2"],
                        m2BirimFiyati = (decimal)reader["m2BirimFiyati"],
                        DovizCinsi = (string)reader["DovizCinsi"],
                        DovizKuru = (int)reader["DovizKuru"],
                        VadeSayisi = (int)reader["VadeSayisi"],
                        OdemePlani = (string)reader["OdemePlani"],
                        SonTarih = (DateTime)reader["SonTarih"],
                        FirmaAdi = (string)reader["FirmaAdi"]
                    };
                    return teklif;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public List<Teklif> ListOffers()
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("select t.TeklifID,t.Tarih,t.SalonNo,t.StandKodu,t.TeklifVerilenm2,t.m2BirimFiyati,t.DovizCinsi,t.DovizKuru,t.VadeSayisi,t.OdemePlani,t.SonTarih,f.FirmaAdi from Teklifler t join Firmalar f on f.FirmaID=t.FirmaID", connection);
            try
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                List<Teklif> teklifler = new List<Teklif>();
                while (reader.Read())
                {
                    
                    teklifler.Add(
                    new Teklif
                    {
                        TeklifID = (int)reader["TeklifID"],
                        Tarih = (DateTime)reader["Tarih"],
                        SalonNo = (int)reader["SalonNo"],
                        StandKodu = (int)reader["StandKodu"],
                        TeklifVerilenm2 = (int)reader["TeklifVerilenm2"],
                        m2BirimFiyati = (decimal)reader["m2BirimFiyati"],
                        DovizCinsi = (string)reader["DovizCinsi"],
                        DovizKuru = (int)reader["DovizKuru"],
                        VadeSayisi = (int)reader["VadeSayisi"],
                        OdemePlani = (string)reader["OdemePlani"],
                        SonTarih = (DateTime)reader["SonTarih"],
                        FirmaAdi = (string)reader["FirmaAdi"]
                    }
                    );
                }
                return teklifler;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                connection.Close();
            }
        }

        public int DeleteOffer(int id)
        {
            SqlConnection connection = new SqlConnection(this.connectionString);
            SqlCommand command = new SqlCommand("Delete From Teklifler Where TeklifID=@ID", connection);
            command.Parameters.AddWithValue("@ID", id);
            int sonuc = 0;
            try
            {
                if (connection.State == ConnectionState.Closed)
                    connection.Open();
                sonuc = command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                command.Dispose();
                connection.Close();
            }
            return sonuc;
        }

        public bool UpdateOffer(Teklif teklif)
        {
            SqlConnection connection = new SqlConnection("Data Source=.;Initial Catalog=FairWorks;User ID=sa;Password=123");
            SqlCommand command = new SqlCommand("Update Teklifler Set Tarih=@TARIH,SalonNo=@SNO,StandKodu=@SKOD,TeklifVerilenm2=@TVM2,m2BirimFiyati=@M2BF,DovizCinsi=@DC,DovizKuru=@DK,VadeSayisi=@VS,OdemePlani=@OP,SonTarih=@ST Where TeklifID=@TID", connection);
            command.Parameters.AddWithValue("@TARIH", teklif.Tarih);
            command.Parameters.AddWithValue("@SNO", teklif.SalonNo);
            command.Parameters.AddWithValue("@SKOD", teklif.StandKodu);
            command.Parameters.AddWithValue("@TVM2", teklif.TeklifVerilenm2);
            command.Parameters.AddWithValue("@M2BF", teklif.m2BirimFiyati);
            command.Parameters.AddWithValue("@DC", teklif.DovizCinsi);
            command.Parameters.AddWithValue("@DK", teklif.DovizKuru);
            command.Parameters.AddWithValue("@VS", teklif.VadeSayisi);
            command.Parameters.AddWithValue("@OP", teklif.OdemePlani);
            command.Parameters.AddWithValue("@ST", teklif.SonTarih);
            command.Parameters.AddWithValue("@TID", teklif.TeklifID);
            bool sonuc = false;
            try
            {
                connection.Open();
                sonuc = command.ExecuteNonQuery() > 0 ? true : false;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                connection.Close();
            }
            return sonuc;
        }

    }

}
