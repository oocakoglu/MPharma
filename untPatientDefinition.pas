unit untPatientDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, ExtCtrls, SUIForm, jpeg, DB, ADODB, cxControls, cxContainer,
  cxEdit, cxMemo, cxDBEdit, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  SUIButton, cxSpinEdit, Mask, DBCtrls, SUIDBCtrls;

type
  TfrmPatientDefinition = class(TForm)
    suiForm1: TsuiForm;
    Panel1: TPanel;
    btnAdd: TcxButton;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    qryPatient: TADOQuery;
    dsPatient: TDataSource;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBComboBox2: TcxDBComboBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    Label11: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label14: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    lblAdress: TLabel;
    cxDBMemo2: TcxDBMemo;
    Label15: TLabel;
    Label16: TLabel;
    cxDBMemo3: TcxDBMemo;
    cxDBMemo4: TcxDBMemo;
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsPatientStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetPatient(PatientId : Integer);
  end;

var
  frmPatientDefinition: TfrmPatientDefinition;

implementation

uses DM;

{$R *.dfm}

procedure TfrmPatientDefinition.btnAddClick(Sender: TObject);
begin
  qryPatient.Append;
end;

procedure TfrmPatientDefinition.btnCancelClick(Sender: TObject);
begin
  qryPatient.Cancel;
end;

procedure TfrmPatientDefinition.btnDeleteClick(Sender: TObject);
begin
  qryPatient.Delete;
end;

procedure TfrmPatientDefinition.btnSaveClick(Sender: TObject);
begin
  qryPatient.Post;
end;


procedure TfrmPatientDefinition.GetPatient(PatientId : Integer);
begin

  //** Hasta
  qryPatient.Close;
  qryPatient.SQL.Text := 'Select * From Patient Where PatientId = ' + IntToStr(PatientId);
  qryPatient.Open;

  if PatientId = 0 then
    qryPatient.Append;

end;

procedure TfrmPatientDefinition.dsPatientStateChange(Sender: TObject);
begin
   if qryPatient.State in [dsInsert, dsEdit] then
   begin
     btnAdd.Enabled := False;
     btnDelete.Enabled  := False;
     btnSave.Enabled := True;
     btnCancel.Enabled := True;
   end
   else
   begin
     btnAdd.Enabled := True;
     btnDelete.Enabled  := True;
     btnSave.Enabled := False;
     btnCancel.Enabled := False;
   end
end;

end.
