unit UFrmProcessLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, Vcl.StdCtrls, System.JSON, System.Net.HttpClient,
  System.Net.URLClient, System.Net.HttpClientComponent;

type
  TfrmProcessLogin = class(TForm)
    edEmail: TEdit;
    edPassword: TEdit;
    btnLogin: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }

    function LoginFirebase(const email, password: string) : boolean;
//    function GetApiKey: string;
  public
    { Public declarations }
  end;

var
  frmProcessLogin: TfrmProcessLogin;

implementation

uses UFrmProcessMenu;

{$R *.dfm}

{function TfrmProcessLogin.GetAPIKey: string;
begin
     commented for now xD
end;}

procedure TfrmProcessLogin.btnLoginClick(Sender: TObject);
begin

  if LoginFirebase(edEmail.Text,edPassword.Text) then begin
    if not Assigned(frmProcessMenu) then
      frmProcessMenu := TfrmProcessMenu.Create(Self);

    frmProcessMenu.ShowModal;
  end;
end;

function TfrmProcessLogin.LoginFirebase(const email, password:string) : boolean;
var
  client: TNetHTTPClient;
  response: IHTTPResponse;
  jsonRequest, JSONResponse: TJSONValue;
  APIKey, URL: string;
  jsonData: TStringStream;
begin
  Result := False;
  //APIKey := GetAPIKey;
  APIKey := 'firebase api key';
  if APIKey = '' then
  begin
    ShowMessage('api key not found :c');
    Exit;
  end;

  URL := 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=' + APIKey;

   Client := TNetHTTPClient.Create(nil);
   try
    jsonData := TStringStream.Create(Format(
      '{"email":"%s","password":"%s","returnSecureToken":true}',
      [email, password]), TEncoding.UTF8);
   try
     response := Client.Post(URL, jsonData);

     jsonResponse := TJSONObject.ParseJSONValue(Response.ContentAsString);
     if Assigned(jsonResponse) then
     begin
       try
         if jsonResponse.TryGetValue('idToken', APIKey) then begin
           ShowMessage('successfuly logged! Token: ' + APIKey);
           Result := True;
         end
         else
           ShowMessage('error..: ' + Response.ContentAsString);

       finally
         jsonResponse.Free;
       end;
     end;
   finally
     jsonData.Free;
   end;
   finally
     Client.Free;
   end;
   //clear data
   edEmail.Clear;
   edPassword.Clear;
end;

end.
