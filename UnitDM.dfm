object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 444
  Width = 640
  PixelsPerInch = 96
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://api.apilayer.com/exchangerates_data'
    Params = <>
    SecureProtocols = [SSL2, SSL3]
    Left = 184
    Top = 16
  end
  object RESTRequestSymbols: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'apikey'
        Value = 'LVkXYOZSMEmvVIVnNiqHfPQFFqwF75z4'
      end>
    Resource = 'symbols'
    Response = RESTResponse1
    Left = 72
    Top = 72
  end
  object RESTResponse1: TRESTResponse
    Left = 72
    Top = 128
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    TypesMode = Rich
    Left = 72
    Top = 184
  end
  object FDMemTable1: TFDMemTable
    Filtered = True
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 72
    Top = 240
  end
  object FDMemTableFrom: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Code'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Description'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 76
    Top = 300
  end
  object FDMemTableTo: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Code'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Description'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 76
    Top = 356
  end
  object RESTRequestConvert: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <
      item
        Name = 'apikey'
        Value = 'LVkXYOZSMEmvVIVnNiqHfPQFFqwF75z4'
      end
      item
        Name = 'from'
        Value = 'ALL'
      end
      item
        Name = 'to'
        Value = 'JPY'
      end
      item
        Name = 'amount'
        Value = '1'
      end>
    Resource = 'convert'
    Response = RESTResponse2
    Left = 280
    Top = 72
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'application/json'
    Left = 280
    Top = 128
  end
  object RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable2
    FieldDefs = <>
    Response = RESTResponse2
    TypesMode = Rich
    NestedElements = True
    Left = 280
    Top = 184
  end
  object FDMemTable2: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'success'
        DataType = ftBoolean
      end
      item
        Name = 'query'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'query.from'
        DataType = ftWideString
        Size = 3
      end
      item
        Name = 'query.to'
        DataType = ftWideString
        Size = 3
      end
      item
        Name = 'query.amount'
        DataType = ftFloat
      end
      item
        Name = 'info'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'info.timestamp'
        DataType = ftFloat
      end
      item
        Name = 'info.rate'
        DataType = ftFloat
      end
      item
        Name = 'date'
        DataType = ftDateTime
      end
      item
        Name = 'result'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    StoreDefs = True
    Left = 280
    Top = 240
  end
end
