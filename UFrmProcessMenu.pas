unit UFrmProcessMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.ActnMenus, Vcl.Menus, Vcl.StdCtrls, Vcl.ButtonGroup;

type
  TfrmProcessMenu = class(TForm)
    procedure btnGroupItems0Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProcessMenu: TfrmProcessMenu;

implementation

{$R *.dfm}


procedure TfrmProcessMenu.btnGroupItems0Click(Sender: TObject);
begin
//customer registration
end;

end.
