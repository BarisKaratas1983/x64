inherited frmDBXBoyaBosModalView: TfrmDBXBoyaBosModalView
  Caption = 'frmDBXBoyaBosModalView'
  ClientHeight = 298
  ClientWidth = 401
  ExplicitWidth = 417
  ExplicitHeight = 337
  TextHeight = 15
  inherited Label1: TLabel
    Width = 401
  end
  object fbTest: TFlatButton
    Left = 8
    Top = 265
    Width = 385
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = fbTestClick
  end
  object memoLog: TFlatMemo
    Left = 8
    Top = 21
    Width = 385
    Height = 238
    ColorFlat = clBtnFace
    ParentColor = True
    TabOrder = 1
    Lines.Strings = (
      'memoLog')
  end
end
