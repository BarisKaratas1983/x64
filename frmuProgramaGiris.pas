unit frmuProgramaGiris;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  frmuDBXBoyaBosModalView, Vcl.StdCtrls, TFlatMemoUnit, TFlatButtonUnit;

type
  TfrmProgramaGiris = class(TfrmDBXBoyaBosModalView)
    procedure fbTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgramaGiris: TfrmProgramaGiris;

implementation

{$R *.dfm}

procedure TfrmProgramaGiris.fbTestClick(Sender: TObject);
begin
  inherited;
  memoLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' ' + Self.Name);
end;

end.

