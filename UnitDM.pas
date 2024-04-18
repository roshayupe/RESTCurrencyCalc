unit UnitDM;

interface

uses
  System.SysUtils, System.Classes, REST.Types, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, FireDAC.DApt, FireDAC.Stan.StorageBin;

type
  TDataModule1 = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequestSymbols: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    FDMemTableFrom: TFDMemTable;
    FDMemTableTo: TFDMemTable;
    RESTRequestConvert: TRESTRequest;
    RESTResponse2: TRESTResponse;
    RESTResponseDataSetAdapter2: TRESTResponseDataSetAdapter;
    FDMemTable2: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FSymbols: TStringList;
    procedure LoadJSONToMemTableAdapted(const JSONStr: string);
  public
    { Public declarations }
    procedure InitData;
    procedure Calc(const Amount: String);
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

uses
  System.JSON;

procedure TDataModule1.Calc(const Amount: String);
begin
  with RESTRequestConvert do
  begin
    Params.ParameterByName('from').Value := FDMemTableFrom.FieldByName('code').Value;
    Params.ParameterByName('to').Value := FDMemTableTo.FieldByName('code').Value;
    Params.ParameterByName('amount').Value := Amount;
  end;

  RESTRequestConvert.Execute;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  InitData
end;

procedure TDataModule1.InitData;
begin
  RESTRequestSymbols.Execute;
  if RESTResponse1.Content <> '' then
    LoadJSONToMemTableAdapted(RESTResponse1.Content);
end;

procedure TDataModule1.LoadJSONToMemTableAdapted(const JSONStr: string);
var
  JSONObj, SymbolsObj: TJSONObject;
  JSONPair: TJSONPair;

  procedure FillFDMemTable(DMemTable: TFDMemTable);
  begin
    with DMemTable do
    begin
      Append;
      FieldByName('Code').AsString := JSONPair.JsonString.Value;
      FieldByName('Description').AsString := JSONPair.JsonValue.Value;
      Post;
    end;
  end;

begin
  JSONObj := TJSONObject.ParseJSONValue(JSONStr) as TJSONObject;
  try
    SymbolsObj := JSONObj.GetValue('symbols') as TJSONObject;
    for JSONPair in SymbolsObj do
    begin
      FillFDMemTable(FDMemTableFrom);
      FillFDMemTable(FDMemTableTo);
    end;
  finally
    JSONObj.Free;
  end;
end;

end.
