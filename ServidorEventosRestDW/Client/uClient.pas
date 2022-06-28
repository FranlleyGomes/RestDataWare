unit uClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWPoolerDB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uDWConstsData;

type
  TForm3 = class(TForm)
    RESTDWDataBase1: TRESTDWDataBase;
    RESTDWClientSQL1: TRESTDWClientSQL;
    DBGrid1: TDBGrid;
    Button1: TButton;
    DataSource1: TDataSource;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyUpdate(aDataSet: TDataSet);
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.ApplyUpdate(aDataSet: TDataSet);
var
  vErro: String;
begin
      if not RESTDWClientSQL1.ApplyUpdates(vErro) then
      raise Exception.Create(VErro);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
   RESTDWClientSQL1.Close;
   RESTDWClientSQL1.SQL.Clear;
   RESTDWClientSQL1.SQL.Add('SELECT * FROM PRODUTO');
   RESTDWClientSQL1.Open;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  vErro: String;
begin
//   RESTDWClientSQL1.Append;
//   RESTDWClientSQL1.FieldByName('GUUID').AsString := '321655';
//   RESTDWClientSQL1.FieldByName('CODIGO').AsString := '654988';
//   RESTDWClientSQL1.FieldByName('DESCRICAO').AsString := 'Teste RestDataWare';
//   RESTDWClientSQL1.Post;

    RESTDWClientSQL1.Sql.Clear;
    RESTDWClientSQL1.SQL.Add('insert into produto(GUUID, CODIGO, DESCRICAO) VALUES (:GUUID, :CODIGO, :DESCRICAO)');
    RESTDWClientSQL1.ParamByName('GUUID').Value := '654989';
    RESTDWClientSQL1.ParamByName('CODIGO').Value := '654989';
    RESTDWClientSQL1.ParamByName('DESCRICAO').Value := 'Insert SQL RESTDW';

    if not RESTDWClientSQL1.ExecSQL(vErro) then
       raise Exception.Create(VErro);

end;

procedure TForm3.Button3Click(Sender: TObject);
begin
   RESTDWClientSQL1.Edit;
   RESTDWClientSQL1.FieldByName('GUUID').AsString := '321655';
   RESTDWClientSQL1.FieldByName('CODIGO').AsString := '654988';
   RESTDWClientSQL1.FieldByName('DESCRICAO').AsString := 'Teste RestDataWare 333 aaa';
   RESTDWClientSQL1.Post;
end;

procedure TForm3.Button4Click(Sender: TObject);
var
  vErro: String;
begin
   RESTDWClientSQL1.Delete;


end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  RESTDWClientSQL1.AfterPost   := ApplyUpdate;
  RESTDWClientSQL1.AfterDelete := ApplyUpdate;
end;

end.
