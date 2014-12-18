unit CPMApp_SProductionStrs;

interface

uses
  dxCore;

resourcestring
  AppDOPBaseUretimKart_ChildStokDurum = 'Stok Durum';
  AppDOPBaseUretimKart_ChildUretimEvrakBaslik = '�retim Evrak Ba�l�k';
  AppDOPBaseUretimKart_ChildUretimEvrakKaynak = '�retim Evrak Kaynak';
  AppDOPBaseUretimKart_ChildUretimKart = '�retim Kart';
  AppDOPBaseUretimKart_ChildUretimKartAjan = '�retim Kart Ajan';
  AppDOPBaseUretimKart_ChildUretimRota = 'Rota';
  AppDOPBaseUretimKart_ChildUretimRotaKaynak = 'Kaynaklar';
  AppDOPBaseUretimKart_ChildUretimRotaKaynakNot = 'Notlar';
  AppDOPBaseUretimKart_ChildUretimRotaKaynakDurus = 'Duru�lar';
  AppDOPBaseUretimKart_ChildUretimRotaKaynakHata = 'Hatalar';
  AppDOPBaseUretimKart_ChildUretimRotaKaynakIslem = '��lemler';
  AppDOPBaseUretimKart_ChildUretimRotaKaynakOperasyon = 'Operasyonlar';
  AppDOPBaseUretimKart_ChildUretimSeriKart = '�retim Seri Kart';
  AppDOPBaseUretimKart_ChildUretimSiparisHareket = '�retim Sipari� Hareket';
  AppDOPBaseUretimKart_ChildUretimStokHareket = '�retim Stok Hareket';
  AppDOPEvrakUretimIslem_ChildUretimError = 'Uyar�lar';
  AppDOPEvrakUretimIslem_ChildUretimKart = '�retim Kart';
  AppDOPEvrakUretimIslem_ChildUretimParametre = '�retim Parametre';
  AppDOPEvrakUretimIslem_ChildUretimRota = 'Rota';
  AppDOPEvrakUretimIslem_ChildUretimRotaKaynak = 'Kaynaklar';
  AppDOPEvrakUretimIslem_ChildUretimRotaKaynakDurus = 'Duru�lar';
  AppDOPEvrakUretimIslem_ChildUretimRotaKaynakHata = 'Hatalar';
  AppDOPEvrakUretimIslem_ChildUretimRotaKaynakIslem = '��lemler';
  AppDOPEvrakUretimIslem_ChildUretimRotaKaynakOperasyon = 'Operasyonlar';
  AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti = 'Evrak �retim Ba�lant�';
  AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti_WinCE = '-';
  AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslik = 'Tan�m';
  AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslikAjan = '�zleyici';
  AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynak = 'Kaynaklar';
  AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynakIslemTanim = 'Kaynak ��lem';
  AppDOPUretimTerminalAyarlar_ChildUretimTerminalPersonel = 'Personeller';
  AppGrupSUretimIslem = '�retim ��lemleri';
  AppSUretim = '�retim';
  AppSUretimIsEmri = '�retim �� Emri';
  AppSUretimIsEmriKart = '�retim �� Emri Kart�';
  AppSYenidenMaliyetlendirme = 'Yeniden Maliyetlendirme';
  AppUretimTerminalVeriGiris = '�retim Terminal Veri Giri�i';
  AppUretimTerminalAyarlar = '�retim Terminal Ayarlar�';

implementation

procedure AddResourceStringNames(AProduct: TdxProductResourceStrings);
begin
  AProduct.Add('AppDOPBaseUretimKart_ChildStokDurum', @AppDOPBaseUretimKart_ChildStokDurum);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimEvrakBaslik', @AppDOPBaseUretimKart_ChildUretimEvrakBaslik);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimEvrakKaynak', @AppDOPBaseUretimKart_ChildUretimEvrakKaynak);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimKart', @AppDOPBaseUretimKart_ChildUretimKart);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimKartAjan', @AppDOPBaseUretimKart_ChildUretimKartAjan);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRota', @AppDOPBaseUretimKart_ChildUretimRota);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynak', @AppDOPBaseUretimKart_ChildUretimRotaKaynak);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynakNot', @AppDOPBaseUretimKart_ChildUretimRotaKaynakNot);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynakDurus', @AppDOPBaseUretimKart_ChildUretimRotaKaynakDurus);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynakHata', @AppDOPBaseUretimKart_ChildUretimRotaKaynakHata);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynakIslem', @AppDOPBaseUretimKart_ChildUretimRotaKaynakIslem);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimRotaKaynakOperasyon', @AppDOPBaseUretimKart_ChildUretimRotaKaynakOperasyon);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimSeriKart', @AppDOPBaseUretimKart_ChildUretimSeriKart);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimSiparisHareket', @AppDOPBaseUretimKart_ChildUretimSiparisHareket);
  AProduct.Add('AppDOPBaseUretimKart_ChildUretimStokHareket', @AppDOPBaseUretimKart_ChildUretimStokHareket);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimError', @AppDOPEvrakUretimIslem_ChildUretimError);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimKart', @AppDOPEvrakUretimIslem_ChildUretimKart);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimParametre', @AppDOPEvrakUretimIslem_ChildUretimParametre);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRota', @AppDOPEvrakUretimIslem_ChildUretimRota);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRotaKaynak', @AppDOPEvrakUretimIslem_ChildUretimRotaKaynak);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRotaKaynakDurus', @AppDOPEvrakUretimIslem_ChildUretimRotaKaynakDurus);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRotaKaynakHata', @AppDOPEvrakUretimIslem_ChildUretimRotaKaynakHata);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRotaKaynakIslem', @AppDOPEvrakUretimIslem_ChildUretimRotaKaynakIslem);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildUretimRotaKaynakOperasyon', @AppDOPEvrakUretimIslem_ChildUretimRotaKaynakOperasyon);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti', @AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti);
  AProduct.Add('AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti_WinCE', @AppDOPEvrakUretimIslem_ChildEvrakUretimBaglanti_WinCE);
  AProduct.Add('AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslik', @AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslik);
  AProduct.Add('AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslikAjan', @AppDOPUretimTerminalAyarlar_ChildUretimTerminalBaslikAjan);
  AProduct.Add('AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynak', @AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynak);
  AProduct.Add('AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynakIslemTanim', @AppDOPUretimTerminalAyarlar_ChildUretimTerminalKaynakIslemTanim);
  AProduct.Add('AppDOPUretimTerminalAyarlar_ChildUretimTerminalPersonel', @AppDOPUretimTerminalAyarlar_ChildUretimTerminalPersonel);
  AProduct.Add('AppGrupSUretimIslem', @AppGrupSUretimIslem);
  AProduct.Add('AppSUretim', @AppSUretim);
  AProduct.Add('AppSUretimIsEmri', @AppSUretimIsEmri);
  AProduct.Add('AppSUretimIsEmriKart', @AppSUretimIsEmriKart);
  AProduct.Add('AppSYenidenMaliyetlendirme', @AppSYenidenMaliyetlendirme);
  AProduct.Add('AppUretimTerminalVeriGiris', @AppUretimTerminalVeriGiris);
  AProduct.Add('AppUretimTerminalAyarlar', @AppUretimTerminalAyarlar);
end;

initialization
  dxResourceStringsRepository.RegisterProduct('AppSProductionStrs', @AddResourceStringNames);

finalization
  dxResourceStringsRepository.UnRegisterProduct('AppSProductionStrs');

end.
