unit untExcelExport;

interface

uses SysUtils, cxGrid, Dialogs, cxExportGrid4Link;          //Added because IntToStr is used in this unit

  procedure ExportToExcellNew(GRD: TcxGrid);

implementation


procedure ExportToExcellNew(GRD: TcxGrid);
var
  num         : Integer;
  OpenDialog1 : TOpenDialog;
begin

  OpenDialog1 := TOpenDialog.Create(nil);
  OpenDialog1.Filter :='Excel Dosyası|*.xls|Bütün Dosyalar|*.*';

  if OpenDialog1.Execute then
  begin
    try
       if FileExists(OpenDialog1.FileName+'.xls') then
       begin
          num := MessageDlg('Bu dizinde aynı isimli bir dosya zaten var. Üzerine yazmak istermisiniz ?', mtConfirmation, [mbYes, mbNo], 0);
              if num <> 3 then
                  Abort;
       end;

      ExportGrid4ToExcel(OpenDialog1.FileName,GRD,TRUE,TRUE);
    except
      //InformMessage('ExportToExcell', 'Kayıt işlemi yapılamadı.');
      ShowMessage('Kayıt işlemi yapılamadı.');
      exit;
    end;
    //InformMessage('ExportToExcell', fDMLookUP.OpenDialog1.FileName +' kaydedildi.');
    ShowMessage(OpenDialog1.FileName +' kaydedildi.');
  end;
  OpenDialog1.Destroy;
end;



end.
