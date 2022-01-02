unit untDrugInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, ADODB, SUIPageControl,
  SUITabControl, cxLabel, cxDBLabel, dxGDIPlusClasses, cxImage, cxMemo, cxDBEdit,
  Menus, cxButtons;

type
  TfrmDrugInformation = class(TForm)
    suifrmDrugInformation: TsuiForm;
    pnlLeft: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    grdDrug: TcxGrid;
    grdDrugDBTV: TcxGridDBTableView;
    grdDrugLV: TcxGridLevel;
    Label1: TLabel;
    txtDrugName: TcxTextEdit;
    qryDrug: TADOQuery;
    dsDrug: TDataSource;
    grdDrugDBTVDrugName: TcxGridDBColumn;
    pnlBody: TPanel;
    tabStockEntry: TsuiPageControl;
    Panel1: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    suiTabSheet1: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    suiTabSheet3: TsuiTabSheet;
    suiTabSheet4: TsuiTabSheet;
    lblBarkod: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBMemo1: TcxDBMemo;
    imgOzetResim: TcxImage;
    Label10: TLabel;
    cxDBLabel7: TcxDBLabel;
    cxDBLabel8: TcxDBLabel;
    Label11: TLabel;
    cxDBLabel9: TcxDBLabel;
    btnSave: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure txtDrugNamePropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrugInformation: TfrmDrugInformation;

implementation

uses DM;

{$R *.dfm}

procedure TfrmDrugInformation.btnSaveClick(Sender: TObject);
begin
 qryDrug.Post;
end;

procedure TfrmDrugInformation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDrugInformation.txtDrugNamePropertiesChange(Sender: TObject);
begin
  qryDrug.Close;
  qryDrug.SQL.Text := 'SELECT TOP 500 * FROM Drug WHERE DrugName like ' + QuotedStr(txtDrugName.Text + '%');
  qryDrug.Open;
end;

end.
