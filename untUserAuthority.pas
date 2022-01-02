unit untUserAuthority;
//unit clsTMarks;

interface

uses Sysutils, ADODB;          //Added because IntToStr is used in this unit

type
  TUserAuthority = class           //Defining class TMarks
    private
      Surname : String;

      fUserId   : Integer;
      fUserTitle : String;
      fUserJob   : String;

      frmPatientList          : Boolean;
      frmPrescription         : Boolean;
      frmPrescriptionWorkList : Boolean;
      frmDrugDefiniton        : Boolean;
      frmAuthorization        : Boolean;
      function  GetUserYetki(con : TADOConnection; UserId : Integer ; FormGroupId : Integer; FormCaption : String; FormName : String): Boolean;
    public
      property UserId: Integer read fUserId;
      property UserTitle: String read fUserTitle;
      property UserJob: String read fUserJob;

      property autfrmPatientList: Boolean read frmPatientList;
      property autfrmPrescription: Boolean read frmPrescription;
      property autfrmPrescriptionWorkList: Boolean read frmPrescriptionWorkList;
      property autfrmDrugDefiniton: Boolean read frmDrugDefiniton;
      property autfrmAuthorization: Boolean read frmAuthorization;

      //property Text: string read GetText write SetText;
      //property Capacity: Longint read FCapacity write SetCapacity;
      // class property Red: Integer read FRed write FRed;

      constructor Create; overload;
      procedure SetUser(UserId : Integer; UserTitle : String; UserJob : String);
      procedure SetUserAuth(con : TADOConnection; UserId : Integer);
      //function getAverage : String;
      //function showMarks : String;
  end;

var
  iAverage : Integer;        //Variable used in this unit

implementation

constructor TUserAuthority.Create;
begin
  fUserId    := 0;
  fUserTitle := '';
  frmPatientList  := false;
  frmPrescription := false;
  frmPrescriptionWorkList := false;
  frmDrugDefiniton := false;
  frmAuthorization := False;
end;

procedure TUserAuthority.SetUser(UserId : Integer; UserTitle : String; UserJob : String);
begin
  fUserId := UserId;
  fUserTitle := UserTitle;
  fUserJob := UserJob;
end;

procedure TUserAuthority.SetUserAuth(con : TADOConnection; UserId : Integer);
begin
  frmPatientList          := GetUserYetki(con, UserId, 1, 'Patient List', 'frmPatientList');
  frmPrescription         := GetUserYetki(con, UserId, 1, 'OutPatient Prescription', 'frmPrescription');
  frmPrescriptionWorkList := GetUserYetki(con, UserId, 1, 'Prescription Worklist', 'frmPrescriptionWorkList');
  frmDrugDefiniton        := GetUserYetki(con, UserId, 2, 'Drug Definition', 'frmDrugDefiniton');
  frmAuthorization        := GetUserYetki(con, UserId, 2, 'User and Authorization', 'frmAuthorization');
end;


function  TUserAuthority.GetUserYetki(con : TADOConnection; UserId : Integer ; FormGroupId : Integer; FormCaption : String; FormName : String): Boolean;
var
  qryUserAuth : TADOQuery;
begin

  qryUserAuth := TADOQuery.Create(nil);
  qryUserAuth.Connection := con;
  qryUserAuth.CommandTimeout := 90;

  qryUserAuth.SQL.Text := 'SELECT * FROM AppAuthorization WHERE UserId =  '+IntToStr(UserId)
                         +'  And FormGroupId = '+ IntToStr(FormGroupId)
                         +'  And FormName = '+QuotedStr(FormName);
  qryUserAuth.Open;


  if  qryUserAuth.RecordCount > 0 then
  begin
      Result := qryUserAuth.Fieldbyname('Access').AsBoolean;
  end
  else
  begin
      qryUserAuth.Insert;
      qryUserAuth.Fieldbyname('UserId').AsInteger        := UserId;
      qryUserAuth.Fieldbyname('FormGroupId').AsInteger   := FormGroupId;
      qryUserAuth.Fieldbyname('FormCaption').AsString    := FormCaption;
      qryUserAuth.Fieldbyname('FormName').AsString       := FormName;
      qryUserAuth.Fieldbyname('Access').AsBoolean        := false;
      qryUserAuth.Post;
      Result := false;
  end;
  qryUserAuth.Destroy;

end;



//procedure  TDMMPharmacy.SetUserAut(UserId : Integer);
//begin
//  UserData.autfrmPatientList          = GetUserYetki(UserId, 1, 'Patient List', 'frmPatientList');
//  UserData.autfrmPrescription         = GetUserYetki(UserId, 1, 'OutPatient Prescription', 'frmPrescription');
//  UserData.autfrmPrescriptionWorkList = GetUserYetki(UserId, 1, 'Prescription Worklist', 'frmPrescriptionWorkList');
//  UserData.autfrmDrugDefiniton        = GetUserYetki(UserId, 2, 'Drug Definition', 'frmDrugDefiniton');
//  UserData.autfrmAuthorization        = GetUserYetki(UserId, 2, 'User and Authorization', 'frmAuthorization');
//end;

//constructor TMarks.Create;
//begin
//  Surname := '';
//  Test1 := 0;
//  Test2 := 0;
//  Test3 := 0;
//end;
//
//constructor TMarks.Create(pSurname : String; pTest1, pTest2, pTest3 : Integer);
//begin
//  Surname := pSurname;     //Puts values into this class
//  Test1 := pTest1;
//  Test2 := pTest2;
//  Test3 := pTest3;
//end;

//function TMarks.getAverage: String;
//begin
//  iAverage := (Test1 + Test2 + Test3) DIV 3;   //Calculates average
//  getAverage := Surname + #9 + IntToStr(Test1) + #9 + IntToStr(Test2) + #9 +
//  IntToStr(Test3) + #9 + IntToStr(iAverage);
//end;
//
//function TMarks.showMarks: String;
//begin
//  showMarks := Surname + #9 + IntToStr(Test1) + #9 + IntToStr(Test2) + #9 +
//  IntToStr(Test3);                      //Display marks note the tabs (#9)
//end;

end.
