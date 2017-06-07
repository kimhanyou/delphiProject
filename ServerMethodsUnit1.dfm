object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 418
  Width = 827
  object LibConnection: TFDConnection
    Params.Strings = (
      'Database=D:\DELPAI_CLASS\PROJECT-LibDesk\LIBDESK.IB'
      'User_Name=sysdba'
      'Password=masterkey'
      'CharacterSet=utf8'
      'DriverID=iB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object qryUser: TFDQuery
    Active = True
    Connection = LibConnection
    UpdateOptions.AutoIncFields = 'USER_SEQ'
    SQL.Strings = (
      'SELECT * FROM USERS')
    Left = 144
    Top = 32
    object qryUserUSER_SEQ: TFDAutoIncField
      FieldName = 'USER_SEQ'
      Origin = 'USER_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryUserUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Required = True
      Size = 120
    end
    object qryUserUSER_ID: TStringField
      FieldName = 'USER_ID'
      Origin = 'USER_ID'
      Size = 15
    end
    object qryUserUSER_PW: TStringField
      FieldName = 'USER_PW'
      Origin = 'USER_PW'
      Size = 15
    end
    object qryUserUSER_PHONE: TStringField
      FieldName = 'USER_PHONE'
      Origin = 'USER_PHONE'
      Size = 15
    end
    object qryUserUSER_MAIL: TWideStringField
      FieldName = 'USER_MAIL'
      Origin = 'USER_MAIL'
      Size = 1020
    end
    object qryUserUSER_OUT_YN: TStringField
      FieldName = 'USER_OUT_YN'
      Origin = 'USER_OUT_YN'
      FixedChar = True
      Size = 1
    end
  end
  object qryLib: TFDQuery
    Active = True
    Connection = LibConnection
    UpdateOptions.AutoIncFields = 'LIB_SEQ'
    SQL.Strings = (
      'SELECT * FROM LIB')
    Left = 248
    Top = 32
  end
  object qryRent: TFDQuery
    Active = True
    Connection = LibConnection
    UpdateOptions.AutoIncFields = 'RENT_SEQ'
    SQL.Strings = (
      'SELECT * FROM RENT')
    Left = 368
    Top = 24
  end
  object qryUser_provider: TDataSetProvider
    DataSet = qryUser
    Left = 144
    Top = 96
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 88
  end
  object qryCheckLogin: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      'SELECT USER_ID,USER_PW FROM USERS'
      'WHERE USER_ID = :ID AND USER_PW = :PW')
    Left = 680
    Top = 32
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end
      item
        Name = 'PW'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
  end
  object qryDuplicatedID: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      'SELECT USER_ID FROM USERS'
      'WHERE USER_ID = :ID ')
    Left = 512
    Top = 24
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 15
        Value = Null
      end>
  end
  object qryLib_provider: TDataSetProvider
    DataSet = qryLib
    Left = 256
    Top = 96
  end
  object qryRent_provider: TDataSetProvider
    DataSet = qryRent
    Left = 368
    Top = 96
  end
  object qryDuplicatedID_provider: TDataSetProvider
    DataSet = qryDuplicatedID
    Left = 512
    Top = 96
  end
  object qryCheckLogin_Provider: TDataSetProvider
    DataSet = qryCheckLogin
    Left = 680
    Top = 96
  end
  object qryLibAddress: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      'SELECT LIBADDRESS FROM LIB GROUP BY LIBADDRESS')
    Left = 104
    Top = 184
  end
  object qryLibAddress_Provider: TDataSetProvider
    DataSet = qryLibAddress
    Left = 96
    Top = 248
  end
  object qryLibName: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      'SELECT LIBNAME,LIBADDRESS FROM LIB')
    Left = 224
    Top = 176
  end
  object qryLibname_Provider: TDataSetProvider
    DataSet = qryLibName
    Left = 224
    Top = 240
  end
  object qryDupSeat: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      
        'SELECT RENT_SEATNUM FROM RENT WHERE RENT_DATE = :DATE AND LIB_SE' +
        'Q = :LIBSEQ')
    Left = 352
    Top = 176
    ParamData = <
      item
        Name = 'DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LIBSEQ'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryDupSeat_Provider: TDataSetProvider
    DataSet = qryDupSeat
    Left = 344
    Top = 248
  end
  object qrySeat: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      
        'SELECT RENT_SEATNUM FROM RENT WHERE RENT_DATE = :DATE AND LIB_SE' +
        'Q = :LIBSEQ')
    Left = 480
    Top = 176
    ParamData = <
      item
        Name = 'DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LIBSEQ'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qrySeat_Provider: TDataSetProvider
    DataSet = qrySeat
    Left = 480
    Top = 256
  end
  object qryDuplicatedNum: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      
        'SELECT RENT_SEATNUM FROM RENT WHERE RENT_DATE = :DATE AND LIB_SE' +
        'Q = :LIBSEQ AND RENT_SEATNUM = :Rent_SeatNum')
    Left = 608
    Top = 168
    ParamData = <
      item
        Name = 'DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'LIBSEQ'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'RENT_SEATNUM'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryDuplicatedNum_Provider: TDataSetProvider
    DataSet = qryDuplicatedNum
    Left = 616
    Top = 240
  end
  object qryTalking: TFDQuery
    Active = True
    Connection = LibConnection
    SQL.Strings = (
      'SELECT * FROM MESSENGER')
    Left = 736
    Top = 168
  end
  object qryTalking_Provider: TDataSetProvider
    DataSet = qryTalking
    Left = 760
    Top = 240
  end
end
