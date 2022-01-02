unit untUserDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Menus, StdCtrls, cxButtons, jpeg, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxTextEdit, DB, ADODB;

type
  TfrmUserDefinition = class(TForm)
    suifrmUserDefinition: TsuiForm;
    Image1: TImage;
    Panel1: TPanel;
    btnAdd: TcxButton;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryAppUser: TADOQuery;
    dsAppUser: TDataSource;
    dbPassword: TcxDBTextEdit;
    dbUserName: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    dbUserJob: TcxDBComboBox;
    Label5: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure dsAppUserStateChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure qryAppUserAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetUser(UserId : Integer);
    procedure SetUserYetki(UserId : Integer ; FormGroupId : Integer; FormCaption : String; FormName : String ;  Access : boolean);
  end;

var
  frmUserDefinition: TfrmUserDefinition;

implementation

uses DM;

{$R *.dfm}


procedure TfrmUserDefinition.GetUser(UserId : Integer);
begin

  //** Hasta
  qryAppUser.Close;
  qryAppUser.SQL.Text := 'SELECT * FROM AppUser WHERE UserId =  ' + IntToStr(UserId);
  qryAppUser.Open;

  if UserId = 0 then
    qryAppUser.Append;

end;




procedure TfrmUserDefinition.btnAddClick(Sender: TObject);
begin
  qryAppUser.Append;
end;

procedure TfrmUserDefinition.btnCancelClick(Sender: TObject);
begin
  qryAppUser.Cancel;
end;

procedure TfrmUserDefinition.btnDeleteClick(Sender: TObject);
begin
  qryAppUser.Delete;
end;

procedure TfrmUserDefinition.btnSaveClick(Sender: TObject);
begin

  if dbUserName.Text = '' then
  begin
    ShowMessage('Please enter user job');
    Abort;
  end;

  if dbPassword.Text = '' then
  begin
    ShowMessage('Please enter user password');
    Abort;
  end;

  if dbUserJob.Text = '' then
  begin
    ShowMessage('Please enter user job');
    Abort;
  end;

  qryAppUser.Post;
end;

procedure TfrmUserDefinition.dsAppUserStateChange(Sender: TObject);
begin
   if qryAppUser.State in [dsInsert, dsEdit] then
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


procedure TfrmUserDefinition.qryAppUserAfterPost(DataSet: TDataSet);
var
  userId : Integer;
  job    : String;
begin
  userId := qryAppUser.FieldByName('UserId').AsInteger;
  job    := qryAppUser.FieldByName('UserJob').AsString;

  if job = 'Admin' then
  begin
    SetUserYetki(userId, 1, 'Patient List', 'frmPatientList', true);
    SetUserYetki(userId, 1, 'OutPatient Prescription', 'frmPrescription', true);
    SetUserYetki(userId, 1, 'Prescription Worklist', 'frmPrescriptionWorkList', true);
    SetUserYetki(userId, 2, 'Drug Definition', 'frmDrugDefiniton', true);
    SetUserYetki(userId, 2, 'User and Authorization', 'frmAuthorization', true);
  end
  else if job = 'Physician' then
  begin
    SetUserYetki(userId, 1, 'Patient List', 'frmPatientList', true);
    SetUserYetki(userId, 1, 'OutPatient Prescription', 'frmPrescription', true);
    SetUserYetki(userId, 1, 'Prescription Worklist', 'frmPrescriptionWorkList', false);
    SetUserYetki(userId, 2, 'Drug Definition', 'frmDrugDefiniton', true);
    SetUserYetki(userId, 2, 'User and Authorization', 'frmAuthorization', false);
  end
  else if job = 'Pharmacist' then
  begin
    SetUserYetki(userId, 1, 'Patient List', 'frmPatientList', false);
    SetUserYetki(userId, 1, 'OutPatient Prescription', 'frmPrescription', true);
    SetUserYetki(userId, 1, 'Prescription Worklist', 'frmPrescriptionWorkList', false);
    SetUserYetki(userId, 2, 'Drug Definition', 'frmDrugDefiniton', true);
    SetUserYetki(userId, 2, 'User and Authorization', 'frmAuthorization', false);
  end

end;


procedure  TfrmUserDefinition.SetUserYetki(UserId : Integer ; FormGroupId : Integer; FormCaption : String; FormName : String ;  Access : boolean);
var
  qrykullaniciYetki : TADOQuery;
begin
    qrykullaniciYetki := DMMPharmacy.CreateQuery;

    qrykullaniciYetki.Close;
    qrykullaniciYetki.SQL.Text := 'SELECT * FROM AppAuthorization WHERE UserId =  '+IntToStr(UserId)
                                 +'  And FormGroupId = '+ IntToStr(FormGroupId)
                                 +'  And FormName = '+QuotedStr(FormName);
    qrykullaniciYetki.Open;

    if  qrykullaniciYetki.RecordCount = 0 then
    begin
      qrykullaniciYetki.Insert;
      qrykullaniciYetki.Fieldbyname('UserId').AsInteger        := UserId;
      qrykullaniciYetki.Fieldbyname('FormGroupId').AsInteger   := FormGroupId;
      qrykullaniciYetki.Fieldbyname('FormCaption').AsString    := FormCaption;
      qrykullaniciYetki.Fieldbyname('FormName').AsString       := FormName;
      qrykullaniciYetki.Fieldbyname('Access').AsBoolean        := Access;
      qrykullaniciYetki.Post;
    end;
    qrykullaniciYetki.Destroy;

end;

end.
