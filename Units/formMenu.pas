unit formMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmMenu = class(TForm)
    Panel1: TPanel;
    pnBotoes: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    sbCadResponsavel: TSpeedButton;
    Image1: TImage;
    Panel4: TPanel;
    sbCadCrianca: TSpeedButton;
    Image3: TImage;
    Panel2: TPanel;
    sbCadAlimentacao: TSpeedButton;
    Image4: TImage;
    Panel5: TPanel;
    sbControleVacina: TSpeedButton;
    Image5: TImage;
    Panel6: TPanel;
    sbCadConsultorio: TSpeedButton;
    Image6: TImage;
    Panel7: TPanel;
    sbCadMedico: TSpeedButton;
    Image7: TImage;
    Panel8: TPanel;
    Image8: TImage;
    sbControleConsultas: TSpeedButton;
    Panel9: TPanel;
    sbUtensilios: TSpeedButton;
    Image9: TImage;
    Panel10: TPanel;
    sbCadOcorrecias: TSpeedButton;
    Image10: TImage;
    Panel11: TPanel;
    sbAgendamento: TSpeedButton;
    Image11: TImage;
    Panel14: TPanel;
    sbControleCrescimento: TSpeedButton;
    Image12: TImage;
    Panel15: TPanel;
    sbRelatorios: TSpeedButton;
    Image13: TImage;
    procedure sbSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbCadResponsavelClick(Sender: TObject);
    procedure sbCadCriancaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation
uses
   formCadResp, formCadCrianca;

{$R *.dfm}



procedure TfrmMenu.sbCadCriancaClick(Sender: TObject);
begin
  frmCadCrianca := TfrmCadCrianca.Create(nil);
  frmCadCrianca.ShowModal;
end;

procedure TfrmMenu.sbCadResponsavelClick(Sender: TObject);
begin
   frmCadResp :=  TfrmCadResp.Create(nil);
   frmCadResp.ShowModal;
end;

procedure TfrmMenu.sbSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMenu.SpeedButton1Click(Sender: TObject);
begin
  self.Close;
end;

end.
