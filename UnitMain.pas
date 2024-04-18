unit UnitMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, UnitDM, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.DB, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Grid, Data.Bind.DBScope, Data.Bind.Controls, FMX.Layouts,
  Fmx.Bind.Navigator;

type
  TMainForm = class(TForm)
    ComboBoxFrom: TComboBox;
    EditAmount: TEdit;
    LabelResult: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    ComboBoxTo: TComboBox;
    BindSourceDB3: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    BindSourceDB4: TBindSourceDB;
    LinkPropertyToFieldText: TLinkPropertyToField;
    ButtonCalc: TButton;
    procedure ButtonCalcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

procedure TMainForm.ButtonCalcClick(Sender: TObject);
begin
  DataModule1.Calc(EditAmount.Text);
end;

end.
