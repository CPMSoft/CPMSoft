unit CPMApp_BOMStrs;

interface

uses
  dxCore;

resourcestring
  AppDOPIsMerkezKart_ChildIsMerkezKart = 'Ýþ Merkezi Kartý';
  AppDOPIsMerkezKart_ChildIsMerkezKartAjan = 'Ýþ Merkezi Kart Ýzleyici';
  AppDOPIsMerkezKart_ChildIsMerkezKaynak = 'Ýþ Merkezi Kaynaklarý';
  AppDOPMamulKart_ChildFMEAFormBaslik = 'FMEA Formu Baþlýðý';
  AppDOPMamulKart_ChildFMEAFormDetay = 'FMEA Formu Detayý';
  AppDOPMamulKart_ChildFMEAFormRevizyon = 'FMEA Formu Revizyonlarý';
  AppDOPMamulKart_ChildHammaddeAjan = 'Hammadde Ýzleyici';
  AppDOPMamulKart_ChildHammaddeStokKart = 'Hammadde Stok Kartý';
  AppDOPMamulKart_ChildKullanimAgac = 'Kullaným Aðacý';
  AppDOPMamulKart_ChildMaliyetList = 'Maliyet Listesi';
  AppDOPMamulKart_ChildMamulAgac = 'Mamül Aðacý';
  AppDOPMamulKart_ChildMamulBaslik = 'Mamül Baþlýk';
  AppDOPMamulKart_ChildMamulKart = 'Mamül Kartý';
  AppDOPMamulKart_ChildMamulKartAjan = 'Mamül Kart Ýzleyici';
  AppDOPMamulKart_ChildMamulKartData = 'Hýzlý Mamül Kart Giriþi';
  AppDOPMamulKart_ChildMamulKartDetay = 'Mamül Kartý Detayý';
  AppDOPMamulKart_ChildMamulNot = 'Mamül Notlarý';
  AppDOPMamulKart_ChildMamulRevizyon = 'Mamül Revizyon';
  AppDOPMamulKart_ChildMamulRota = 'Mamül Rotasý';
  AppDOPMamulKart_ChildMamulRotaAjan = 'Mamül Rota Ýzleyici';
  AppDOPMamulKart_ChildMamulRotaKaynak = 'Mamül Rota Kaynak';
  AppDOPMamulKart_ChildMamulRotaSonrakiOperasyon = 'Mamül Rota Sonraki Operasyon';
  AppDOPMamulKart_ChildMamulStokKart = 'Mamül Stok Kartý';
  AppDOPMamulKart_ChildMamulYanUrun = 'Yan Ürünler';
  AppDOPMamulKullanimKart_ChildMamulKullanimGrup = 'Mamül Kullaným Grubu';
  AppDOPMamulKullanimKart_ChildMamulKullanimKart = 'Mamül Kullaným Kartý';
  AppDOPMRPParametreKart_ChildMRPParametre = 'MRP Parametre';
  AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitika = 'Stok Karþýlama Politikasý';
  AppDOPStokKarsilamaPolitika_ChildStokKarsilamaPolitikaAjan = 'Stok Karþýlama Politikasý Ýzleyici';
  AppDOPUretimDurusKart_ChildUretimDurusKart = 'Operasyon Duruþ Kartý';
  AppDOPUretimDurusKart_ChildUretimDurusKartAjan = 'Duruþ Kart Ýzleyici';
  AppDOPUretimHataKart_ChildUretimHataKart = 'Operasyon Hata Kartý';
  AppDOPUretimHataKart_ChildUretimHataKartAjan = 'Hata Kart Ýzleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakDevamsizlik = 'Kaynak Devamsýzlýk';
  AppDOPUretimKaynakKart_ChildUretimKaynakKart = 'Kaynak Kartý';
  AppDOPUretimKaynakKart_ChildUretimKaynakKartAjan = 'Kaynak Kart Ýzleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakMamulDegisim = 'Kaynak Mamül Deðiþim';
  AppDOPUretimKaynakKart_ChildUretimKaynakMamulKurulum = 'Kaynak Mamül Kurulum';
  AppDOPUretimKaynakKart_ChildUretimKaynakMakine = 'Kaynak Makine Taným';
  AppDOPUretimKaynakKart_ChildUretimKaynakPersonel = 'Kaynak Personel Taným';
  AppDOPUretimKaynakKart_ChildUretimKaynakIslemTanim = 'Kaynak Ýþlem Taným';
  AppDOPUretimKaynakKart_ChildUretimKaynakDemirbas = 'Kaynak Demirbaþ';
  AppDOPUretimKaynakKart_ChildUretimKaynakAlternatifTanim = 'Kaynak Alternatif Taným';
  AppDOPUretimKaynakKart_ChildUretimKaynakAyarlar = 'Kaynak Ayarlar';
  AppDOPUretimKaynakKart_ChildUretimKaynakNot = 'Kaynak Not';
  AppDOPUretimKaynakKart_ChildUretimKaynakTakvimAjan = 'Kaynak Takvim Ýzleyici';
  AppDOPUretimKaynakKart_ChildUretimKaynakUretimDurumAjan = 'Kaynak Üretim Durum Ýzleyici';
  AppDOPUretimParametreKart_ChildUretimParametre = 'Üretim Parametre';
  AppDOPUretimTakvimKart_ChildUretimTakvimKart = 'Takvim Kartý';
  AppDOPUretimTakvimKart_ChildUretimTakvimKartAjan = 'Takvim Kartý Ýzleyici';
  AppDOPUretimTakvimKart_ChildUretimTakvimVardiya = 'Takvim Vardiya';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKart = 'Vardiya Kartý';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKartAjan = 'Vardiya Kart Ýzleyici';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaKaynak = 'Vardiya Kaynak';
  AppDOPUretimVardiyaKart_ChildUretimVardiyaSaat = 'Vardiya Saat';
  AppDOPUretimYilKart_ChildUretimYilKart = 'Yýl Kartý';
  AppDOPUretimYilKart_ChildUretimYilKartAjan = 'Yýl Kart Ýzleyici';
  AppDOPUretimYilKart_ChildUretimYilTatil = 'Yýl Tatil';

  AppDOPUretimTerminalKart_ChildUretimTerminalKart = 'Terminal Kartý';
  AppDOPUretimTerminalKart_ChildUretimTerminalKaynak = 'Terminal Kaynak';
  AppDOPUretimTerminalKart_ChildUretimTerminalPersonel = 'Terminal Personel';
  AppDOPUretimTerminalKart_ChildUretimTerminalKartAjan = 'Terminal Kart Ýzleyici';

  AppGrupUretimKurulum = 'Üretim Kurulumu';
  AppGrupUretimKurulum_Category = 'Üretim Ýþlemleri';
  AppIsMerkezKart = 'Üretim Ýþ Merkez Kartý';
  AppMamulKart = 'Mamül Kart';
  AppMamulKullanimKart = 'Mamül Kullaným Ayarlarý';
  AppMRPParametreKart = 'MRP Çalýþma Ayarlarý';
  AppStokKarsilamaPolitika = 'Stok Karþýlama Politikasý';
  AppUretimDurusKart = 'Üretim Duruþ Kartý';
  AppUretimHataKart = 'Üretim Hata Kartý';
  AppUretimKaynakKart = 'Üretim Kaynak Kartý';
  AppUretimParametreKart = 'Üretim Çalýþma Ayarlarý';
  AppUretimTakvimKart = 'Üretim Takvim Kartý';
  AppUretimVardiyaKart = 'Üretim Vardiya Kartý';
  AppUretimYilKart = 'Üretim Yýl Kartý';
  AppUretimTerminalKart = 'Üretim Terminal Kartý';

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
