unit formCadResp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ExtDlgs,
  Vcl.Imaging.jpeg, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmCadResp = class(TForm)
    Panel2: TPanel;
    edtNome: TLabeledEdit;
    Panel1: TPanel;
    Label1: TLabel;
    edtCPF: TMaskEdit;
    edtEmail: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtResidencial: TMaskEdit;
    edtCelular: TMaskEdit;
    mmObservacao: TMemo;
    Label4: TLabel;
    edtRendaMensal: TMaskEdit;
    Label5: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    imgCadResp: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    edtCEP: TLabeledEdit;
    edtEstado: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    sbConsultar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbSalvar: TSpeedButton;
    edtDataNasc: TMaskEdit;
    Label6: TLabel;
    edtCodigo: TLabeledEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbConsultarClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadResp: TfrmCadResp;

implementation
uses
   uController, formEditResp;

{$R *.dfm}



procedure TfrmCadResp.FormActivate(Sender: TObject);
begin
  self.sbExcluir.Enabled := false;
end;

procedure TfrmCadResp.SpeedButton1Click(Sender: TObject);
begin
   if (OpenPictureDialog1.Execute) then
      begin
         imgCadResp.Picture.LoadFromFile(OpenPictureDialog1.FileName);
         imgCadResp.Picture.SaveToFile('C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\Foto.Jpeg');
      end;
end;

procedure TfrmCadResp.sbConsultarClick(Sender: TObject);
var
  controller : TController;
begin
   frmEditResp := TfrmEditResp.Create(nil);
   controller := TController.Create;
   controller.pPopulaDBGrid('select * from monitorebebe.TCADRESP;');

   frmEditResp.Caption := 'EDIÇÃO DE RESPONSÁVEIS';
   frmEditResp.edtBusca.EditLabel.Caption := 'Busque pelo responsável';
   frmEditResp.Tag := 1;
   frmEditResp.ShowModal;
end;

procedure TfrmCadResp.sbExcluirClick(Sender: TObject);
var
  controller : TController;
begin
  controller := TController.Create;
  controller.pExcluiResponsavel;
end;

procedure TfrmCadResp.sbSalvarClick(Sender: TObject);
var
   controller : TController;
begin
  controller := TController.Create;
  controller.pCadResponsavel;
end;

end.
