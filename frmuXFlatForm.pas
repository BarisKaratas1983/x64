unit frmuXFlatForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, TFlatMemoUnit, TFlatButtonUnit, TFlatEditUnit, TiplerOrtakUnit;

type
  TfrmXFlatForm = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OrtakBilgi: TOrtakBilgi;
  end;

var
  frmXFlatForm: TfrmXFlatForm;

implementation

{$R *.dfm}

procedure TfrmXFlatForm.FormCreate(Sender: TObject);
begin
  Constraints.MinHeight := 100;
  Constraints.MinWidth := 100;
  label1.Caption := FormatDateTime('hh:nn:ss', Now);
end;

end.

