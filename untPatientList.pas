unit untPatientList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, cxControls, cxContainer, cxEdit, StdCtrls, cxTextEdit, cxButtons, jpeg,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ADODB, SUIButton,
  Buttons, untDef;

type
  TfrmPatientList = class(TForm)
    suifrmPatientList: TsuiForm;
    Panel1: TPanel;
    Image1: TImage;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    qryPatientList: TADOQuery;
    dsPatientList: TDataSource;
    grdPatient: TcxGrid;
    grdPatientDBTV: TcxGridDBTableView;
    grdPatientLV: TcxGridLevel;
    grdPatientDBTVPatientId: TcxGridDBColumn;
    grdPatientDBTVName: TcxGridDBColumn;
    grdPatientDBTVSurname: TcxGridDBColumn;
    grdPatientDBTVFatherName: TcxGridDBColumn;
    grdPatientDBTVBirthPlace: TcxGridDBColumn;
    grdPatientDBTVBirthDate: TcxGridDBColumn;
    grdPatientDBTVGender: TcxGridDBColumn;
    grdPatientDBTVNationality: TcxGridDBColumn;
    grdPatientDBTVNationalId: TcxGridDBColumn;
    grdPatientDBTVIqamaId: TcxGridDBColumn;
    grdPatientDBTVPhoneNumber: TcxGridDBColumn;
    btnNewPatient: TsuiButton;
    btnPatientDetail: TsuiButton;
    btnOutPatientPresc: TsuiButton;
    txtIqama: TcxTextEdit;
    txtName: TcxTextEdit;
    txtSurname: TcxTextEdit;
    txtPhoneNumber: TcxTextEdit;
    procedure btnNewPatientClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPatientDetailClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOutPatientPrescClick(Sender: TObject);
    procedure txtIqamaPropertiesChange(Sender: TObject);
    procedure btnInpatientClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPatientList: TfrmPatientList;

implementation

uses DM, untPatientDefinition, untPrescription;

{$R *.dfm}



procedure TfrmPatientList.btnNewPatientClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPatientDefinition,frmPatientDefinition);
  frmPatientDefinition.GetPatient(0);
  frmPatientDefinition.ShowModal;

  qryPatientList.Close;
  qryPatientList.Open;
end;

procedure TfrmPatientList.btnOutPatientPrescClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrescription, frmPrescription);
 frmPrescription.SetParametr(qryPatientList.FieldByName('PatientId').AsInteger, ptOutpatient);
 frmPrescription.show;
end;

procedure TfrmPatientList.btnInpatientClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrescription, frmPrescription);
 frmPrescription.SetParametr(qryPatientList.FieldByName('PatientId').AsInteger, ptInPatient);
 frmPrescription.show;
end;




procedure TfrmPatientList.btnPatientDetailClick(Sender: TObject);
begin
  Application.CreateForm(TfrmPatientDefinition,frmPatientDefinition);
  frmPatientDefinition.GetPatient(qryPatientList.FieldByName('PatientId').AsInteger);
  frmPatientDefinition.ShowModal;

  qryPatientList.Close;
  qryPatientList.Open;
end;

procedure TfrmPatientList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmPatientList.FormShow(Sender: TObject);
begin
   qryPatientList.Close;
   qryPatientList.Open;
   btnOutPatientPresc.Enabled := UserData.autfrmPrescription;
end;

procedure TfrmPatientList.txtIqamaPropertiesChange(Sender: TObject);
var
  sqlStr : String;
begin

 if txtIqama.Text <> '' then
   sqlStr := sqlStr + ' and (IqamaId like '+ QuotedStr(txtIqama.Text + '%') + ' or NationalId like '+ QuotedStr(txtIqama.Text + '%') + ')';

 if txtName.Text <> '' then
   sqlStr := sqlStr + ' and Name like ' + QuotedStr(txtName.Text+ '%');

 if txtSurname.Text <> '' then
   sqlStr := sqlStr + ' and Surname like ' + QuotedStr(txtSurname.Text+ '%');

 if txtPhoneNumber.Text <> '' then
   sqlStr := sqlStr + ' and PhoneNumber like ' + QuotedStr(txtPhoneNumber.Text+ '%');


 qryPatientList.Close;
 qryPatientList.SQL.Text := 'SELECT top 500 * FROM Patient WHERE 1 = 1 ' +  sqlStr;
 qryPatientList.Open;
end;

end.
