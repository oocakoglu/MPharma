object DMMPharmacy: TDMMPharmacy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 429
  Width = 616
  object sflthm1: TsuiFileTheme
    Ready = False
    Left = 64
    Top = 24
  end
  object ADOCon: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=MPHARMA;Data Source=.\KFMC;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 120
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 176
    Top = 120
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMaroon
      Font.Charset = TURKISH_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15658734
      Font.Charset = TURKISH_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = TURKISH_CHARSET
      Font.Color = clDefault
      Font.Height = -11
      Font.Name = 'Calibri'
      Font.Style = []
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 9938749
    end
    object StyleAdet1: TcxStyle
      AssignedValues = [svColor]
      Color = 16574680
    end
    object StyleAdet2: TcxStyle
      AssignedValues = [svColor]
      Color = 9743605
    end
    object styleTutar1: TcxStyle
      AssignedValues = [svColor]
      Color = 10997163
    end
    object styleTutar2: TcxStyle
      AssignedValues = [svColor]
      Color = 8757491
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object StyleOlumlu: TcxStyle
      AssignedValues = [svColor]
      Color = 13036236
    end
    object StyleOlumsuz: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object styleOlumluFont: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = 50176
    end
    object styleOlumsuzFont: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object StyleGosterim: TcxStyle
      AssignedValues = [svColor]
      Color = 16758380
    end
    object GriTema: TcxGridTableViewStyleSheet
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Selection = cxStyle5
      Styles.Header = cxStyle4
      BuiltIn = True
    end
    object OfficeTema: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle6
      Styles.Content = cxStyle7
      Styles.ContentEven = cxStyle8
      Styles.ContentOdd = cxStyle9
      Styles.FilterBox = cxStyle10
      Styles.Inactive = cxStyle15
      Styles.IncSearch = cxStyle16
      Styles.Selection = cxStyle19
      Styles.Footer = cxStyle11
      Styles.Group = cxStyle12
      Styles.GroupByBox = cxStyle13
      Styles.Header = cxStyle14
      Styles.Indicator = cxStyle17
      Styles.Preview = cxStyle18
      BuiltIn = True
    end
  end
  object cxEditRepository1: TcxEditRepository
    Left = 72
    Top = 200
    object PharmacyNames: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'PharmacyId'
      Properties.ListColumns = <
        item
          FieldName = 'PharmacyName'
        end>
      Properties.ListSource = dsPharmacyNames
    end
    object PresStatus: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Ordered'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'Intervented Approve'
          Value = 2
        end
        item
          Description = 'Cancelled'
          Value = 3
        end
        item
          Description = 'Processed'
          Value = 4
        end>
    end
    object PresType: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'OutPatient Prescription'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'InPatient Prescription'
          Value = 2
        end>
    end
  end
  object qryPharmacyNames: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Pharmacy')
    Left = 64
    Top = 272
  end
  object dsPharmacyNames: TDataSource
    DataSet = qryPharmacyNames
    Left = 64
    Top = 328
  end
end
