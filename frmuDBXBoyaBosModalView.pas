unit frmuDBXBoyaBosModalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  frmuXFlatForm, Vcl.StdCtrls, TFlatMemoUnit, TFlatButtonUnit, TFlatEditUnit,
  TiplerOrtakUnit;

type
  TfrmDBXBoyaBosModalView = class(TfrmXFlatForm)
    fbTest: TFlatButton;
    memoLog: TFlatMemo;
    procedure fbTestClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function Execute: boolean; virtual;
    procedure Initialize; virtual;
  public
    { Public declarations }
    constructor CreateX(var AOrtakBilgi: TOrtakBilgi);
  end;

  TfrmDBXBosModalViewClass = class of TfrmDBXBoyaBosModalView;

var
  frmDBXBoyaBosModalView: TfrmDBXBoyaBosModalView;

function ExecDBXBosModalView(var AOrtakBilgi: TOrtakBilgi; AfrmDBXBosModalViewClass: TfrmDBXBosModalViewClass): boolean;

implementation

{$R *.dfm}

function ExecDBXBosModalView(var AOrtakBilgi: TOrtakBilgi; AfrmDBXBosModalViewClass: TfrmDBXBosModalViewClass): boolean;
begin
  with AfrmDBXBosModalViewClass.CreateX(AOrtakBilgi) do
  try
    Result := False;
    Result := Execute;
  finally
    Free;
  end;
end;

{ TfrmDBXBoyaBosModalView }

constructor TfrmDBXBoyaBosModalView.CreateX(var AOrtakBilgi: TOrtakBilgi);
begin
  OrtakBilgi := AOrtakBilgi;
  Visible := False;
  inherited Create(AOrtakBilgi.Owner);
end;

function TfrmDBXBoyaBosModalView.Execute: boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TfrmDBXBoyaBosModalView.fbTestClick(Sender: TObject);
begin
  inherited;
  memoLog.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' TfrmDBXBoyaBosModalView');
end;

procedure TfrmDBXBoyaBosModalView.Initialize;
begin
  //
end;

end.

