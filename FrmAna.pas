unit FrmAna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, TFlatMemoUnit, TFlatButtonUnit, Vcl.ExtCtrls, TFlatPanelUnit,
  ExecListesi, TiplerOrtakUnit, Datasnap.DBClient, Data.DB,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect;

type
  TForm1 = class(TForm)
    FlatPanel1: TFlatPanel;
    btnDll: TFlatButton;
    SocketConnection1: TSocketConnection;
    ConnectionBroker1: TConnectionBroker;
    procedure btnDllClick(Sender: TObject);
  private
    { Private declarations }
    OrtakBilgi: TOrtakBilgi;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDllClick(Sender: TObject);
begin
  if not Assigned(OrtakBilgi) then
  begin
    OrtakBilgi := TOrtakBilgi.CreateX(1, Application.Handle, Self, ConnectionBroker1, PSL, IniFileName, IniFileNameListe);
    OrtakBilgi.Name := 'OrtakBilgi';
    OrtakBilgi.tmrOtomatikKapat.Enabled := False;
  end;

  ExecProgramaGiris(OrtakBilgi);
end;

end.

