object DataModule1: TDataModule1
  OldCreateOrder = False
  Encoding = esUtf8
  QueuedRequest = False
  Height = 460
  Width = 683
  object DWServerEvents1: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        NeedAuthorization = True
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'result'
            Encoded = False
          end>
        JsonMode = jmPureJSON
        Name = 'teste'
        EventName = 'teste'
        OnlyPreDefinedParams = False
        OnReplyEvent = DWServerEvents1EventstesteReplyEvent
      end>
    Left = 536
    Top = 272
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=E:\THULIO BITTERNCOURT\Clube dos Programadores Delphi\P' +
        'DVUPDATES.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 200
    Top = 56
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 424
    Top = 56
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 304
    Top = 56
  end
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 192
    Top = 272
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    CommitRecords = 100
    Connection = FDConnection1
    Left = 364
    Top = 272
  end
end
