unit untAuthorization;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, cxCheckBox, Menus,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxSplitter, ADODB,
  jpeg;

type
  TfrmAuthorization = class(TForm)
    suifrmAuthorization: TsuiForm;
    qryUser: TADOQuery;
    dsUser: TDataSource;
    dsAppAuthorization: TDataSource;
    qryAppAuthorization: TADOQuery;
    cxSplitter1: TcxSplitter;
    pnlLeft: TPanel;
    grdUser: TcxGrid;
    grdUserTV: TcxGridDBTableView;
    grdUserLV: TcxGridLevel;
    Panel1: TPanel;
    btnUserDetail: TcxButton;
    cxButton2: TcxButton;
    pnlAuthorization: TPanel;
    Panel3: TPanel;
    btnSave: TcxButton;
    grdUserTVUserId: TcxGridDBColumn;
    grdUserTVUserName: TcxGridDBColumn;
    grdUserTVPassword: TcxGridDBColumn;
    grdUserTVUserTitle: TcxGridDBColumn;
    grdUserTVUserPhone: TcxGridDBColumn;
    grdAppAuthorization: TcxGrid;
    grdAppAuthorizationDBMasterTV: TcxGridDBTableView;
    grdAppAuthorizationDBMasterTVGRUP_ID: TcxGridDBColumn;
    grdAppAuthorizationDBMasterTVGRUP_ADI: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTV: TcxGridDBTableView;
    grdAppAuthorizationLM: TcxGridLevel;
    grdAppAuthorizationLD: TcxGridLevel;
    qryFormGroup: TADOQuery;
    dsFormGroup: TDataSource;
    grdAppAuthorizationDBDetailTVAuthorizationId: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTVUserId: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTVFormGroupId: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTVFormCaption: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTVFormName: TcxGridDBColumn;
    grdAppAuthorizationDBDetailTVAccess: TcxGridDBColumn;
    imgBottom: TImage;
    grdUserTVColumn1: TcxGridDBColumn;
    procedure dsUserDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dsAppAuthorizationStateChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnUserDetailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAuthorization: TfrmAuthorization;

implementation

uses DM, untUserDefinition, untMainMPharmacy;

{$R *.dfm}

procedure TfrmAuthorization.btnSaveClick(Sender: TObject);
begin
  if qryAppAuthorization.State in [dsInsert , dsEdit]  then
     qryAppAuthorization.Post;
end;

procedure TfrmAuthorization.btnUserDetailClick(Sender: TObject);
begin
   Application.CreateForm(TfrmUserDefinition,frmUserDefinition);
   frmUserDefinition.GetUser(qryUser.FieldByName('UserId').AsInteger);
   frmUserDefinition.ShowModal;
   qryUser.Close;
   qryUser.Open;
end;

procedure TfrmAuthorization.cxButton2Click(Sender: TObject);
begin
   Application.CreateForm(TfrmUserDefinition,frmUserDefinition);
   frmUserDefinition.GetUser(0);
   frmUserDefinition.ShowModal;
   qryUser.Close;
   qryUser.Open;
end;

procedure TfrmAuthorization.dsAppAuthorizationStateChange(Sender: TObject);
begin
   if qryAppAuthorization.State in [dsInsert, dsEdit] then
   begin
     btnSave.Enabled := True;
   end
   else
   begin
     btnSave.Enabled := False;
   end
end;

procedure TfrmAuthorization.dsUserDataChange(Sender: TObject; Field: TField);
begin
  qryAppAuthorization.Close;
  qryAppAuthorization.SQL.Text := 'SELECT * FROM AppAuthorization WHERE UserId = '
                                 + qryUser.Fieldbyname('UserId').AsString
                                 + ' ORDER BY FormGroupId';
  qryAppAuthorization.Open;

  grdAppAuthorizationDBMasterTV.ViewData.Expand(True);
end;

procedure TfrmAuthorization.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  UserData.SetUserAuth(DMMPharmacy.ADOCon, UserData.UserId);
  frmMainMPharmacy.CheckAuthority;
  action := cafree;
end;

procedure TfrmAuthorization.FormShow(Sender: TObject);
begin
  qryUser.Open;
  qryFormGroup.Open;
  grdAppAuthorizationDBMasterTV.ViewData.Expand(True);
end;

end.
