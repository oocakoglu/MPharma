unit untDrugDefiniton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SUIForm, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, StdCtrls, jpeg, ADODB, cxDBEdit, Menus, cxMaskEdit,
  cxSpinEdit, cxButtons, cxDropDownEdit, cxNavigator, cxDBNavigator, cxCheckBox,
  cxCurrencyEdit;

type
  TfrmDrugDefiniton = class(TForm)
    suiForm1: TsuiForm;
    qryDrug: TADOQuery;
    dsDrug: TDataSource;
    pnlLeft: TPanel;
    Panel2: TPanel;
    Image2: TImage;
    Label1: TLabel;
    grdDrug: TcxGrid;
    grdDrugDBTV: TcxGridDBTableView;
    grdDrugDBTVDrugName: TcxGridDBColumn;
    grdDrugLV: TcxGridLevel;
    txtDrugName: TcxTextEdit;
    Panel1: TPanel;
    Image1: TImage;
    Label2: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    Panel3: TPanel;
    btnAdd: TcxButton;
    btnDelete: TcxButton;
    btnSave: TcxButton;
    btnCancel: TcxButton;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBSpinEdit3: TcxDBSpinEdit;
    cxDBComboBox1: TcxDBComboBox;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBComboBox3: TcxDBComboBox;
    cxDBComboBox4: TcxDBComboBox;
    cxDBComboBox5: TcxDBComboBox;
    cxDBComboBox2: TcxDBComboBox;
    cxDBComboBox6: TcxDBComboBox;
    cxDBComboBox7: TcxDBComboBox;
    grdDrugRouteTV: TcxGridDBTableView;
    grdDrugRouteLV: TcxGridLevel;
    grdDrugRoute: TcxGrid;
    qryDrugRoute: TADODataSet;
    dsDrugRoute: TDataSource;
    grdDrugRouteTVDrugRouteId: TcxGridDBColumn;
    grdDrugRouteTVDrugId: TcxGridDBColumn;
    grdDrugRouteTVRouteName: TcxGridDBColumn;
    grdDrugRouteTVDefaultRoute: TcxGridDBColumn;
    cxDBNavigator1: TcxDBNavigator;
    grdFrequency: TcxGrid;
    grdFrequencyTV: TcxGridDBTableView;
    grdFrequencyLV: TcxGridLevel;
    qryFrequency: TADODataSet;
    dsFrequency: TDataSource;
    grdFrequencyTVFrequencyId: TcxGridDBColumn;
    grdFrequencyTVDrugId: TcxGridDBColumn;
    grdFrequencyTVFrequencyName: TcxGridDBColumn;
    grdFrequencyTVDefaultFrequency: TcxGridDBColumn;
    cxDBNavigator2: TcxDBNavigator;
    Label19: TLabel;
    qryPeriod: TADODataSet;
    dsPeriod: TDataSource;
    cxDBNavigator3: TcxDBNavigator;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DrugPeriodId: TcxGridDBColumn;
    cxGridDBTableView1DrugId: TcxGridDBColumn;
    cxGridDBTableView1PeriodName: TcxGridDBColumn;
    cxGridDBTableView1DefaultPeriod: TcxGridDBColumn;
    Label20: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBComboBox8: TcxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtDrugNamePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dsDrugStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDrugDefiniton: TfrmDrugDefiniton;

implementation

uses DM;

{$R *.dfm}

procedure TfrmDrugDefiniton.btnAddClick(Sender: TObject);
begin
  qryDrug.Append;
end;

procedure TfrmDrugDefiniton.btnCancelClick(Sender: TObject);
begin
  qryDrug.Cancel;
end;

procedure TfrmDrugDefiniton.btnDeleteClick(Sender: TObject);
begin
  qryDrug.Delete;
end;

procedure TfrmDrugDefiniton.btnSaveClick(Sender: TObject);
begin
  qryDrug.Post;
end;

procedure TfrmDrugDefiniton.dsDrugStateChange(Sender: TObject);
begin
   if qryDrug.State in [dsInsert, dsEdit] then
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

procedure TfrmDrugDefiniton.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDrugDefiniton.FormShow(Sender: TObject);
begin
  qryDrug.Open;
end;

procedure TfrmDrugDefiniton.txtDrugNamePropertiesChange(Sender: TObject);
begin
  qryDrug.Close;
  qryDrug.SQL.Text := 'SELECT TOP 500 * FROM Drug WHERE DrugName like ' + QuotedStr(txtDrugName.Text + '%');
  qryDrug.Open;
end;

end.
