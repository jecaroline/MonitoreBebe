unit uController;

interface

uses
   uResponsavel, uDao, formCadResp, System.Classes, System.SysUtils, formMessage, uCariaca, formCadCrianca;

  type TController = class

    public
        procedure pCadResponsavel;
        procedure pCadCrianca;
        function fTiraPonto(prText : String):String;
        procedure pMessage(prCaption : String; prColor : integer; prLabel : String; prFoto : String);

  end;

implementation

{ TController }

function TController.fTiraPonto(prText: String): String;
var
   i : integer;
begin
  for i := 0 to Length(prText) do
    begin
       if prText[i]='.' then
          begin
               delete(prText,i,1);
          end
    end;

  Result := prText;
end;

procedure TController.pCadCrianca;
var
   Dao : TDataModule;
   objCrianca : TCrianca;
begin
  Dao := TDataModule.Create(nil);
  objCrianca := TCrianca.Create;

  objCrianca.setNomeCrianca(frmCadCrianca.edtNome.Text);
  objCrianca.setCpfCrianca(frmCadCrianca.edtCPF.Text);
  objCrianca.setDataNascimento(frmCadCrianca.edtDataNasc.Text);

  if (frmCadCrianca.ckMasculino.Checked) then
     objCrianca.setSexo('Masculino')
  else
     objCrianca.setSexo('Feminino');

  objCrianca.setHospNascimento(frmCadCrianca.edtHospNasc.Text);
  objCrianca.setPesoNascimento(frmCadCrianca.edtPeso.Text);
  objCrianca.setNomePai(frmCadCrianca.edtNomePai.Text);
  objCrianca.setNomeMae(frmCadCrianca.edtNomeMae.Text);
 //objCrianca.setResponsavel1(TResponsavel(frmCadCrianca.cbResp1.Items.Objects).getIdResponsavel);
 //objCrianca.setResponsavel1(TResponsavel(frmCadCrianca.cbResp2.Items.Objects).getIdResponsavel);
  //objCrianca.setObservacoes(frmCadCrianca.mmObservacoes.Lines);

end;

procedure TController.pCadResponsavel;
var
   Dao : TDataModule1;
   objResp : TResponsavel;
   wEndCompleto : String;
   wValor : String;
begin
  Dao := TDataModule1.Create(nil);
  objResp := TResponsavel.Create;

  objResp.setNomeResponsavel(frmCadResp.edtNome.Text);
  objResp.setCpfResponsavel(frmCadResp.edtCPF.Text);
  objResp.setEmailResponsavel(frmCadResp.edtEmail.Text);
  objResp.setDataNascimento(frmCadResp.edtDataNasc.Text);
  objResp.setTelefoneResidencia(frmCadResp.edtResidencial.Text);
  objResp.setTelefoneCelular(frmCadResp.edtCelular.Text);
  wValor := Copy(self.fTiraPonto(frmCadResp.edtRendaMensal.Text), 3, Length(frmCadResp.edtRendaMensal.Text));
  objResp.setRendaMensal(StrToFloat(wValor));
  objResp.setObservacoes(frmCadResp.mmObservacao.Lines.Text);
  objResp.setCepResponsavel(frmCadResp.edtCEP.Text);
  objResp.setEstadoResponsavel(frmCadResp.edtEstado.Text);
  objResp.setCidadeResponsavel(frmCadResp.edtCidade.Text);
  objResp.setBairroResponsavel(frmCadResp.edtBairro.text);
  objResp.setEndereco(frmCadResp.edtEndereco.text);
  objResp.setFoto(frmCadResp.imgCadResp);

  if (Dao.pInsertResponsavel(objResp)) then
     begin
        self.pMessage('INSERÇÃO DE RESPONSÁVEL REALIZADA', $00D2FFD9, 'Inserção de responsável realizada com sucesso !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\salvo.bmp');
     end
  else
     begin
       self.pMessage('FALHA NA INSERÇÃO DE RESPONSÁVEL', $009F9FFF, 'Falha na inserção de responsável verifique os dados !!', 'C:\Users\progvisual33\Documents\Pessoal\Exercícios Aula\PZIMexercicio\DELPHI\MonitoreBebe\MonitoreBebe\Images\negado.bmp');
     end;
end;

procedure TController.pMessage(prCaption : String; prColor : integer; prLabel : String; prFoto : String);
begin
  frmMessage := TfrmMessage.Create(frmCadResp);
  frmMessage.Visible := false;
  frmMessage.Caption := prCaption;
  frmMessage.pnMessage.Color := prColor;
  frmMessage.lbMessage.Caption := prLabel;
  frmMessage.imgMessage.Picture.LoadFromFile(prFoto);
  frmMessage.ShowModal;
end;

end.
