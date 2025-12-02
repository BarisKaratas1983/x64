unit TiplerOrtakUnit;

interface

uses
  Vcl.Forms, System.Classes, DataSnap.DbClient;

type
  TOrtakBilgi = class(TComponent)
  private
    FKullaniciId: integer;
    FDllAdi: string;
    FAppHandle: THandle;
    FConnectionBroker: TConnectionBroker;
    procedure SetKullaniciId(const Value: integer);
    procedure SetDllAdi(const Value: string);
    procedure SetAppHandle(const Value: THandle);
    procedure SetConnectionBroker(const Value: TConnectionBroker);
  public
    constructor CreateX(AKullaniciId: integer; H: THandle; AOwner: TComponent; var AConnectionBroker: TConnectionBroker; AParams: TStringList; AIniFileName, AIniFileNameListe: string);
    destructor Destroy; override;
    property KullaniciId: integer read FKullaniciId write SetKullaniciId;
    property DllAdi: string read FDllAdi write SetDllAdi;
    property AppHandle: THandle read FAppHandle write SetAppHandle;
    property ConnectionBroker: TConnectionBroker read FConnectionBroker write SetConnectionBroker;
  end;

function BackSlashTemizle(AStr: string): string;

implementation

function BackSlashTemizle(AStr: string): string;
var
  I: integer;
begin
  Result := '';
  for I := 1 to Length(AStr) do
    if AStr[I] <> '\' then
      Result := Result + AStr[I];
end;

{ TOrtakBilgi }

constructor TOrtakBilgi.CreateX(AKullaniciId: integer; H: THandle; AOwner: TComponent; var AConnectionBroker: TConnectionBroker; AParams: TStringList; AIniFileName, AIniFileNameListe: string);
begin
  FAppHandle := H;
  FConnectionBroker := AConnectionBroker;
  FKullaniciId := AKullaniciId;
  inherited Create(AOwner);
end;

destructor TOrtakBilgi.Destroy;
begin
  inherited Destroy;
end;

procedure TOrtakBilgi.SetAppHandle(const Value: THandle);
begin
  FAppHandle := Value;
end;

procedure TOrtakBilgi.SetConnectionBroker(const Value: TConnectionBroker);
begin
  FConnectionBroker := Value;
end;

procedure TOrtakBilgi.SetDllAdi(const Value: string);
begin
  FDllAdi := Value;
end;

procedure TOrtakBilgi.SetKullaniciId(const Value: integer);
begin
  FKullaniciId := Value;
end;

end.

