object frmLog: TfrmLog
  Left = 167
  Top = 272
  Width = 534
  Height = 506
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object mmMain: TMemo
    Left = 0
    Top = 0
    Width = 526
    Height = 432
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnSave: TPngBitBtn
    Left = 392
    Top = 440
    Width = 123
    Height = 25
    Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1091' '#1092#1072#1081#1083
    TabOrder = 1
    OnClick = btnSaveClick
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      61000002AB4944415478DA8D936B48935118C7FFC7B97C9B33EFD744675E1221
      3096689999E105CDCCD4D29659860A268564525A11941F2ACA88FC1405A11614
      157421295327CD42E74CF283A12ECD4B4DD139CAEDD5B9EDEDCC3237D2E87FF8
      1F781ECEF99D731E9E4382E2F722BAB8AADEA89D8CBE7B60336A3B947011D821
      6D832F082158544BBF0A35EFBE180442A7A7638AD60AE9959279CE68000949CE
      45D4914AF6877A94795294806DD79E21C4C311B70FC6C2528DBDA3B8295342B8
      C60D1C50AB6C7E7C487EEB3C4870920411F9A759F53725D3509A0EF1C5FB08F5
      72C6BDC2642B4043CF10AA5B3FC1D9C57B21E638EEDCFB1B27AB4860620EC479
      E5ECD8483FD37822135DC3E3B05FC547B89F8715E0C150290635D3E0DBDA9937
      43DE23D1F6BD69722301F1FB109E5BC68E8C2A99D9393D783636584E8773CEC0
      8698FEC46D8A1AF4352944C47F4716C2B28FB30EABF90CCCAF5B4191E2FDB4A8
      C625406735057C1011BFB80CACCF2A61698EC13F141F53406FB00490C92F63A0
      85027C63D3119C51FC1F80A32036164FE8B800A5B45B447C62D210B8A7880DF5
      7462DC852B33EC7C2474B600C8CF029AB722E2B53515016905ECAB63290C6730
      C06058BA264737DCE9CBC477E3C84ADC6EE2B16527FC53F35969D96E46A7D541
      3F6FB05A316D1C405D7F214C9CD12A6F32F1A056394413F7A864F8A6E4B1B253
      998C6A5C0DAD6EF6AF637AB48FD03E5567951B1CDE8E8F2F5911718D4C827752
      2EDB5E99CDA826960718E9E90F872A3065502EC4C1AE1B21EBDA85CED72F44C4
      2522019E8912565610C408F8CB37915913DA515CEABD0A42474558398A9FEBA1
      90368B48D5F51A419B4ED814C01F16F36032137E7D41CBD95C4FDA631AE1A439
      C539CEB89A3EEB7DBE6E72E0C4A4BEBE7E1DCDC651AFA576A6B6FFDD13B6D4BC
      C59A51CF53CF51CF506BA8C7A85B7F02F2AE05E1AA0AC3ED0000000049454E44
      AE426082}
  end
  object dlgSave: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1110' '#1092#1072#1081#1083#1080'|*.txt'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = #1054#1073#1077#1088#1110#1090#1100' '#1085#1072#1079#1074#1091' '#1092#1072#1081#1083#1091' '#1076#1083#1103' '#1079#1073#1077#1088#1077#1078#1077#1085#1085#1103' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1110#1074' '#1079#1072#1084#1110#1085#1080
    Left = 304
    Top = 440
  end
end
