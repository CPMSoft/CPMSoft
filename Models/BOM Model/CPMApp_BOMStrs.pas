unit CPMApp_BOMStrs;

interface

uses
  dxCore;

resourcestring
  AppDOPIsMerkezKart_ChildIsMerkezKart = '�� Merkezi Kart�';
  AppDOPIsMerkezKart_ChildIsMerkezKartAjan = '�� Merkezi Kart �zleyici';
  AppDOPIsMerkezKart_ChildIsMerkezKaynak = '�� Merkezi Kaynaklar�';
  AppDOPMamulKart_ChildFMEAFormBaslik = 'FMEA Formu Ba�l���';
  AppDOPMamulKart_ChildFMEAFormDetay = 'FMEA Formu Detay�';
  AppDOPMamulKart_ChildFMEAFormRevizyon = 'FMEA Formu Revizyonlar�';
  AppDOPMamulKart_ChildHammaddeAjan = 'Hammadde �zleyici';
  AppDOPMamulKart_ChildHammaddeStokKart = 'Hammadde Stok Kart�';
  AppDOPMamulKart_ChildKullanimAgac = 'Kullan�m A�ac�';
  AppDOPMamulKart_ChildMaliyetList = 'Maliyet Listesi';
  AppDOPMamulKart_ChildMamulAgac = 'Mam�l A�ac�';
  AppDOPMamulKart_ChildMamulBaslik = 'Mam�l Ba�l�k';
  AppDOPMamulKart_ChildMamulKart = 'Mam�l Kart�';
  AppDOPMamulKart_ChildMamulKartAjan = 'Mam�l Kart �zleyici';
  AppDOPMamulKart_ChildMamulKartData = 'H�zl� Mam�l Kart Giri�i';
  AppDOPMamulKart_ChildMamulKartDetay = 'Mam�l Kart� Detay�';
  AppDOPMamulKart_ChildMamulNot = 'Mam�l Notlar�';
  AppDOPMamulKart_ChildMamulRevizyon = 'Mam�l Revizyon';
  AppDOPMamulKart_ChildMamulRota = 'Mam�l Rotas�';
  AppDOPMamulKart_ChildMamulRotaAjan = 'Mam�l Rota �zleyici';
  AppDOPMamulKart_ChildMamulRotaKaynak = 'Mam�l Rota Kaynak';
  AppDOPMamulKart_ChildMamulRotaSonrakiOperasyon = 'Mam�l Rota Sonraki Operasyon';
  AppDOPMamulKart_ChildMamulStokKart = 'Mam�l Stok Kart�';
  AppDOPMamulKart_ChildMamulYanUrun = 'Yan �r�nler';
  AppDOPMamulKullanimKart_ChildMamulKullanimGrup = 'Mam�l Kullan�m Grubu';
  AppDOPMamulKullanimKart_ChildMamulKullanimKart = 'Mam�l Kullan�m Kart�';
  AppDOPMRPParametreKart_ChildMRPParametre = 'MRP Parametre';
  AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika = 'Stok Kar��lama Politikas�';
  AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan = 'Stok Kar��lama Politikas� �zleyici';
  AppDOPUretimDurusKart_ChildUretimDurusKart = 'Operasyon Duru� Kart�';
  AppDOPUretimDurusKart_ChildUretimDurusKartAjan = 'Duru� Kart �zleyici';
  AppDOPUretimHataKart_ChildUretimHataKart = 'Operasyon Hata Kart�';
  AppDOPUretimHataKart_ChildUretimHataKartAjan = 'Hata Kart �zleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik = 'Kaynak Devams�zl�k';
  AppDOPUretimKaynakKart_ChildUretimKaynakKart = 'Kaynak Kart�';
  AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan = 'Kaynak Kart �zleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim = 'Kaynak Mam�l De�i�im';
  AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum = 'Kaynak Mam�l Kurulum';
  AppDOPUretimKaynakKart_ChildUretimKaynakMakine = 'Kaynak Makine Tan�m';
  AppDOPUretimKaynakKart_ChildUretimKaynakPersonel = 'Kaynak Personel Tan�m';
  AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim = 'Kaynak ��lem Tan�m';
  AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas = 'Kaynak Demirba�';
  AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim = 'Kaynak Alternatif Tan�m';
  AppDOPUretimKaynakKart_ChildUretimKaynakAyarlar = 'Kaynak Ayarlar';
  AppDOPUretimKaynakKart_ChildUretimKaynakNot = 'Kaynak Not';
  AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan = 'Kaynak Takvim �zleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumAjan = 'Kaynak �retim Durum �zleyici';
  AppDOPUretimParametreKart_ChildUretimParametre = '�retim Parametre';
  AppDOPUretimTakvimKart_ChildUretimTakvimKart = 'Takvim Kart�';
  AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan = 'Takvim Kart� �zleyici';
  AppDOPUretimTakvimKart_ChildUretimTakvimVardiya = 'Takvim Vardiya';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKart = 'Vardiya Kart�';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan = 'Vardiya Kart �zleyici';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak = 'Vardiya Kaynak';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat = 'Vardiya Saat';
  AppDOPUretimYilKart_ChildUretimYilKart = 'Y�l Kart�';
  AppDOPUretimYilKart_ChildUretimYilKartAjan = 'Y�l Kart �zleyici';
  AppDOPUretimYilKart_ChildUretimYilTatil = 'Y�l Tatil';

  AppDOPUretimTerminalKart_ChildUretimTerminalKart = 'Terminal Kart�';
  AppDOPUretimTerminalKart_ChildUretimTerminalKaynak = 'Terminal Kaynak';
  AppDOPUretimTerminalKart_ChildUretimTerminalPersonel = 'Terminal Personel';
  AppDOPUretimTerminalKart_ChildUretimTerminalKartAjan = 'Terminal Kart �zleyici';

  AppGrupUretimKurulum = '�retim Kurulumu';
  AppGrupUretimKurulum_Category = '�retim ��lemleri';
  AppIsMerkezKart = '�retim �� Merkez Kart�';
  AppMamulKart = 'Mam�l Kart';
  AppMamulKullanimKart = 'Mam�l Kullan�m Ayarlar�';
  AppMRPParametreKart = 'MRP �al��ma Ayarlar�';
  AppStokKarsilamaPolitika = 'Stok Kar��lama Politikas�';
  AppUretimDurusKart = '�retim Duru� Kart�';
  AppUretimHataKart = '�retim Hata Kart�';
  AppUretimKaynakKart = '�retim Kaynak Kart�';
  AppUretimParametreKart = '�retim �al��ma Ayarlar�';
  AppUretimTakvimKart = '�retim Takvim Kart�';
  AppUretimVardiyaKart = '�retim Vardiya Kart�';
  AppUretimYilKart = '�retim Y�l Kart�';
  AppUretimTerminalKart = '�retim Terminal Kart�';

implementation

procedure AddResourceStringNames(AProduct: TdxProductResourceStrings);
begin
  AProduct.Add('AppDOPIsMerkezKart_ChildIsMerkezKart', @AppDOPIsMerkezKart_ChildIsMerkezKart);
  AProduct.Add('AppDOPIsMerkezKart_ChildIsMerkezKartAjan', @AppDOPIsMerkezKart_ChildIsMerkezKartAjan);
  AProduct.Add('AppDOPIsMerkezKart_ChildIsMerkezKaynak', @AppDOPIsMerkezKart_ChildIsMerkezKaynak);
  AProduct.Add('AppDOPMamulKart_ChildFMEAFormBaslik', @AppDOPMamulKart_ChildFMEAFormBaslik);
  AProduct.Add('AppDOPMamulKart_ChildFMEAFormDetay', @AppDOPMamulKart_ChildFMEAFormDetay);
  AProduct.Add('AppDOPMamulKart_ChildFMEAFormRevizyon', @AppDOPMamulKart_ChildFMEAFormRevizyon);
  AProduct.Add('AppDOPMamulKart_ChildHammaddeAjan', @AppDOPMamulKart_ChildHammaddeAjan);
  AProduct.Add('AppDOPMamulKart_ChildHammaddeStokKart', @AppDOPMamulKart_ChildHammaddeStokKart);
  AProduct.Add('AppDOPMamulKart_ChildKullanimAgac', @AppDOPMamulKart_ChildKullanimAgac);
  AProduct.Add('AppDOPMamulKart_ChildMaliyetList', @AppDOPMamulKart_ChildMaliyetList);
  AProduct.Add('AppDOPMamulKart_ChildMamulAgac', @AppDOPMamulKart_ChildMamulAgac);
  AProduct.Add('AppDOPMamulKart_ChildMamulBaslik', @AppDOPMamulKart_ChildMamulBaslik);
  AProduct.Add('AppDOPMamulKart_ChildMamulKart', @AppDOPMamulKart_ChildMamulKart);
  AProduct.Add('AppDOPMamulKart_ChildMamulKartAjan', @AppDOPMamulKart_ChildMamulKartAjan);
  AProduct.Add('AppDOPMamulKart_ChildMamulKartData', @AppDOPMamulKart_ChildMamulKartData);
  AProduct.Add('AppDOPMamulKart_ChildMamulKartDetay', @AppDOPMamulKart_ChildMamulKartDetay);
  AProduct.Add('AppDOPMamulKart_ChildMamulNot', @AppDOPMamulKart_ChildMamulNot);
  AProduct.Add('AppDOPMamulKart_ChildMamulRevizyon', @AppDOPMamulKart_ChildMamulRevizyon);
  AProduct.Add('AppDOPMamulKart_ChildMamulRota', @AppDOPMamulKart_ChildMamulRota);
  AProduct.Add('AppDOPMamulKart_ChildMamulRotaAjan', @AppDOPMamulKart_ChildMamulRotaAjan);
  AProduct.Add('AppDOPMamulKart_ChildMamulRotaKaynak', @AppDOPMamulKart_ChildMamulRotaKaynak);
  AProduct.Add('AppDOPMamulKart_ChildMamulRotaSonrakiOperasyon', @AppDOPMamulKart_ChildMamulRotaSonrakiOperasyon);
  AProduct.Add('AppDOPMamulKart_ChildMamulStokKart', @AppDOPMamulKart_ChildMamulStokKart);
  AProduct.Add('AppDOPMamulKart_ChildMamulYanUrun', @AppDOPMamulKart_ChildMamulYanUrun);
  AProduct.Add('AppDOPMamulKullanimKart_ChildMamulKullanimGrup', @AppDOPMamulKullanimKart_ChildMamulKullanimGrup);
  AProduct.Add('AppDOPMamulKullanimKart_ChildMamulKullanimKart', @AppDOPMamulKullanimKart_ChildMamulKullanimKart);
  AProduct.Add('AppDOPMRPParametreKart_ChildMRPParametre', @AppDOPMRPParametreKart_ChildMRPParametre);
  AProduct.Add('AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika', @AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika);
  AProduct.Add('AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan', @AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan);
  AProduct.Add('AppDOPUretimDurusKart_ChildUretimDurusKart', @AppDOPUretimDurusKart_ChildUretimDurusKart);
  AProduct.Add('AppDOPUretimDurusKart_ChildUretimDurusKartAjan', @AppDOPUretimDurusKart_ChildUretimDurusKartAjan);
  AProduct.Add('AppDOPUretimHataKart_ChildUretimHataKart', @AppDOPUretimHataKart_ChildUretimHataKart);
  AProduct.Add('AppDOPUretimHataKart_ChildUretimHataKartAjan', @AppDOPUretimHataKart_ChildUretimHataKartAjan);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik', @AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakKart', @AppDOPUretimKaynakKart_ChildUretimKaynakKart);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan', @AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim', @AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum', @AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakMakine', @AppDOPUretimKaynakKart_ChildUretimKaynakMakine);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakPersonel', @AppDOPUretimKaynakKart_ChildUretimKaynakPersonel);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim', @AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas', @AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim', @AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakAyarlar', @AppDOPUretimKaynakKart_ChildUretimKaynakAyarlar);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakNot', @AppDOPUretimKaynakKart_ChildUretimKaynakNot);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan', @AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan);
  AProduct.Add('AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumAjan', @AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumAjan);
  AProduct.Add('AppDOPUretimParametreKart_ChildUretimParametre', @AppDOPUretimParametreKart_ChildUretimParametre);
  AProduct.Add('AppDOPUretimTakvimKart_ChildUretimTakvimKart', @AppDOPUretimTakvimKart_ChildUretimTakvimKart);
  AProduct.Add('AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan', @AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan);
  AProduct.Add('AppDOPUretimTakvimKart_ChildUretimTakvimVardiya', @AppDOPUretimTakvimKart_ChildUretimTakvimVardiya);
  AProduct.Add('AppDOPUretimVardiyaKart_ChildUretimVardiyaKart', @AppDOPUretimVardiyaKart_ChildUretimVardiyaKart);
  AProduct.Add('AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan', @AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan);
  AProduct.Add('AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak', @AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak);
  AProduct.Add('AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat', @AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat);
  AProduct.Add('AppDOPUretimYilKart_ChildUretimYilKart', @AppDOPUretimYilKart_ChildUretimYilKart);
  AProduct.Add('AppDOPUretimYilKart_ChildUretimYilKartAjan', @AppDOPUretimYilKart_ChildUretimYilKartAjan);
  AProduct.Add('AppDOPUretimYilKart_ChildUretimYilTatil', @AppDOPUretimYilKart_ChildUretimYilTatil);
  AProduct.Add('AppDOPUretimTerminalKart_ChildUretimTerminalKart', @AppDOPUretimTerminalKart_ChildUretimTerminalKart);
  AProduct.Add('AppDOPUretimTerminalKart_ChildUretimTerminalKartAjan', @AppDOPUretimTerminalKart_ChildUretimTerminalKartAjan);
  AProduct.Add('AppDOPUretimTerminalKart_ChildUretimTerminalPersonel', @AppDOPUretimTerminalKart_ChildUretimTerminalPersonel);
  AProduct.Add('AppDOPUretimTerminalKart_ChildUretimTerminalKaynak', @AppDOPUretimTerminalKart_ChildUretimTerminalKaynak);
  AProduct.Add('AppGrupUretimKurulum', @AppGrupUretimKurulum);
  AProduct.Add('AppGrupUretimKurulum_Category', @AppGrupUretimKurulum_Category);
  AProduct.Add('AppIsMerkezKart', @AppIsMerkezKart);
  AProduct.Add('AppMamulKart', @AppMamulKart);
  AProduct.Add('AppMamulKullanimKart', @AppMamulKullanimKart);
  AProduct.Add('AppMRPParametreKart', @AppMRPParametreKart);
  AProduct.Add('AppStokKarsilamaPolitika', @AppStokKarsilamaPolitika);
  AProduct.Add('AppUretimDurusKart', @AppUretimDurusKart);
  AProduct.Add('AppUretimHataKart', @AppUretimHataKart);
  AProduct.Add('AppUretimKaynakKart', @AppUretimKaynakKart);
  AProduct.Add('AppUretimParametreKart', @AppUretimParametreKart);
  AProduct.Add('AppUretimTakvimKart', @AppUretimTakvimKart);
  AProduct.Add('AppUretimVardiyaKart', @AppUretimVardiyaKart);
  AProduct.Add('AppUretimYilKart', @AppUretimYilKart);
  AProduct.Add('AppUretimTerminalKart', @AppUretimTerminalKart);
end;

initialization
  dxResourceStringsRepository.RegisterProduct('AppBOMStrs', @AddResourceStringNames);

finalization
  dxResourceStringsRepository.UnRegisterProduct('AppBOMStrs');

end.
