program MPharmacy;

uses
  Forms,
  Controls,
  untMainMPharmacy in 'untMainMPharmacy.pas' {frmMainMPharmacy},
  DM in 'DM.pas' {DMMPharmacy: TDataModule},
  untPatientDefinition in 'untPatientDefinition.pas' {frmPatientDefinition},
  untPatientList in 'untPatientList.pas' {frmPatientList},
  untDrugInformation in 'untDrugInformation.pas' {frmDrugInformation},
  untPatientSearch in 'untPatientSearch.pas' {frmPatientSearch},
  untWait in 'untWait.pas' {frmWait},
  untPrescriptionWorkList in 'untPrescriptionWorkList.pas' {frmPrescriptionWorkList},
  untDef in 'untDef.pas' {/,},
  untPrescription in 'untPrescription.pas' {frmPrescription},
  untDrugDefiniton in 'untDrugDefiniton.pas' {frmDrugDefiniton},
  untlogin in 'untlogin.pas' {frmlogin},
  untAuthorization in 'untAuthorization.pas' {frmAuthorization},
  untUserDefinition in 'untUserDefinition.pas' {frmUserDefinition},
  untUserAuthority in 'untUserAuthority.pas',
  untExcelExport in 'untExcelExport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMMPharmacy, DMMPharmacy);
  frmlogin := Tfrmlogin.Create(nil);
  frmlogin.ModalResult := mrCancel;
  frmlogin.ShowModal;

  if frmlogin.ModalResult <> mrOk then
     Application.Terminate;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainMPharmacy, frmMainMPharmacy);
  Application.Run;
end.
