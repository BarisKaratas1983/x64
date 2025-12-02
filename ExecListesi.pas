unit ExecListesi;

interface

uses
  Vcl.Forms, TiplerOrtakUnit, System.Classes, System.SysUtils, Winapi.Windows;

type
  EDLLLoadError = class(Exception);

  TXBoyaBosModalView = function(var AOrtakBilgi: TOrtakBilgi): boolean;

var
  XBoyaBosModalView: TXBoyaBosModalView;

function DLLYukle(AOrtakBilgi: TOrtakBilgi; DllName, UnitName: string): Pointer; overload;

function ExecProgramaGiris(var AOrtakBilgi: TOrtakBilgi): boolean;

implementation

function DLLYukle(AOrtakBilgi: TOrtakBilgi; DllName, UnitName: string): Pointer; overload;
var
  S: string;
  I: integer;
  DllList: TStringList;
  DllNameList: TStringList;
  Dosya: THandle;
  OkunanDeger: ^Cardinal;
  LibHandle: THandle;
  BackSlashTemizleHesapla: string;
  MydxInitialize: procedure; stdcall;
begin
  if UpperCase(DllName) = 'EB01SUPERREPORT.DLL' then
    DllName := 'EB01SuperReportXE.Dll';

  BackSlashTemizleHesapla := BackSlashTemizle(ExtractFilePath(Paramstr(0)));
  Dosya := OpenFileMapping(FILE_MAP_READ, False, PChar(BackSlashTemizleHesapla + 'DllList'));

  if Dosya <> 0 then
    OkunanDeger := MapViewOfFile(Dosya, FILE_MAP_READ, 0, 0, 0)
  else
    raise EDLLLoadError.Create(BackSlashTemizleHesapla + 'DllList Ortak Memory''de Bulunamadý');

  if OkunanDeger^ > 0 then
    DllList := TStringList(OkunanDeger^)
  else
    raise EDLLLoadError.Create(BackSlashTemizleHesapla + 'DllList için Ortak Memory''de Deðer Yok');

  CloseHandle(Dosya);

  Dosya := OpenFileMapping(FILE_MAP_READ, False, PChar(BackSlashTemizleHesapla + 'DllNameList'));

  if Dosya <> 0 then
    OkunanDeger := MapViewOfFile(Dosya, FILE_MAP_READ, 0, 0, 0)
  else
    raise EDLLLoadError.Create(BackSlashTemizleHesapla + 'DllNameList Ortak Memory''de Bulunamadý');

  if OkunanDeger^ > 0 then
    DllNameList := TStringList(OkunanDeger^)
  else
    raise EDLLLoadError.Create(BackSlashTemizleHesapla + 'DllNameList için Ortak Memory''de Deðer Yok');

  CloseHandle(Dosya);

  LibHandle := 0;

  for I := 0 to DllNameList.Count - 1 do
  begin
    S := Uppercase(DllNameList.Strings[I]);

    if S = UpperCase(DllName) then
    begin
      LibHandle := THandle(StrToInt64(DllList.Strings[I]));
      break;
    end;
  end;

  if LibHandle = 0 then
  begin
    LibHandle := LoadLibrary(PChar(DllName));

    @MydxInitialize := GetProcAddress(LibHandle, 'dxInitialize');
    MydxInitialize;

    if LibHandle = HINSTANCE_ERROR then
      raise EDLLLoadError.Create(DllName + '=' + ' Bulunamadý')
    else
    begin
      DllList.Add(IntToStr(LibHandle));
      DllNameList.Add(DllName);
    end;
  end;

  Result := GetProcAddress(LibHandle, PChar(UnitName));

  if Result = nil then
    raise EDLLLoadError.Create(DllName + ' ''de ' + UnitName + ' Bulunamadý. Code:' + IntToStr(GetLastError));

  if Assigned(AOrtakBilgi) then
    AOrtakBilgi.DllAdi := DllName;
end;

function ExecProgramaGiris(var AOrtakBilgi: TOrtakBilgi): boolean;
begin
  @XBoyaBosModalView := DllYukle(AOrtakBilgi, 'x64Dll.Dll', 'ExecProgramaGiris');
  Result := XBoyaBosModalView(AOrtakBilgi);
end;

end.

