unit frmuAna;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, TFlatMemoUnit, TFlatButtonUnit, Vcl.ExtCtrls, TFlatPanelUnit,
  ExecListesi, TiplerOrtakUnit, Datasnap.DBClient, Data.DB,
  Datasnap.Win.MConnect, Datasnap.Win.SConnect;

type
  TfrmAna = class(TForm)
    FlatPanel1: TFlatPanel;
    btnDll: TFlatButton;
    SocketConnection1: TSocketConnection;
    ConnectionBroker1: TConnectionBroker;
    procedure btnDllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    OrtakBilgi: TOrtakBilgi;
    PSL: TStringList;
    procedure Oldur;
  public
    { Public declarations }
  end;

var
  frmAna: TfrmAna;
  MapDllListHandle, MapDllNameListHandle: Thandle;
  DllNameList: TStringList;
  DllList: TStringList;

implementation

{$R *.dfm}

procedure TfrmAna.btnDllClick(Sender: TObject);
begin
  if not Assigned(OrtakBilgi) then
  begin
    OrtakBilgi := TOrtakBilgi.CreateX(1, Application.Handle, Self, ConnectionBroker1, PSL, 'Boya.Ini', 'BoyaListe.Ini');
    OrtakBilgi.Name := 'OrtakBilgi';
  end;

  ExecProgramaGiris(OrtakBilgi);
end;

procedure TfrmAna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PSL.Free;
end;

procedure TfrmAna.FormCreate(Sender: TObject);
var
  CardinalGoster: ^integer;
begin
  PSL := TStringList.Create;

  DllList := TStringList.Create;
  DllNameList := TStringList.Create;

  MapDllListHandle := 0;
  MapDllNameListHandle := 0;

  MapDllListHandle := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(Cardinal), PChar(BackSlashTemizle(ExtractFilePath(Paramstr(0))) + 'DllList'));
  CardinalGoster := MapViewOfFile(MapDllListHandle, FILE_MAP_WRITE, 0, 0, 0);
  CardinalGoster^ := Int64(DllList);

  MapDllNameListHandle := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(Cardinal), PChar(BackSlashTemizle(ExtractFilePath(Paramstr(0))) + 'DllNameList'));

  CardinalGoster := MapViewOfFile(MapDllNameListHandle, FILE_MAP_WRITE, 0, 0, 0);
  CardinalGoster^ := Int64(DllNameList);
end;

procedure TfrmAna.FormDestroy(Sender: TObject);
begin
  if Assigned(DllNameList) then
    Oldur;

  if Assigned(DllList) then
    DllList.Free;

  if Assigned(DllNameList) then
    DllNameList.free;

  if MapDllListHandle > 0 then
    CloseHandle(MapDllListHandle);

  if MapDllNameListHandle > 0 then
    CloseHandle(MapDllNameListHandle);
end;

procedure TfrmAna.Oldur;
var
  I: integer;
  LibHandle: THandle;
  MydxFinalize: procedure; stdcall;
begin
  for I := 0 to DllNameList.Count - 1 do
  begin
    LibHandle := THandle(StrToInt64(DllList.Strings[I]));
    @MydxFinalize := GetProcAddress(LibHandle, 'dxFinalize');
    MydxFinalize;
    FreeLibrary(LibHandle);
  end;
end;

end.

