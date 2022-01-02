unit untDef;

interface

type
  TPrescriptionType = (ptOutPatient = 1, ptInPatient = 2);


type
 TAppAuthority = Class(TObject)
 private
  fTest: string;
 public
  property Test: string read fTest write fTest;
end;


implementation

end.
