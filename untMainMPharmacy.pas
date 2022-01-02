unit untMainMPharmacy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIForm, Menus, SUIMainMenu, jpeg, ExtCtrls, SUIImagePanel, Buttons,
  StdCtrls, untDef, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxButtons,
  ComCtrls;

type
  TfrmMainMPharmacy = class(TForm)
    suiMDIForm1: TsuiMDIForm;
    btnPresWorkList: TsuiMainMenu;
    miPrescriptions: TMenuItem;
    miOutPatientPresc: TMenuItem;
    imglogo: TImage;
    suiImagePanel1: TsuiImagePanel;
    btnDrugInformation: TSpeedButton;
    Image1: TImage;
    btnOutPatientPresc: TSpeedButton;
    Image2: TImage;
    brnPresWorkList: TSpeedButton;
    Image3: TImage;
    SpeedButton4: TSpeedButton;
    miPatientList: TMenuItem;
    miPresWorkList: TMenuItem;
    Definition1: TMenuItem;
    miDrugDefinition: TMenuItem;
    miAuthorization: TMenuItem;
    StatusBar1: TStatusBar;
    procedure miOutPatientPrescClick(Sender: TObject);
    procedure btnOutPatientPrescClick(Sender: TObject);
    procedure miPatientListClick(Sender: TObject);
    procedure btnDrugInformationClick(Sender: TObject);
    procedure brnPresWorkListClick(Sender: TObject);
    procedure miDrugDefinitionClick(Sender: TObject);
    procedure miAuthorizationClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CheckAuthority();
  end;

var
  frmMainMPharmacy: TfrmMainMPharmacy;

implementation

uses DM, untPrescription, untPatientList, untDrugInformation,
  untPrescriptionWorkList, untDrugDefiniton, untAuthorization;

{$R *.dfm}

procedure TfrmMainMPharmacy.btnDrugInformationClick(Sender: TObject);
begin
 Application.CreateForm(TfrmDrugInformation, frmDrugInformation);
 frmDrugInformation.show;
end;

procedure TfrmMainMPharmacy.miDrugDefinitionClick(Sender: TObject);
begin
 Application.CreateForm(TfrmDrugDefiniton, frmDrugDefiniton);
 frmDrugDefiniton.show;
end;

procedure TfrmMainMPharmacy.FormShow(Sender: TObject);
begin
 imgLogo.Align := alClient;
 CheckAuthority();
end;

procedure TfrmMainMPharmacy.miOutPatientPrescClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrescription, frmPrescription);
 frmPrescription.SetParametr(0, ptOutPatient);
 frmPrescription.show;
end;

procedure TfrmMainMPharmacy.miPatientListClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPatientList, frmPatientList);
 frmPatientList.show;
end;

procedure TfrmMainMPharmacy.btnOutPatientPrescClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrescription, frmPrescription);
 frmPrescription.SetParametr(0, ptOutPatient);
 frmPrescription.show;
end;

procedure TfrmMainMPharmacy.miAuthorizationClick(Sender: TObject);
begin
 Application.CreateForm(TfrmAuthorization, frmAuthorization);
 frmAuthorization.show;
end;

procedure TfrmMainMPharmacy.brnPresWorkListClick(Sender: TObject);
begin
 Application.CreateForm(TfrmPrescriptionWorkList, frmPrescriptionWorkList);
 frmPrescriptionWorkList.show;
end;

procedure TfrmMainMPharmacy.CheckAuthority();
begin
  miPatientList.Enabled     := UserData.autfrmPatientList;
  miOutPatientPresc.Enabled := UserData.autfrmPrescription;
  miPresWorkList.Enabled    := UserData.autfrmPrescriptionWorkList;
  miDrugDefinition.Enabled  := UserData.autfrmDrugDefiniton;
  miAuthorization.Enabled   := UserData.autfrmAuthorization;

  btnOutPatientPresc.Enabled := UserData.autfrmPrescription;
  brnPresWorkList.Enabled    := UserData.autfrmPrescriptionWorkList;

  StatusBar1.Panels[0].Text := UserData.UserTitle;
  StatusBar1.Panels[1].Text := UserData.UserJob;
end;


end.
