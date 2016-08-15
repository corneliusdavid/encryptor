unit EncryptorMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, LbClass, LbCipher;

type
  TfrmEncryptor = class(TForm)
    LbBlowfish: TLbBlowfish;
    Lb3DES: TLb3DES;
    LbRijndael: TLbRijndael;
    edtSymmetricString: TEdit;
    btnLBSymmetricDecrypt: TButton;
    Label4: TLabel;
    edtLBSymmetricResult: TEdit;
    btnCopyLBSymmetricResult: TButton;
    btnLBSymmetricEncrypt: TButton;
    Label8: TLabel;
    edtSymmetricPassphrase: TEdit;
    Label2: TLabel;
    radAlgorithm: TRadioGroup;
    pnlKeys: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    btnGeneratePassphraseKey: TButton;
    btnGenerateRandomKey: TButton;
    radCipherMode: TRadioGroup;
    radAESKeySize: TRadioGroup;
    lblKey: TLabel;
    btnAbout: TButton;
    dlgAbout: TTaskDialog;
    procedure btnCopyLBSymmetricResultClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure btnGeneratePassphraseKeyClick(Sender: TObject);
    procedure btnGenerateRandomKeyClick(Sender: TObject);
    procedure btnLBSymmetricEncryptClick(Sender: TObject);
    procedure btnLBSymmetricDecryptClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
  private
    FKeyGenerated: Boolean;
    procedure CopyToClipboard(EditControl: TEdit);
    procedure SetKeyGenerated(const Value: Boolean);
    property KeyGenerated: Boolean read FKeyGenerated write SetKeyGenerated;
    procedure SetupCipherMode;
  end;

var
  frmEncryptor: TfrmEncryptor;


implementation

{$R *.DFM}


procedure TfrmEncryptor.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  FKeyGenerated := False;

  // make sure all the page controls start with their first tab selected to look nice
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TPageControl then
      TPageControl(Components[i]).ActivePageIndex := 0;
end;

procedure TfrmEncryptor.CopyToClipboard(EditControl: TEdit);
begin
  EditControl.SelectAll;
  EditControl.CopyToClipboard;
  EditControl.SelLength := 0;
end;

procedure TfrmEncryptor.btnAboutClick(Sender: TObject);
begin
  dlgAbout.Execute;
end;

procedure TfrmEncryptor.btnCopyLBSymmetricResultClick(Sender: TObject);
begin
  CopyToClipboard(edtLBSymmetricResult);
end;

procedure TfrmEncryptor.edtKeyChange(Sender: TObject);
begin
  btnLBSymmetricEncrypt.Enabled := FKeyGenerated;
  btnLBSymmetricDecrypt.Enabled := FKeyGenerated;
end;

procedure TfrmEncryptor.btnGeneratePassphraseKeyClick(Sender: TObject);
var
  s: string;
begin
  case radAlgorithm.ItemIndex of
    0: {$IFDEF UNICODE} lbBlowfish.GenerateKeyW(edtSymmetricPassphrase.Text); {$ELSE} lbBlowfish.GenerateKey(edtSymmetricPassphrase.Text); {$ENDIF}
    1: {$IFDEF UNICODE} lb3DES.GenerateKeyW(edtSymmetricPassphrase.Text); {$ELSE} lb3DES.GenerateKey(edtSymmetricPassphrase.Text); {$ENDIF}
    2: begin
         {$IFDEF UNICODE} lbRijndael.GenerateKeyW(edtSymmetricPassphrase.Text); {$ELSE} lbRijndael.GenerateKey(edtSymmetricPassphrase.Text); {$ENDIF}
         lblKey.Caption := s;
       end;
  end;
  KeyGenerated := True;
end;

procedure TfrmEncryptor.btnGenerateRandomKeyClick(Sender: TObject);
begin
  case radAlgorithm.ItemIndex of
    0: lbBlowfish.GenerateRandomKey;
    1: lb3DES.GenerateRandomKey;
    2: lbRijndael.GenerateRandomKey;
  end;
  KeyGenerated := True;
end;

procedure TfrmEncryptor.SetKeyGenerated(const Value: Boolean);
begin
  FKeyGenerated := Value;
  btnLBSymmetricEncrypt.Enabled := Value;
  btnLBSymmetricDecrypt.Enabled := Value;
end;

procedure TfrmEncryptor.SetupCipherMode;
begin
  case radCipherMode.ItemIndex of
    0:
      begin
        LbBlowfish.CipherMode := cmECB;
        Lb3DES.CipherMode := cmECB;
        LbRijndael.CipherMode := cmECB;
      end;
    1:
      begin
        LbBlowfish.CipherMode := cmCBC;
        Lb3DES.CipherMode := cmCBC;
        LbRijndael.CipherMode := cmCBC;
      end;
  end;
end;

var
  AES_KeySizes: array[0..2] of TLbKeySizeRDL = (ks128, ks192, ks256);

procedure TfrmEncryptor.btnLBSymmetricEncryptClick(Sender: TObject);
begin
  SetupCipherMode;

  case radAlgorithm.ItemIndex of
    0: edtLBSymmetricResult.Text := {$IFDEF Unicode} lbBlowfish.EncryptStringW(edtSymmetricString.Text); {$ELSE} lbBlowfish.EncryptString(edtSymmetricString.Text); {$ENDIF}
    1: edtLBSymmetricResult.Text := {$IFDEF Unicode} lb3DES.EncryptStringW(edtSymmetricString.Text); {$ELSE} lb3DES.EncryptString(edtSymmetricString.Text); {$ENDIF}
    2: begin
         LbRijndael.KeySize := AES_KeySizes[radAESKeySize.ItemIndex];
         edtLBSymmetricResult.Text := {$IFDEF Unicode} lbRijndael.EncryptStringW(edtSymmetricString.Text); {$ELSE} lbRijndael.EncryptString(edtSymmetricString.Text); {$ENDIF}
       end;
  end;
end;

procedure TfrmEncryptor.btnLBSymmetricDecryptClick(Sender: TObject);
begin
  SetupCipherMode;

  case radAlgorithm.ItemIndex of
    0: edtLBSymmetricResult.Text := {$IFDEF Unicode} lbBlowfish.DecryptStringW(edtSymmetricString.Text); {$ELSE} lbBlowfish.DecryptString(edtSymmetricString.Text); {$ENDIF}
    1: edtLBSymmetricResult.Text := {$IFDEF Unicode} lb3DES.DecryptStringW(edtSymmetricString.Text); {$ELSE} lb3DES.DecryptString(edtSymmetricString.Text); {$ENDIF}
    2: edtLBSymmetricResult.Text := {$IFDEF Unicode} lbRijndael.DecryptStringW(edtSymmetricString.Text); {$ELSE} lbRijndael.DecryptString(edtSymmetricString.Text); {$ENDIF}
  end;
end;

end.
