unit untPrescriptionWorkList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, StdCtrls, cxTextEdit, cxMaskEdit,
  cxCalendar, jpeg, SUIImagePanel, SUIGroupBox, SUIRadioGroup, SUIButton,
  cxGroupBox, cxCheckBox, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxSplitter, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ADODB,
  DateUtils, Buttons, untExcelExport;

type
  TfrmPrescriptionWorkList = class(TForm)
    suifrmPrescriptionWorkList: TsuiForm;
    pnlTop: TPanel;
    Image1: TImage;
    dteStartDate: TcxDateEdit;
    Label2: TLabel;
    Label1: TLabel;
    dteEndDate: TcxDateEdit;
    Label3: TLabel;
    lkpPharmacy: TcxLookupComboBox;
    grpStatus: TcxGroupBox;
    chkOrdered: TcxCheckBox;
    chkCancelled: TcxCheckBox;
    chkProcessed: TcxCheckBox;
    btnList: TsuiButton;
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
    cxSplitter1: TcxSplitter;
    grdPrescription: TcxGrid;
    grdPrescriptionDBTV: TcxGridDBTableView;
    grdPrescriptionLV: TcxGridLevel;
    qryPrescription: TADOQuery;
    dsPrescription: TDataSource;
    qryPrescriptionDetail: TADOQuery;
    dsPrescriptionDetail: TDataSource;
    grdPrescriptionDBTVPrescriptionId: TcxGridDBColumn;
    grdPrescriptionDBTVPatient: TcxGridDBColumn;
    grdPrescriptionDBTVPrescriptionType: TcxGridDBColumn;
    grdPrescriptionDBTVPharmacyId: TcxGridDBColumn;
    grdPrescriptionDBTVPrescriptionDate: TcxGridDBColumn;
    grdPrescriptionDBTVPrescribedUser: TcxGridDBColumn;
    grdPrescriptionDBTVStatus: TcxGridDBColumn;
    grdPrescriptionDBTVUserTitle: TcxGridDBColumn;
    Panel1: TPanel;
    Image2: TImage;
    btnProcess: TsuiButton;
    btnCancel: TsuiButton;
    btnExcel: TsuiButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPrescriptionDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnListClick(Sender: TObject);
    procedure btnProcessClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrescriptionWorkList: TfrmPrescriptionWorkList;

implementation

uses DM;

{$R *.dfm}

procedure TfrmPrescriptionWorkList.btnExcelClick(Sender: TObject);
begin
    ExportToExcellNew(grdPrescription);
end;


procedure TfrmPrescriptionWorkList.btnListClick(Sender: TObject);
var
 yil1, ay1, gun1 : word;
 yil2, ay2, gun2 : word;
 wStatus : String;
 wSql    : String;
begin


  DecodeDate(dteStartDate.Date, yil1, ay1, gun1);
  DecodeDate(dteEndDate.Date, yil2, ay2, gun2);


  if DMMPharmacy.dbType = dbSQL  then
  begin
     wSql := 'SELECT Pr.PrescriptionId, '
          +'Pa.Name + '' '' + Pa.Surname as Patient, '
          +'Pr.PrescriptionType as PrescriptionType, Pr.RecordDate as PrescriptionDate, '
          +'Pr.RecordUserId as PrescribedUser, Pr.Status, U.UserTitle '
          +'FROM Prescription Pr '
          +'INNER JOIN Patient Pa ON Pr.PatientId = Pa.PatientId '
          +'INNER JOIN dbo.AppUser U ON Pr.RecordUserId = U.UserId  '
          +'WHERE 1 = 1 ';

          if dteStartDate.Text <> '' then
          begin
            wSql := wSql + ' AND RecordDate >= CONVERT(DATETIME, '''+inttostr(yil1)+'-'+inttostr(ay1)+'-'+inttostr(gun1) +' 00:00:00'', 102) ';
          end;

          if dteEndDate.Text <> '' then
          begin
            wSql := wSql + ' AND RecordDate <= CONVERT(DATETIME, '''+inttostr(yil2)+'-'+inttostr(ay2)+'-'+inttostr(gun2) +' 23:59:59'', 102) ';
          end;

  end
  else if DMMPharmacy.dbType = dbAccess  then
  begin
     wSql := 'SELECT Pr.PrescriptionId, '
         + 'Pa.Name + '' '' + Pa.Surname as Patient, '
         + 'Pr.PrescriptionType as PrescriptionType, Pr.RecordDate as PrescriptionDate, '
         + 'Pr.RecordUserId as PrescribedUser, Pr.Status, U.UserTitle  '
         + 'FROM (Prescription Pr '
         + 'INNER JOIN Patient Pa ON Pr.PatientId = Pa.PatientId) '
         + 'INNER JOIN AppUser U ON Pr.RecordUserId = U.UserId  '
         + 'WHERE 1 = 1 ';

          if dteStartDate.Text <> '' then
          begin
            wSql := wSql + ' AND Pr.RecordDate >= CDate(Format(('''+ IntToStr(yil1)+'-' +inttostr(ay1)+'-'+inttostr(gun1) + '''), "yyyy-mm-dd")) ';
          end;

          if dteEndDate.Text <> '' then
          begin
            wSql := wSql + ' AND Pr.RecordDate <= CDate(Format(('''+ IntToStr(yil2)+'-' +inttostr(ay2)+'-'+inttostr(gun2) + '''), "yyyy-mm-dd")) + 1 ';
          end;
  end;

    if lkpPharmacy.Text <> '' then
    begin
      wSql := wSql + ' AND Pr.PharmacyId = ' + IntToStr(lkpPharmacy.EditValue);
    end;

    wStatus := '0';
    if chkOrdered.Checked then
      wStatus := wStatus + ',1';
    if chkCancelled.Checked then
      wStatus := wStatus + ',3';
    if chkProcessed.Checked then
      wStatus := wStatus + ',4';

    if wStatus <> '0'  then
    begin
       wSql := wSql + ' AND Pr.Status IN ( ' + wStatus + ') ';
    end;


  qryPrescription.Close;
  qryPrescription.SQL.Text := wSql;
  qryPrescription.Open;
end;

procedure TfrmPrescriptionWorkList.btnProcessClick(Sender: TObject);
var
 qryTemp : TADOQuery;
 btn     : TsuiButton;
 status  : Integer;
begin

  btn := Sender as TsuiButton;
  if btn = btnProcess then
   status := 4
  else if btn = btnCancel then
   status := 3;


  if qryPrescription.FieldByName('PrescriptionId').AsInteger > 0 then
  begin
    qryTemp := DMMPharmacy.CreateQuery;
    qryTemp.Close;
    qryTemp.SQL.Text := 'SELECT * FROM Prescription WHERE PrescriptionId = '
                       +IntToStr(qryPrescription.FieldByName('PrescriptionId').AsInteger);
    qryTemp.Open;

    qryTemp.Edit;
    qryTemp.FieldByName('Status').AsInteger := status;
    qryTemp.Post;

    btnListClick(Sender);
    qryTemp.Destroy;
  end;

end;

procedure TfrmPrescriptionWorkList.dsPrescriptionDataChange(Sender: TObject;
  Field: TField);
begin

   if qryPrescription.FieldByName('PrescriptionId').AsInteger > 0 then
   begin
     qryPrescriptionDetail.Close;
     qryPrescriptionDetail.SQL.Text := 'SELECT '
                                      +'D.DrugName, PD.Amount, PD.Dosage, PD.Form, PD.Frequency, '
                                      +'PD.Duration, PD.Period, PD.StartDate, PD.EndDate   '
                                      +'FROM PrescriptionDetail PD  '
                                      +'INNER JOIN Drug D ON Pd.DrugId = D.DrugId  '
                                      +'WHERE PD.PrescriptionId = '
                                      + IntToStr(qryPrescription.FieldByName('PrescriptionId').AsInteger);
     qryPrescriptionDetail.Open;
   end
   else
   begin
     qryPrescriptionDetail.Close;
   end;

end;

procedure TfrmPrescriptionWorkList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   action := caFree;
end;

procedure TfrmPrescriptionWorkList.FormShow(Sender: TObject);
begin
   dteStartDate.Date := Today - 30;
   dteEndDate.Date   := Today;
   btnListClick(Sender);
end;

end.
