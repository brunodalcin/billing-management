program BillingManagement;

uses
  Vcl.Forms,
  UFrmProcessLogin in 'UFrmProcessLogin.pas' {frmProcessLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProcessLogin, frmProcessLogin);
  Application.Run;
end.
