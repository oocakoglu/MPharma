unit DM;

interface

uses
  SysUtils, Classes, SUIMgr, DB, ADODB, cxClasses, cxStyles, cxGridTableView,
  cxEdit, cxDBEditRepository, Forms, cxEditRepositoryItems, untUserAuthority,
  IniFiles;

type
  TDatabaseType = (dbAccess = 1, dbSQL = 2, dbOracle = 3, dbFile = 3);
  TKeyDownStatus=(kdsNone, kdsSelect, kdsEnter, kdsEscape);


type
  TDMMPharmacy = class(TDataModule)
    sflthm1: TsuiFileTheme;
    ADOCon: TADOConnection;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    StyleAdet1: TcxStyle;
    StyleAdet2: TcxStyle;
    styleTutar1: TcxStyle;
    styleTutar2: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    StyleOlumlu: TcxStyle;
    StyleOlumsuz: TcxStyle;
    styleOlumluFont: TcxStyle;
    styleOlumsuzFont: TcxStyle;
    StyleGosterim: TcxStyle;
    GriTema: TcxGridTableViewStyleSheet;
    OfficeTema: TcxGridTableViewStyleSheet;
    cxEditRepository1: TcxEditRepository;
    PharmacyNames: TcxEditRepositoryLookupComboBoxItem;
    qryPharmacyNames: TADOQuery;
    dsPharmacyNames: TDataSource;
    PresStatus: TcxEditRepositoryImageComboBoxItem;
    PresType: TcxEditRepositoryImageComboBoxItem;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    dbType: TDatabaseType;
    keyDownStatus : TKeyDownStatus;
    function  CreateQuery(): TADOQuery;
  end;

var
  DMMPharmacy : TDMMPharmacy;
  UserData    : TUserAuthority;

implementation

{$R *.dfm}


function TDMMPharmacy.CreateQuery(): TADOQuery;
var
  qry: TADOQuery;
begin

  qry := TADOQuery.Create(nil);
  qry.Connection := DMMPharmacy.ADOCon;
  qry.CommandTimeout := 90;
  Result := qry;
end;

procedure TDMMPharmacy.DataModuleCreate(Sender: TObject);
var
 ConStr   : String;
 pType    : string;
 exePath  : String;
 IniDosya : TiniFile;
begin
  exePath := ExtractFilePath(Application.ExeName);
  sflthm1.ThemeFile := exePath  + '\Midsummer.ssk';
  dbType := dbSQL;

  if dbType = dbSQL then
     ConStr := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MPHARMA;Data Source=.\KFMC;'
     //ConStr := 'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=MPHARMA;Data Source=.'
  else if dbType = dbAccess then
     ConStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' + exePath + '\\MPharma.mdb;Persist Security Info=False'
     //ConStr := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MPharma.mdb;Persist Security Info=False';
  else if dbType = dbFile then
  begin
     IniDosya  := TIniFile.Create(exePath + '\\PROPERTIES.INI');
     ConStr    := IniDosya.ReadString('GENERAL_PROPERTIES', 'CONSTR','');
     pType     := IniDosya.ReadString('GENERAL_PROPERTIES', 'DBTYPE','');
     IniDosya.Destroy;

     //dbType := dbSQL;
     if pType = 'dbAccess' then
       dbType :=  dbAccess
     else
       dbType :=  dbSQL;
  end;


  ADOCon.Close;
  ADOCon.ConnectionString := ConStr;
  ADOCon.Open;

  //**User and Authority Data
  UserData := TUserAuthority.Create;
  qryPharmacyNames.Open;
end;





end.
