object frmAna: TfrmAna
  Left = 0
  Top = 0
  Caption = 'frmAna'
  ClientHeight = 387
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object FlatPanel1: TFlatPanel
    Left = 0
    Top = 0
    Width = 605
    Height = 329
    Align = alTop
    BevelOuter = bvNone
    Caption = 'FlatPanel1'
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
  end
  object btnDll: TFlatButton
    Left = 8
    Top = 354
    Width = 169
    Height = 25
    Caption = 'Dll Yukle'
    TabOrder = 1
    OnClick = btnDllClick
  end
  object SocketConnection1: TSocketConnection
    ServerGUID = '{EEFA4559-72A1-4066-B4C6-A7A8E2121D48}'
    ServerName = 'EB01DataServer.EB01RDM'
    Address = '127.0.0.1'
    Left = 84
    Top = 152
  end
  object ConnectionBroker1: TConnectionBroker
    Connection = SocketConnection1
    Left = 80
    Top = 216
  end
end
