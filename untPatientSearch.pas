unit untPatientSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit, StdCtrls,
  jpeg, ExtCtrls, ADODB;

type
  TfrmPatientSearch = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label8: TLabel;
    txtIqama: TcxTextEdit;
    txtName: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    txtSurname: TcxTextEdit;
    txtPhoneNumber: TcxTextEdit;
    Label12: TLabel;
    qryPatientList: TADOQuery;
    dsPatientList: TDataSource;
    grdPatient: TcxGrid;
    grdPatientDBTV: TcxGridDBTableView;
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
    grdPatientLV: TcxGridLevel;
    ClearBtn: TButton;
    procedure txtIqamaPropertiesChange(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure grdPatientDBTVDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPatientSearch: TfrmPatientSearch;

implementation

 uses untWait, DM ;

{$R *.dfm}

procedure TfrmPatientSearch.ClearBtnClick(Sender: TObject);
begin
  txtIqama.Clear;
  txtName.Clear;
  txtSurname.Clear;
  txtPhoneNumber.Clear;

end;

procedure TfrmPatientSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPatientSearch.grdPatientDBTVDblClick(Sender: TObject);
begin
  DMMPharmacy.keyDownStatus := kdsSelect;
  OpenBekleForm('');
  CloseBekleForm;
end;

procedure TfrmPatientSearch.txtIqamaPropertiesChange(Sender: TObject);
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
