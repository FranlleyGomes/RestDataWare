unit Unit1;

interface

uses
  System.SysUtils, System.Classes, uDWDataModule, uDWAbout, uRESTDWServerEvents,
  uDWJSONObject, System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, uRESTDWPoolerDB, uRestDWDriverFD;

type
  TDataModule1 = class(TServerMethodDataModule)
    DWServerEvents1: TDWServerEvents;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    procedure DWServerEvents1EventstesteReplyEvent(var Params: TDWParams;
      var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DWServerEvents1EventstesteReplyEvent(
  var Params: TDWParams; var Result: string);
  var
    Json : TJsonObject;
begin
   Json := TJsonObject.Create;
  try
     Json.AddPair('Nome','Thulio Bittencourt');
     Json.AddPair('Cidade','Niterói');
     Result :=   Json.ToJSON;
  finally
     FreeAndNil(Json);
  end;

Params.ItemsString['result'].AsString := 'Thulio Bittencourt';
end;

end.
