program x64Uygulama;

uses
  Vcl.Forms,
  frmuAna in 'frmuAna.pas' {frmAna},
  ExecListesi in 'ExecListesi.pas',
  TiplerOrtakUnit in 'TiplerOrtakUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAna, frmAna);
  Application.Run;
end.
