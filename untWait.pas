unit untWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, SUIImagePanel;

type
  TfrmWait = class(TForm)
    panel1: TsuiImagePanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure OpenBekleForm(Baslik :String ='');
procedure CloseBekleForm;

var
  waitForm : TfrmWait;


implementation

var
  Counter : integer;
  OldCursor : TCursor;

{$R *.dfm}

procedure OpenBekleForm(Baslik :String ='');
begin
  if waitForm = nil then
  begin
    waitForm := TfrmWait.Create(Application);
    if Baslik <> '' then
      waitForm.panel1.Caption := Baslik;
    waitForm.Show;
    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;
    Counter := 1;
  end
  else
    inc(Counter);
end;

procedure CloseBekleForm;
begin
  Dec(Counter);
  if Counter < 1 then
  begin
    waitForm.Free;
    waitForm := nil;
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmWait.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

initialization
  Counter := 0;

end.
