unit untPrescription;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, DB, cxLabel, cxDBLabel, ADODB,
  dxGDIPlusClasses, jpeg, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls,
  DateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, SUIButton, cxMemo, cxCalendar, cxSpinEdit,
  DBClient, Menus, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, untDef,
  cxCheckBox, Grids, DBGrids, SUIPageControl, SUITabControl, cxImage, Buttons,
  cxImageComboBox, ImgList, cxPC, cxRadioGroup, cxCurrencyEdit, cxDBEdit,
  cxGridCustomPopupMenu, cxGridPopupMenu, StrUtils;



type
  TfrmPrescription = class(TForm)
    frmsuiPrescription: TsuiForm;
    pnlTop: TPanel;
    Image1: TImage;
    imgFeMale: TImage;
    popupPatientSearch: TcxPopupEdit;
    lblPatientName: TLabel;
    lblAge: TLabel;
    lblWeightHeight: TLabel;
    lblGender: TLabel;
    imgMale: TImage;
    imgChoose: TImage;
    Image2: TImage;
    lblBirthPlace: TLabel;
    lblBirthDate: TLabel;
    qryDrug: TADOQuery;
    dsDrug: TDataSource;
    pnlLeft: TPanel;
    Panel2: TPanel;
    Image3: TImage;
    Label1: TLabel;
    grdDrug: TcxGrid;
    grdDrugDBTV: TcxGridDBTableView;
    grdDrugDBTVDrugName: TcxGridDBColumn;
    grdDrugLV: TcxGridLevel;
    txtDrugName: TcxTextEdit;
    Panel1: TPanel;
    pnlIsideTop: TPanel;
    Image4: TImage;
    grdPrescription: TcxGrid;
    grdPrescriptionDBTV: TcxGridDBTableView;
    grdPrescriptionLV: TcxGridLevel;
    cmbStrengthUnit: TcxComboBox;
    cmbForm: TcxComboBox;
    Label10: TLabel;
    dteStart: TcxDateEdit;
    Label11: TLabel;
    dteEnd: TcxDateEdit;
    Label12: TLabel;
    Label13: TLabel;
    txtIndication: TcxMemo;
    btnAdd: TsuiButton;
    pnlBottom: TPanel;
    imgBottom: TImage;
    btnPlaceOrder: TsuiButton;
    cdsPrescription: TClientDataSet;
    cdsPrescriptionDrugId: TIntegerField;
    cdsPrescriptionDrugName: TStringField;
    cdsPrescriptionAmount: TIntegerField;
    cdsPrescriptionForm: TStringField;
    cdsPrescriptionRoute: TStringField;
    cdsPrescriptionFrequency: TStringField;
    cdsPrescriptionDuration: TIntegerField;
    cdsPrescriptionPeriod: TStringField;
    cdsPrescriptionDosage: TIntegerField;
    cdsPrescriptionStartDate: TDateField;
    cdsPrescriptionEndDate: TDateField;
    dsPrescription: TDataSource;
    PopupMenu1: TPopupMenu;
    miDelete: TMenuItem;
    Image6: TImage;
    cdsPrescriptionPharmacyInstrunction: TStringField;
    cdsPrescriptionIndication: TStringField;
    tmrInformation: TTimer;
    lblPharmacy: TLabel;
    lkpPharmacy: TcxLookupComboBox;
    lblPresType: TLabel;
    chkStat: TcxCheckBox;
    cdsPrescriptionStat: TBooleanField;
    grdPrescriptionDBTVDrugId: TcxGridDBColumn;
    grdPrescriptionDBTVDrugName: TcxGridDBColumn;
    grdPrescriptionDBTVDosage: TcxGridDBColumn;
    grdPrescriptionDBTVAmount: TcxGridDBColumn;
    grdPrescriptionDBTVForm: TcxGridDBColumn;
    grdPrescriptionDBTVRoute: TcxGridDBColumn;
    grdPrescriptionDBTVFrequency: TcxGridDBColumn;
    grdPrescriptionDBTVDuration: TcxGridDBColumn;
    grdPrescriptionDBTVPeriod: TcxGridDBColumn;
    grdPrescriptionDBTVStartDate: TcxGridDBColumn;
    grdPrescriptionDBTVEndDate: TcxGridDBColumn;
    grdPrescriptionDBTVPharmacyInstruction: TcxGridDBColumn;
    grdPrescriptionDBTVIndication: TcxGridDBColumn;
    grdPrescriptionDBTVStat: TcxGridDBColumn;
    pageDrugList: TsuiPageControl;
    tsAllDrug: TsuiTabSheet;
    tsFavoriteDrug: TsuiTabSheet;
    btnNoFavorite: TSpeedButton;
    btnFavorite: TSpeedButton;
    grdDrugDBTVColumn1: TcxGridDBColumn;
    ImageList1: TImageList;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    qryPrescriptionDetail: TADOQuery;
    dsPrescriptionDetail: TDataSource;
    grdPrescriptionDetail: TcxGrid;
    grdPrescriptionDetailDBTV: TcxGridDBTableView;
    grdPrescriptionDetailDBTVDrugId: TcxGridDBColumn;
    grdPrescriptionDetailDBTVDrugName: TcxGridDBColumn;
    grdPrescriptionDetailDBTVDosage: TcxGridDBColumn;
    grdPrescriptionDetailDBTVAmount: TcxGridDBColumn;
    grdPrescriptionDetailDBTVForm: TcxGridDBColumn;
    grdPrescriptionDetailDBTVRoute: TcxGridDBColumn;
    grdPrescriptionDetailDBTVFrequency: TcxGridDBColumn;
    grdPrescriptionDetailDBTVDuration: TcxGridDBColumn;
    grdPrescriptionDetailDBTVPeriod: TcxGridDBColumn;
    grdPrescriptionDetailDBTVStartDate: TcxGridDBColumn;
    grdPrescriptionDetailDBTVEndDate: TcxGridDBColumn;
    grdPrescriptionDetailLV: TcxGridLevel;
    refill0: TcxRadioButton;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    lblPharmacyInstruction: TLabel;
    cxMemo1: TcxMemo;
    Label14: TLabel;
    Label15: TLabel;
    txtStrengthAmount: TcxCurrencyEdit;
    Label16: TLabel;
    txtAmount: TcxCurrencyEdit;
    Label17: TLabel;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Button1: TButton;
    Button2: TButton;
    cxSpinEdit1: TcxSpinEdit;
    Label2: TLabel;
    txtDosage: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure popupPatientSearchPropertiesCloseUp(Sender: TObject);
    procedure popupPatientSearchPropertiesInitPopup(Sender: TObject);
    procedure txtDrugNamePropertiesChange(Sender: TObject);
    procedure dsDrugDataChange(Sender: TObject; Field: TField);
    procedure btnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure btnPlaceOrderClick(Sender: TObject);
    procedure tmrInformationTimer(Sender: TObject);
    procedure btnFavoriteClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButtonSelection(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure txtStrengthAmountPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    ActivePatientId  : Integer;
    ActivePresType   : TPrescriptionType;

    procedure ClearPatient();
    procedure ClearForm();

    procedure ClearColumns();
    procedure FillColumns();
    procedure CreateInstructor();

  public
    { Public declarations }
    procedure SetParametr(patientId : Integer; presType : TPrescriptionType);
  end;

var
  frmPrescription: TfrmPrescription;

implementation

uses DM, untPatientSearch;

{$R *.dfm}


procedure   TfrmPrescription.CreateInstructor;
var
  i        : Integer;
  conCount : Integer;
  btn      : TSpeedButton;
  spn      : TcxSpinEdit;
  btnName  : String;
  route      : String;
  frequ      : String;
  perio      : String;
  duration   : Double;
  instuction : String;
begin

  conCount := ComponentCount-1;
  for i := conCount downto 0 do
  begin
    if Components[i] is TSpeedButton then //with Components[i] as TSpeedButton do begin
    begin
      btn := (Components[i] as TSpeedButton);
      if btn.Font.style = [fsBold] then
      begin
        btnName := btn.Name;
        if MidStr(btnName, 7, 5) = 'Route' then
          route := btn.Caption
        else if MidStr(btnName, 7, 5) = 'Frequ' then
          frequ := btn.Caption
        else if MidStr(btnName, 7, 5) = 'Perio' then
          perio := btn.Caption;
      end;
    end
    else if Components[i] is TcxSpinEdit then
    begin
      spn := (Components[i] as TcxSpinEdit);
      btnName := (Components[i] as TcxSpinEdit).Name;
      if MidStr(btnName, 1, 6) = 'spndyn' then
      begin
        duration := spn.Value;
      end;
    end;
  end;

 instuction := 'Take ' + FloatToStr(txtAmount.Value) +
 '  ' + cmbForm.Text
 + '  (' + FloatToStr(txtStrengthAmount.Value) + ' ' + cmbStrengthUnit.Text + ') '
 + ' ' + txtDosage.Text + ' time '
 + frequ + ' for ' + FloatToStr(duration) + '  ' + perio + '   (' + route + ')';

 lblPharmacyInstruction.Caption := ReplaceText(instuction, '.00','');
end;

procedure TfrmPrescription.ClearPatient();
begin
  imgMale.Visible := False;
  imgFeMale.Visible := False;
  imgChoose.Visible := True;

  lblPatientName.Caption := 'Please Select Patient';
  lblAge.Caption := '';
  lblWeightHeight.Caption := '';
  lblGender.Caption := '';
  lblBirthPlace.Caption := '';
  lblBirthDate.Caption  := '';
end;



procedure TfrmPrescription.FillColumns();
var
 defTop    : Integer;
 defLeft   : Integer;
 defHeight : Integer;

 qryTemp  : TADOQuery;
 i   : integer;
 row : integer;

 btnspd : array [1..4,1..9] of TSpeedButton;
 lblCap : array [1..9] of TLabel;
 spn    : TcxSpinEdit;
begin
  ClearColumns;
  defTop    := 62;
  defLeft   := 28;
  defHeight := 24;

  i   := 1;
  row := 1;
  lblCap[row] := TLabel.Create(frmPrescription);
  lblCap[row].SetBounds(defLeft, defTop + 6, 64, 15);
  lblCap[row].Transparent := True;
  lblCap[row].Font.Style := [fsBold];
  lblCap[row].Parent  := pnlIsideTop;
  lblCap[row].Caption := 'Route : ';
  lblCap[row].Name    := 'lbldynRoute';

  //**Route
  qryTemp := DMMPharmacy.CreateQuery;
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT RouteName, DefaultRoute FROM DrugRoute WHERE DrugId = '
   + qryDrug.FieldByName('DrugId').AsString;
  qryTemp.Open;
  qryTemp.First;
  while not(qryTemp.Eof) do
  begin
    btnspd[row][i] := TSpeedButton.Create(frmPrescription);
    btnspd[row][i].Height := 22;
    btnspd[row][i].Width := 58;
    btnspd[row][i].Top := defTop;
    btnspd[row][i].Left := (defLeft + 72) + ((i - 1) *58);
    btnspd[row][i].Parent := pnlIsideTop;
    btnspd[row][i].GroupIndex := row;
    btnspd[row][i].Caption := qryTemp.FieldByName('RouteName').AsString;
    btnspd[row][i].Flat    := True;
    btnspd[row][i].Name    := 'spddyn' + 'Route' + IntToStr(row) +IntToStr(i);
    btnspd[row][i].OnClick :=  SpeedButtonSelection;

    if qryTemp.FieldByName('DefaultRoute').AsBoolean then
    begin
      btnspd[row][i].Down := True;
      btnspd[row][i].Font.Style := [fsBold];;
      btnspd[row][i].Font.Color := clGreen;
    end;

    qryTemp.Next;
    i := i + 1;
  end;


  //**Frequency
  i   := 1;
  row := 2;
  defTop := defTop + defHeight;
  lblCap[row] := TLabel.Create(frmPrescription);
  lblCap[row].SetBounds(defLeft, defTop + 6, 64, 15);
  lblCap[row].Transparent := True;
  lblCap[row].Font.Style := [fsBold];
  lblCap[row].Parent  := pnlIsideTop;
  lblCap[row].Caption := 'Frequency :';
  lblCap[row].Name    := 'lbldynFrequency';

  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT FrequencyName, DefaultFrequency FROM DrugFrequency WHERE DrugId = '
   + qryDrug.FieldByName('DrugId').AsString;
  qryTemp.Open;
  qryTemp.First;
  while not(qryTemp.Eof) do
  begin
    btnspd[row][i] := TSpeedButton.Create(frmPrescription);
    btnspd[row][i].Height := 22;
    btnspd[row][i].Width := 58;
    btnspd[row][i].Top := defTop;
    btnspd[row][i].Left := (defLeft + 72) + ((i - 1) *58);
    btnspd[row][i].Parent := pnlIsideTop;
    btnspd[row][i].GroupIndex := row;
    btnspd[row][i].Caption := qryTemp.FieldByName('FrequencyName').AsString;
    btnspd[row][i].Flat    := True;
    btnspd[row][i].Name    := 'spddyn'  + 'Frequ' + IntToStr(row) +IntToStr(i);
    btnspd[row][i].OnClick :=  SpeedButtonSelection;

    if qryTemp.FieldByName('DefaultFrequency').AsBoolean then
    begin
      btnspd[row][i].Down := True;
      btnspd[row][i].Font.Style := [fsBold];;
      btnspd[row][i].Font.Color := clGreen;
    end;

    qryTemp.Next;
    i := i + 1;
  end;


  //**Frequency
  i   := 1;
  row := 3;
  defTop := defTop + defHeight;
  lblCap[row] := TLabel.Create(frmPrescription);
  lblCap[row].SetBounds(defLeft, defTop + 6, 64, 15);
  lblCap[row].Transparent := True;
  lblCap[row].Font.Style := [fsBold];
  lblCap[row].Parent  := pnlIsideTop;
  lblCap[row].Caption := 'Duration :';
  lblCap[row].Name    := 'lbldynDuration';

  spn := TcxSpinEdit.Create(frmPrescription);
  spn.Height  := 22;
  spn.Width   := 58;
  spn.Top     := defTop;
  spn.Left    := (defLeft + 72) + ((i - 1) *58);
  spn.Parent  := pnlIsideTop;
  spn.Name    := 'spndyn';
  spn.Value   := qryDrug.FieldByName('DefaultDuration').AsInteger;

  i := 2;
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT PeriodName, DefaultPeriod FROM DrugPeriod WHERE DrugId = '
   + qryDrug.FieldByName('DrugId').AsString;
  qryTemp.Open;
  qryTemp.First;
  while not(qryTemp.Eof) do
  begin
    btnspd[row][i] := TSpeedButton.Create(frmPrescription);
    btnspd[row][i].Height := 22;
    btnspd[row][i].Width := 58;
    btnspd[row][i].Top := defTop;
    btnspd[row][i].Left := (defLeft + 72) + ((i - 1) *58);
    btnspd[row][i].Parent := pnlIsideTop;
    btnspd[row][i].GroupIndex := row;
    btnspd[row][i].Caption := qryTemp.FieldByName('PeriodName').AsString;
    btnspd[row][i].Flat    := True;
    btnspd[row][i].Name    := 'spddyn' + 'Perio' + IntToStr(row) +IntToStr(i);
    btnspd[row][i].OnClick :=  SpeedButtonSelection;

    if qryTemp.FieldByName('DefaultPeriod').AsBoolean then
    begin
      btnspd[row][i].Down := True;
      btnspd[row][i].Font.Style := [fsBold];;
      btnspd[row][i].Font.Color := clGreen;
    end;

    qryTemp.Next;
    i := i + 1;
  end;

  qryTemp.Destroy;
end;





procedure TfrmPrescription.ClearForm();
begin
  cmbForm.Text      := '';
  dteStart.Date     := Today;
  dteEnd.Clear;
  //txtPharmacyInstruction.Text := '';
  txtIndication.Text          := '';
  qryPrescriptionDetail.Close;
  lblPharmacyInstruction.Caption := '';

end;

procedure TfrmPrescription.dsDrugDataChange(Sender: TObject; Field: TField);
begin
  //txsDosage.Value   := qryDrug.FieldByName('DefaultDosageAmount').AsInteger;
  //cmbUnit.Text      := qryDrug.FieldByName('DefaultDosageUnit').AsString;
  txtStrengthAmount.Value := qryDrug.FieldByName('StrengthAmount').AsFloat;
  cmbStrengthUnit.Text    := qryDrug.FieldByName('StrengthUnit').AsString;
  cmbForm.Text      := qryDrug.FieldByName('Form').AsString;
  dteStart.Date     := Today;
  dteEnd.Date       := dteStart.Date + qryDrug.FieldByName('DefaultDuration').AsInteger;
  //txtAmount.Value         := 1;

  if qryDrug.FieldByName('FavoriteDrug').AsInteger = 1 then
  begin
    btnNoFavorite.Visible := False;
    btnFavorite.Visible   := True;
  end
  else
  begin
    btnNoFavorite.Visible := True;
    btnFavorite.Visible   := False;
  end;

  FillColumns;
end;


procedure TfrmPrescription.SetParametr(patientId : Integer; presType : TPrescriptionType);
var
 qryTemp : TADOQuery;
 birthDate : TDate;
begin

  ActivePatientId := patientId;
  ActivePresType  := presType;

  if ActivePresType = ptOutPatient then
  begin
     frmPrescription.Caption := 'OutPatient Prescription';
     lblPresType.Caption     := 'OutPatient Prescription';
  end
  else if ActivePresType = ptInPatient then
  begin
     frmPrescription.Caption := 'Inpatient Prescription';
     lblPresType.Caption     := 'Inpatient Prescription';
  end;


  if patientId <> 0 then
  begin
    qryTemp := DMMPharmacy.CreateQuery;
    qryTemp.Close;
    qryTemp.SQL.Text := 'SELECT * FROM Patient WHERE PatientId = ' + IntToStr(patientId);
    qryTemp.Open;

    birthDate := qryTemp.FieldByName('BirthDate').AsDateTime;
    lblPatientName.Caption  := qryTemp.FieldByName('Name').AsString + ' ' +  qryTemp.FieldByName('Surname').AsString;
    lblAge.Caption          := IntToStr(YearsBetween(Now, birthDate)) + ' years old';
    lblWeightHeight.Caption := qryTemp.FieldByName('Height').AsString + ' cm ' + qryTemp.FieldByName('Weight').AsString + ' kg';
    lblGender.Caption       := qryTemp.FieldByName('Gender').AsString;
    lblBirthPlace.Caption   := qryTemp.FieldByName('BirthPlace').AsString;
    lblBirthDate.Caption    := qryTemp.FieldByName('BirthDate').AsString;

    imgChoose.Visible := False;
    if qryTemp.FieldByName('Gender').AsString = 'Male' then
    begin
      imgMale.Visible := True;
      imgFeMale.Visible := False;
    end
    else if qryTemp.FieldByName('Gender').AsString = 'Female' then
    begin
      imgMale.Visible := False;
      imgFeMale.Visible := True;
    end;


    if DMMPharmacy.dbType = dbSQL then
    begin
     qryPrescriptionDetail.Close;
     qryPrescriptionDetail.SQL.Text := 'SELECT '
                                      +'D.DrugName, PD.Amount, PD.Dosage, PD.Form, PD.Frequency, '
                                      +'PD.Duration, PD.Period, PD.StartDate, PD.EndDate   '
                                      +'FROM PrescriptionDetail PD  '
                                      +'INNER JOIN Drug D ON Pd.DrugId = D.DrugId  '
                                      +'INNER JOIN Prescription P ON P.PrescriptionId = PD.PrescriptionId '
                                      +'WHERE P.PatientId = '
                                      + IntToStr(patientId);
     qryPrescriptionDetail.Open;
    end
    else if DMMPharmacy.dbType = dbAccess then
    begin
     qryPrescriptionDetail.Close;
     qryPrescriptionDetail.SQL.Text := 'SELECT '
                                      +'D.DrugName, PD.Amount, PD.Dosage, PD.Form, PD.Frequency, '
                                      +'PD.Duration, PD.Period, PD.StartDate, PD.EndDate   '
                                      +'FROM (PrescriptionDetail PD  '
                                      +'INNER JOIN Drug D ON Pd.DrugId = D.DrugId)  '
                                      +'INNER JOIN Prescription P ON P.PrescriptionId = PD.PrescriptionId '
                                      +'WHERE P.PatientId = '
                                      + IntToStr(patientId);
     qryPrescriptionDetail.Open;
    end;


    qryTemp.Destroy;
  end
  else
  begin
    ClearPatient();
  end;
  txtDrugNamePropertiesChange(txtDrugName);
end;




procedure TfrmPrescription.tmrInformationTimer(Sender: TObject);
begin
  imgBottom.Visible      := True;
  pnlBottom.Color        := $00CBCBCB;
  btnPlaceOrder.Visible  := True;
  lkpPharmacy.Visible    := True;
  lblPharmacy.Visible    := True;
  pnlBottom.Caption      := '';
  tmrInformation.Enabled := False;


end;

procedure TfrmPrescription.txtDrugNamePropertiesChange(Sender: TObject);
var
  sql : String;
begin

  if DMMPharmacy.dbType = dbSQL then
  begin
    sql := 'SELECT TOP 500 '
         + 'CASE '
         + 'WHEN F.FavoriteDrugId IS NULL THEN 0 '
         + 'ELSE 1 END FavoriteDrug, '
         + 'D.*  FROM Drug D '
         + 'LEFT JOIN FavoriteDrug F ON '
         + 'D.DrugId = F.DrugId AND F.UserId = ' + IntToStr(UserData.UserId) + ' '
         + ' WHERE D.DrugName like ' + QuotedStr(txtDrugName.Text + '%');
  end
  else if DMMPharmacy.dbType = dbAccess then
  begin
    sql := 'SELECT TOP 500 '
         + 'IIF(F.FavoriteDrugId IS NOT NULL, 1, 0) AS FavoriteDrug, '
         + 'D.*  FROM Drug D '
         + 'LEFT JOIN FavoriteDrug F ON '
         + '(D.DrugId = F.DrugId AND F.UserId = ' + IntToStr(UserData.UserId) + ') '
         + ' WHERE D.DrugName like ' + QuotedStr(txtDrugName.Text + '%');
  end;


  if pageDrugList.ActivePage = tsFavoriteDrug Then
  begin
    sql := sql + ' and F.FavoriteDrugId IS NOT NULL ';
  end;


//''SELECT  TOP 500  IIF(F.FavoriteDrugId IS NOT NULL, 1, 0) AS FavoriteDrug, D.* FROM Drug D
//'LEFT JOIN FavoriteDrug F ON (D.DrugId = F.DrugId  AND F.UserId = 1)
//'WHERE  D.DrugName like 'A%'


  qryDrug.Close;
  qryDrug.SQL.Text := sql;
  qryDrug.Open;
end;


procedure TfrmPrescription.txtStrengthAmountPropertiesEditValueChanged(
  Sender: TObject);
var
  sAmnt : Double;
  amnt  : Double;
begin

  sAmnt := qryDrug.FieldByName('StrengthAmount').AsFloat;
  if sAmnt<> 0 then
  begin
    if (Sender as TcxCurrencyEdit).Name = 'txtStrengthAmount' then
    begin
      amnt := (txtStrengthAmount.Value / sAmnt);
      if txtAmount.Value <> amnt then
        txtAmount.Value := amnt;
    end
    else if (Sender as TcxCurrencyEdit).Name = 'txtAmount' then
    begin
      amnt := (txtAmount.Value * sAmnt);
      if txtStrengthAmount.Value <> amnt then
        txtStrengthAmount.Value := amnt;
    end;
  end;
  CreateInstructor;
end;

procedure TfrmPrescription.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPrescription.FormShow(Sender: TObject);
begin
  cdsPrescription.CreateDataSet;
  cdsPrescription.Open;

end;

procedure TfrmPrescription.miDeleteClick(Sender: TObject);
begin

  if cdsPrescription.RecordCount > 0 then
  begin
    cdsPrescription.Delete;
  end;

end;

procedure TfrmPrescription.popupPatientSearchPropertiesCloseUp(
  Sender: TObject);
var
   qry : TADOQuery;
begin
  qry := TfrmPatientSearch(popupPatientSearch.Properties.PopupControl).qryPatientList;

  if (DMMPharmacy.keyDownStatus = kdsSelect) and (qry.Active) and (not(qry.IsEmpty)) then
  begin
    SetParametr(qry.FieldByName('PatientId').AsInteger, ActivePresType);
  end;

end;

procedure TfrmPrescription.popupPatientSearchPropertiesInitPopup(
  Sender: TObject);
begin

  if (popupPatientSearch.Properties.PopupControl = nil) then
    popupPatientSearch.Properties.PopupControl := TfrmPatientSearch.Create(Self)
  else
    TfrmPatientSearch(popupPatientSearch.Properties.PopupControl).ClearBtn.Click;

  TfrmPatientSearch(popupPatientSearch.Properties.PopupControl).txtIqamaPropertiesChange(Sender);
  DMMPharmacy.keyDownStatus:=kdsNone;
end;

procedure TfrmPrescription.btnAddClick(Sender: TObject);
begin
  if txtStrengthAmount.Value = 0 then
  begin
    ShowMessage('Please enter validate Dosage');
    Abort;
  end;

  if txtAmount.Value = 0 then
  begin
    ShowMessage('Please enter validate Amount');
    Abort;
  end;

//  if txsDuration.Value = 0 then
//  begin
//    ShowMessage('Please enter validate Duration');
//    Abort;
//  end;
//
//  cdsPrescription.Append;
//  cdsPrescription.FieldByName('DrugId').AsInteger     := qryDrug.FieldByName('DrugId').AsInteger;
//  cdsPrescription.FieldByName('DrugName').AsString    := qryDrug.FieldByName('DrugName').AsString;
//  cdsPrescription.FieldByName('Dosage').AsInteger     := txsDosage.Value;
//  cdsPrescription.FieldByName('Amount').AsInteger     := txsAmount.Value;
//  cdsPrescription.FieldByName('Form').AsString        := cmbForm.Text;
//  cdsPrescription.FieldByName('Route').AsString       := cmbRoute.Text;
//  cdsPrescription.FieldByName('Frequency').AsString   := cmbFrequency.Text;
//  cdsPrescription.FieldByName('Duration').AsString    := txsDuration.Text;
//  cdsPrescription.FieldByName('Period').AsString      := cmbPeriod.Text;
//  cdsPrescription.FieldByName('StartDate').AsDateTime := dteStart.Date;
//  cdsPrescription.FieldByName('EndDate').AsDateTime   := dteEnd.Date;
//
//  //cdsPrescription.FieldByName('PharmacyInstruction').AsString  := txtPharmacyInstruction.Text;
//  cdsPrescription.FieldByName('Indication').AsString           := txtIndication.Text;
//  cdsPrescription.FieldByName('Stat').AsBoolean                := chkStat.Checked;
//
//  cdsPrescription.Post;
  ClearForm;
end;


procedure TfrmPrescription.btnPlaceOrderClick(Sender: TObject);
var
  qryTemp  : TADOQuery;
  presId   : Integer;
  presType : Integer;
begin

  if ActivePatientId = 0 then
  begin
    ShowMessage('Please choose a patient');
    Abort;
  end
  else if cdsPrescription.RecordCount = 0 then
  begin
    ShowMessage('Please add drug to prescription');
    Abort;
  end
  else if lkpPharmacy.EditValue = null then
  begin
    ShowMessage('Please select a phamacy for send prescription');
    Abort;
  end;

  if ActivePresType = ptOutPatient then
    presType := 1
  else if ActivePresType = ptInPatient then
    presType := 2;

  qryTemp := DMMPharmacy.CreateQuery;
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT * FROM Prescription WHERE 2 = 1';
  qryTemp.Open;

  qryTemp.Append;
  qryTemp.FieldByName('PatientId').AsInteger        := ActivePatientId;
  qryTemp.FieldByName('PharmacyId').AsInteger       := lkpPharmacy.EditValue;
  qryTemp.FieldByName('RecordUserId').AsInteger     := UserData.UserId;
  qryTemp.FieldByName('Status').AsInteger           := 1;
  qryTemp.FieldByName('RecordDate').AsDateTime      := Today;
  qryTemp.FieldByName('PrescriptionType').AsInteger := presType;
  qryTemp.Post;
  presId := qryTemp.FieldByName('PrescriptionId').AsInteger;



  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT * FROM PrescriptionDetail WHERE 2 = 1';
  qryTemp.Open;

  cdsPrescription.First;
  while not(cdsPrescription.Eof) do
  begin

    qryTemp.Append;
    qryTemp.FieldByName('PrescriptionId').AsInteger     := presId;
    qryTemp.FieldByName('DrugId').AsInteger             := cdsPrescription.FieldByName('DrugId').AsInteger;
    qryTemp.FieldByName('Dosage').AsInteger             := cdsPrescription.FieldByName('Dosage').AsInteger;
    qryTemp.FieldByName('Amount').AsInteger             := cdsPrescription.FieldByName('Amount').AsInteger;

    qryTemp.FieldByName('Form').AsString                := cdsPrescription.FieldByName('Form').AsString;
    qryTemp.FieldByName('Route').AsString               := cdsPrescription.FieldByName('Route').AsString;

    qryTemp.FieldByName('Frequency').AsString           := cdsPrescription.FieldByName('Frequency').AsString;
    qryTemp.FieldByName('Duration').AsInteger           := cdsPrescription.FieldByName('Duration').AsInteger;
    qryTemp.FieldByName('Period').AsString              := cdsPrescription.FieldByName('Period').AsString;

    qryTemp.FieldByName('StartDate').AsDateTime         := cdsPrescription.FieldByName('StartDate').AsDateTime;
    qryTemp.FieldByName('EndDate').AsDateTime           := cdsPrescription.FieldByName('EndDate').AsDateTime;
    qryTemp.FieldByName('PharmacyInstruction').AsString := cdsPrescription.FieldByName('PharmacyInstruction').AsString;
    qryTemp.FieldByName('Indication').AsString          := cdsPrescription.FieldByName('Indication').AsString;
    qryTemp.FieldByName('Stat').AsBoolean               := cdsPrescription.FieldByName('Stat').AsBoolean;
    qryTemp.Post;

    cdsPrescription.Next;
  end;

  //**Save Islemi
  imgBottom.Visible      := False;
  pnlBottom.Color        := clGreen;
  pnlBottom.Font.Color   := clWhite;
  btnPlaceOrder.Visible  := False;
  pnlBottom.Caption      := 'Prescription Send Succesfully';
  tmrInformation.Enabled := True;
  lkpPharmacy.Visible    := False;
  lblPharmacy.Visible    := False;
  SetParametr(0, ActivePresType);
  ClearForm;
  qryPrescriptionDetail.Close;
  cdsPrescription.EmptyDataSet;

end;

procedure TfrmPrescription.ClearColumns();
var
  i        : Integer;
  conCount : Integer;
  btnName  : string;
begin

  conCount := ComponentCount-1;
  for i := conCount downto 0 do
  begin
    if Components[i] is TSpeedButton then //with Components[i] as TSpeedButton do begin
    begin
      btnName := (Components[i] as TSpeedButton).Name;
      if MidStr(btnName, 1, 6) = 'spddyn' then
      begin
        Components[i].Free;
      end;
    end
    else if Components[i] is TLabel then
    begin
      btnName := (Components[i] as TLabel).Name;
      if MidStr(btnName, 1, 6) = 'lbldyn' then
      begin
        Components[i].Free;
      end;
    end
    else if Components[i] is TcxSpinEdit then
    begin
      btnName := (Components[i] as TcxSpinEdit).Name;
      if MidStr(btnName, 1, 6) = 'spndyn' then
      begin
        Components[i].Free;
      end;
    end;
  end;

end;




procedure TfrmPrescription.SpeedButtonSelection(Sender: TObject);
var
 grpIndex : integer;
 i        : integer;
 conCount : Integer;
begin


  grpIndex := (Sender as TSpeedButton).GroupIndex;
  conCount := ComponentCount-1;
  for i := conCount downto 0 do
  begin
    if Components[i] is TSpeedButton then
    begin
      if (Components[i] as TSpeedButton).GroupIndex = grpIndex then
      begin
        (Components[i] as TSpeedButton).Font.Style := [];;
        (Components[i] as TSpeedButton).Font.Color := clWindowText;
      end;
    end;
  end;
  (Sender as TSpeedButton).Font.Style := [fsBold];;
  (Sender as TSpeedButton).Font.Color := clGreen;
  CreateInstructor();
end;


procedure TfrmPrescription.Button1Click(Sender: TObject);
begin
  FillColumns();
end;

procedure TfrmPrescription.Button2Click(Sender: TObject);
begin

  ClearColumns();

end;



procedure TfrmPrescription.btnFavoriteClick(Sender: TObject);
var
 qryTemp : TADOQuery;
begin
  //**Find Favorite
  qryTemp := DMMPharmacy.CreateQuery;
  qryTemp.Close;
  qryTemp.SQL.Text := 'SELECT * FROM FavoriteDrug '
                    +' WHERE UserId = ' + IntToStr(UserData.UserId)
                    +' AND DrugId = ' + qryDrug.FieldByName('DrugId').AsString;
  qryTemp.Open;

  if TSpeedButton(Sender) = btnNoFavorite Then
  begin
     if qryTemp.RecordCount = 0 then
     begin
       qryTemp.Insert;
       qryTemp.FieldByName('UserId').AsInteger := UserData.UserId;
       qryTemp.FieldByName('DrugId').AsInteger := qryDrug.FieldByName('DrugId').AsInteger;
       qryTemp.Post;
     end;
     btnFavorite.Visible   := True;
     btnNoFavorite.Visible := False;
  end
  else if TSpeedButton(Sender) = btnFavorite Then
  begin
     if qryTemp.RecordCount > 0 then
     begin
       qryTemp.Delete;
     end;
     btnFavorite.Visible   := False;
     btnNoFavorite.Visible := True;
  end;
  qryTemp.Destroy;
  txtDrugNamePropertiesChange(Sender);
end;


end.
