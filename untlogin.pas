unit untlogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, StdCtrls, cxLabel, cxTextEdit,
  cxRadioGroup, jpeg, dxGDIPlusClasses, DB, ADODB, ActnList;

type
  Tfrmlogin = class(TForm)
    suiForm1: TsuiForm;
    Image1: TImage;
    img1: TImage;
    txtUsername: TcxTextEdit;
    txtPassword: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    btnCancel: TButton;
    btnLogin: TButton;
    ActionList1: TActionList;
    ac_HizliGiris: TAction;
    procedure btnCancelClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_HizliGirisExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation

uses DM;

{$R *.dfm}


procedure Tfrmlogin.ac_HizliGirisExecute(Sender: TObject);
var
   qrylogin : TADOQuery;
   frm : String;
begin
    qrylogin := DMMPharmacy.CreateQuery;
    qrylogin.Close;
    qrylogin.SQL.Text := 'SELECT top 1 UserId, UserTitle, UserJob FROM AppUser';
    qrylogin.Open;

    UserData.SetUser(
    qrylogin.FieldByName('UserId').AsInteger,
    qrylogin.FieldByName('UserTitle').AsString,
    qrylogin.FieldByName('UserJob').AsString);
    UserData.SetUserAuth(DMMPharmacy.ADOCon, qrylogin.FieldByName('UserId').AsInteger);
    qrylogin.Destroy;
    ModalResult  := mrOk;
end;

procedure Tfrmlogin.btnCancelClick(Sender: TObject);
begin
   ModalResult :=mrCancel;
end;

procedure Tfrmlogin.btnLoginClick(Sender: TObject);
var
  qrylogin : TADOQuery;
  frm      : String;
begin

  if txtUsername.Text= '' then
  begin
    MessageDlg('Please fill Username', mtWarning, [mbOK], 0);
    Abort;
  end;

  if txtPassword.Text= '' then
  begin
    MessageDlg('Please enter your password', mtWarning, [mbOK], 0);
    Abort;
  end;

  try
    qrylogin := DMMPharmacy.CreateQuery;
    qrylogin.Close;
    qrylogin.SQL.Text := 'Select * From AppUser Where UserName   = ' + QuotedStr(txtUsername.Text)
                                                 +' And Password = ' + QuotedStr(txtPassword.Text);
    qrylogin.Open;

    if qrylogin.RecordCount > 0 then
    begin
      UserData.SetUser(
      qrylogin.FieldByName('UserId').AsInteger,
      qrylogin.FieldByName('UserTitle').AsString,
      qrylogin.FieldByName('UserJob').AsString);
      UserData.SetUserAuth(DMMPharmacy.ADOCon, qrylogin.FieldByName('UserId').AsInteger);
      ModalResult  := mrOk;
    end
    else
      MessageDlg('Username or password Wrong', mtWarning, [mbOK], 0);

    qrylogin.Destroy;
  except;
    ModalResult :=mrCancel;
  end;


end;

procedure Tfrmlogin.FormShow(Sender: TObject);
begin
   btnLogin.Default := True;
   txtUsername.SetFocus;
end;

end.
