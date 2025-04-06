program BillingManagement;

uses
  Vcl.Forms,
  UFrmProcessLogin in 'UFrmProcessLogin.pas' {frmProcessLogin},
  UFrmProcessMenu in 'UFrmProcessMenu.pas' {frmProcessMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProcessLogin, frmProcessLogin);
  Application.CreateForm(TfrmProcessMenu, frmProcessMenu);
  Application.Run;
end.
