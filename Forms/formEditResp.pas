unit formEditResp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmEditResp = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnCarregar: TButton;
  private
    { Private declarations }
  public
    procedure pCarregaDBGrid(prSQL : String);
  end;

var
  frmEditResp: TfrmEditResp;

implementation


{$R *.dfm}

uses uDao;

{ TfrmEditResp }

procedure TfrmEditResp.pCarregaDBGrid(prSQL: String);
var
   dao : TDataModule1;
begin
   dao := TDataModule1.Create(nil);
   dao.Source.DataSet := dao.fRetornaQuery(prSQL);
end;

end.
