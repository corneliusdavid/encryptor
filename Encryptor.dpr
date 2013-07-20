program Encryptor;

uses
  ExceptionLog,
  Forms,
  EncryptorMain in 'EncryptorMain.pas' {frmEncryptor};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'The Encryptor!';
  Application.CreateForm(TfrmEncryptor, frmEncryptor);
  Application.Run;
end.
