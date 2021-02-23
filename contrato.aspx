<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contrato.aspx.cs" Inherits="esmeraldino.contrato" %>

<!DOCTYPE html>

<html>

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
	
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
	<title>Contrato</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/green.css" id="theme" rel="stylesheet">
	<script type="text/javascript" src="js/MSGAguarde.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    

<![endif]-->
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=Generator content="Microsoft Word 14 (filtered)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin-top:0cm;
	margin-right:0cm;
	margin-bottom:8.0pt;
	margin-left:0cm;
	line-height:107%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{mso-style-link:"Cabe�alho Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"Rodap� Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline;}
span.MenoPendente1
	{mso-style-name:"Men��o Pendente1";
	color:#605E5C;
	background:#E1DFDD;}
span.RodapChar
	{mso-style-name:"Rodap� Char";
	mso-style-link:Rodap�;}
span.UnresolvedMention
	{mso-style-name:"Unresolved Mention";
	color:#605E5C;
	background:#E1DFDD;}
span.CabealhoChar
	{mso-style-name:"Cabe�alho Char";
	mso-style-link:Cabe�alho;}
.MsoChpDefault
	{font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
 /* Page Definitions */
 @page WordSection1
	{size:595.0pt 842.0pt;
	margin:7.1pt 36.0pt 36.0pt 36.0pt;}
div.WordSection1
	{page:WordSection1;}
-->
</style>

</head>

<body lang=PT-BR link="#0563C1" vlink="#954F72" runat="server">
                <div class="container">
                <div class="row">

														<%@ Import Namespace="MySql.Data.MySqlClient" %>
														<%@ Import Namespace="MySql.Data.Types" %>
									<%@ Import Namespace="System.IO" %>
									<%@ Import Namespace="System.Drawing" %>
									<%@ Import Namespace="System.Text" %>

                    <%

		String comandogeral = "edit";
		string comando = "";

		String CPF = "";
		CPF = Request.Cookies["cpf"].Value.ToString();
		String CPF_RESP = "";
		CPF_RESP = Request.Cookies["cpf_resp"].Value.ToString();

		String turma = "Selecione";
		String Pai = "";
		String Fone_pai = "";
		String Prof_pai = "";
		String Mae = "";
		String Fone_mae = "";
		String Prof_mae = "";
		String Area = "Selecione";
		String Curso = "";

		String Escola = "";
		String Serie = "Selecione";
		String Ano_conclusao = "";
		String RG = "";
		String Orgao = "";


		String Nome = "";
		Nome = Request.Cookies["nome_resp"].Value.ToString();
		String prof_resp = "";
		String DataNasc = "";
		String DataNasc2 = "";
		MySqlDateTime vDataNasc = new MySqlDateTime();


		String Sexo = "Selecione";
		String Fone1 = "";
		String Fone2 = "";
		String Fone3 = "";
		String Email = "";
		String Cep = "";
		String Endereco = "";
		String Complemento = "";
		String Numero = "";
		String Bairro = "";
		String Cidade = "";
		String UF = "";
		String usuario = "";


		if (Request.Form.Count > 0)
		{
			if (Request.Cookies["usuario"] != null)
				usuario = Server.HtmlEncode(Request.Cookies["usuario"].Value);

			comando = Request.Form["cmdpost"].ToString();

		}

		if ((comandogeral == "edit") && (comando=="SAVE"))
		{

		}








	%>


                    <div class="col-12">
<div class="card">
    <div class="card card-outline-info">
     <div class="card-block">
<div class=WordSection1>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CONTRATO
DE PRESTA��O DE SERVI�OS EDUCACIONAIS - <u><span style='color:red'>EXTENSIVO
PORTUGU�S 2020</span></u></span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:red'>&nbsp;</span></b></p>


<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>Pelo
presente instrumento particular de <b>CONTRATO DE PRESTA��O DE SERVI�OS
EDUCACIONAIS</b>, de um lado, <b>FERNANDA PESSOA CURSO DE PORTUGU�S EIRELI</b>,
inscrito no CNPJ sob o n� 11.640.027/0001-65, com sede � Rua Benfica, 505,
anexo do Clube Internacional do Recife, Madalena, Recife-PE, CEP 50720-001,
doravante denominado <b>CONTRATADO</b>, e, de outro: <u><span style='color:
red'><%=Nome %>;</span></u>, nacionalidade: <u><span style='color:red'><%=NACIONALIDADE_RESP%></span></u>,
portador do RG :<u><span style='color:red'><%=RG_RESP%></span></u>,
�rg�o/estado emissor: <u><span style='color:red'><%=ORG_RESP%></span></u>,
CPF: <u><span style='color:red'<%=CPF_RESP %>;</span></u>, data de
nascimento: <u><span style='color:red'><%=DATA_NASC_RESP%></span></u>,
profiss�o: <u><span style='color:red'><%=PROFISSAO_RESP%></span></u>, estado
civil: <u><span style='color:red'><%=ESTADO_CIVIL_RESP%></span></u>, residente
e domiciliado � Av. / Rua: <u><span style='color:red'><%=ENDERECO_RESP_S%></span></u>,
n� <u><span style='color:red'><%=NUMERO_RESP%>,</span></u><span
style='color:red'> </span>complemento: <u><span style='color:red'><%=COMPL_RESP%></span></u>,
bairro<span style='color:black'>:</span><u><span style='color:red'> <%=BAIRRO_RESP%></span></u>,
cidade: <u><span style='color:red'><%=CIDADE_RESP%></span></u>, estado: <u><span
style='color:red'><%=UF_RESP%></span></u>, CEP: <u><span style='color:red'><%=CEP_RESP%></span></u>,
telefone fixo: <u><span style='color:red'><%=FONE1_RESP%></span></u>,
telefone celular: <u><span style='color:red'><%=FONE2_RESP%></span></u>,
E-mail: <u><span style='color:red'><%=EMAIL_RESP%></span></u>, doravante
denominado<b> CONTRATANTE</b>, representante e respons�vel financeiro pelo(a)
aluno(a): <u><span style='color:red'><%=NOME%></span></u>, portador do RG: <u><span
style='color:red'><%=RG%></span></u>, �rg�o/estado emissor: <u><span
style='color:red'><%=ORG%></span></u>, CPF: <u><span style='color:red'><%=CPF%></span></u>,
data de nascimento: <u><span style='color:red'><%=DATA_NASC%></span></u>,
residente e domiciliado � Av./ Rua: <span style='color:red'><%=ENDERECO_S%></span>,
n�: <span style='color:red'><%=NUMERO%></span>, complemento: <u><span
style='color:red'><%=COMPL%></span></u>, bairro: <u><span style='color:red'><%=BAIRRO%></span></u>,
cidade: <u><span style='color:red'><%=CIDADE%></span></u>, estado: <u><span
style='color:red'><%=UF%></span></u>, CEP: <u><span style='color:red'><%=CEP%></span></u>,
telefone fixo: <u><span style='color:red'><%=FONE1%></span></u>, telefone
celular: <u><span style='color:red'><%=FONE2%></span></u>, E-mail: <u><span
style='color:red'><%=EMAIL%></span></u>, doravante denominado <b>BENEFICI�RIO,</b>
t�m entre si, justo e acertado por via deste instrumento, sempre como base na
boa-f� e no equil�brio contratual, mediante as seguintes cl�usulas:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
1� - DA LEGISLA��O: </span></b><span style='font-family:"Times New Roman","serif"'>O
presente contrato � celebrado nos termos da Lei n� 10.406/2002 (C�digo Civil Brasileiro)
e Lei n� 8078/90 (C�digo de Defesa do Consumidor).</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
2� - DO OBJETO: </span></b><span style='font-family:"Times New Roman","serif"'>O
objeto do presente contrato � a presta��o de servi�os por parte do <b>CONTRATADO
</b>em favor do <b>BENEFICI�RIO,</b> na �rea educacional, para oferta de CURSO
LIVRE em Linguagens, C�digos e suas Tecnologias (Exceto l�ngua estrangeira), doravante
denominado �<span style='color:red'>EXTENSIVO PORTUGU�S 2020</span>�, com
finalidade preparat�ria para o ENEM, assim entendido pela CNAE/IBGE
(Classifica��o Nacional de Atividades Econ�micas) 8599-6/99 como a atividade de
institui��es que oferecem cursos de educa��o n�o sujeitos � regulamenta��o
curricular ou legisla��o espec�fica.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1� -</span></b><span style='font-family:"Times New Roman","serif"'> A presta��o
do servi�o se dar� por meio de aulas presenciais, ministradas na sede ou em
locais indicados pelo <b>CONTRATADO</b>, tendo em vista a natureza do conte�do
e t�cnica pedag�gica necess�ria, com conte�do program�tico pr�prio e demais
atividades elaboradas pelo <b>CONTRATADO</b>. O <span style='color:red'>EXTENSIVO
PORTUGU�S 2020 </span>ser� ministrado no formato <span style='color:red'>35
semanas letivas</span>, com 01 (uma) aula para cada semana. Cada aula possui
dura��o de 03 horas, em dias e turnos a serem escolhidos pelo <b>CONTRATANTE</b>,
conforme disponibilidade informada pelo <b>CONTRATADO</b>. O in�cio das semanas
letivas do <span style='color:red'>EXTENSIVO PORTUGU�S 2020</span> se dar� em <span
style='color:red'>05 de fevereiro de 2020</span> e a �ltima semana letiva se
encerra em <span style='color:red'>30 de outubro de 2020</span>. S�o previstos
os recessos para os per�odos de <span style='color:red'>24 de fevereiro a 28 de
fevereiro</span>, <span style='color:red'>06 de abril a 10 de abril</span> e <span
style='color:red'>13 de julho a 24 de julho de 2020</span>, conferindo o total
de <span style='color:red'>35</span> aulas regulares e uma carga hor�ria estimada
de <span style='color:red'>105 horas</span><span style='color:black'>.</span></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
2� - </span></b><span style='font-family:"Times New Roman","serif"'>O<b>
CONTRATADO </b>ressalta que, como curso livre preparat�rio, n�o oferece
diplomas, atestados ou certificados de qualquer tipo, reconhecidos ou n�o pelo
Minist�rio da Educa��o; bem como, n�o cede declara��o de despesas com instru��o
para dedu��o no imposto de renda, pelo n�o enquadramento nos crit�rios para
tal.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
3� -</span></b><span style='font-family:"Times New Roman","serif"'> � de
responsabilidade do <b>CONTRATANTE</b> a apresenta��o de documenta��o original,
com fins comprobat�rios para os dados aqui mencionados, assim como a sua
confer�ncia antes da assinatura deste contrato. Tamb�m � de responsabilidade do
<b>CONTRATANTE</b> manter os dados cadastrais atualizados, tais como endere�o,
e-mail e n�meros de telefone para contato, uma vez que o <b>CONTRATADO </b>n�o
se responsabilizar� pela falta da comunica��o que se fizer necess�ria.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
4� - </span></b><span style='font-family:"Times New Roman","serif"'>Fica o <b>CONTRATADO</b>
expressamente autorizado pelo <b>CONTRATANTE,</b> a enviar e/ou entregar todo e
qualquer comunicado ao <b>CONTRATANTE</b> e/ou <b>BENEFICI�RIO</b>,
pessoalmente ou atrav�s dos meios de comunica��o aqui informados,
independentemente do teor do comunicado.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
5� -</span></b><span style='font-family:"Times New Roman","serif"'> S�o
oferecidos, a t�tulo de servi�os acess�rios, mediante a
disponibilidade/capacidade e sem inger�ncia por parte do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>: o acesso �s salas de estudo; o
acesso � monitoria correspondente ao objeto deste contrato; o aluguel de
livros, n�o estando inclusas poss�veis taxas extras pelo descumprimento das
regras expressas do servi�o; o acesso ao Laborat�rio de Reda��o; e o acesso ao
conte�do restrito do ambiente virtual �Na��o Online�, correspondente ao objeto
deste contrato, dispon�vel atrav�s do s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>�</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
3� - DA CONTRATA��O: </span></b><span style='font-family:"Times New Roman","serif"'>A
configura��o formal do ato da contrata��o se dar� somente ap�s a assinatura
deste contrato e da quita��o do pagamento da primeira parcela, conforme
estipulado na Cl�usula 7�. Para o pagamento da primeira parcela realizado atrav�s
de CHEQUE, a mesma s� ser� efetivada ap�s a compensa��o do CHEQUE por parte da
institui��o banc�ria do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1�</span></b><span style='font-family:"Times New Roman","serif"'> <b>-</b>
Entre os dias e hor�rios ofertados para o <span style='color:red'>EXTENSIVO
PORTUGU�S 2020</span>, o <b>CONTRATANTE</b> optou pela <span style='color:red'><%=DIATURMA%></span>,
das <span style='color:red'><%=HORARIO%></span>, que corresponde � turma de
sigla: <u><span style='color:red'><%=TURMA2%></span></u>, com in�cio em <span
style='color:red'><%=DATA_INICIAL%> </span><span style='color:black'>e
encerrando em </span><span style='color:red'><%=DATA_FINAL%></span><span
style='color:black'>.</span></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
2� -</span></b><span style='font-family:"Times New Roman","serif"'> Caber�,
exclusivamente, ao <b>CONTRATADO</b> definir a sua pol�tica comercial e os seus
crit�rios para concess�o de descontos e modalidades de pagamento. O <b>CONTRATANTE</b>
declara ter plena ci�ncia que, dependendo do per�odo em que seja firmada a
contrata��o do servi�o, e de acordo com o plano e meio de pagamento escolhido,
os valores praticados poder�o ter sido diferenciados de outras oportunidades,
tais como eventuais promo��es realizadas em outros per�odos.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
3� - </span></b><span style='font-family:"Times New Roman","serif"'>O <b>CONTRATADO</b>
n�o garante a entrega retroativa das aulas anteriores � data da Contrata��o.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
4� - </span></b><span style='font-family:"Times New Roman","serif"'>� garantido
ao <b>CONTRATANTE</b> a devolu��o de 100% do valor pago no ato da Contrata��o, <u>somente
se, at� a data limite de 31 de janeiro de 2020</u>, o processo de cancelamento
da Contrata��o ocorrer por ato formal de preencher, assinar, entregar em <u>via
original</u> e protocolar junto � Secretaria da institui��o, uma via do <u>Requerimento
de Cancelamento da Contrata��o</u>, que pode ser obtido na Secretaria da
institui��o, no s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br/cancelamentorecife.pdf"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/cancelamentorecife.pdf</span></a><span
style='font-family:"Times New Roman","serif"'> ou solicitado atrav�s do e-mail </span><a
href="mailto:cancelamento@fernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>cancelamento@fernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Para toda e qualquer outra
solicita��o que n�o atenda esses requisitos, n�o haver� devolu��o, parcial ou
total, do valor pago da primeira parcela.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
5� - </span></b><span style='font-family:"Times New Roman","serif"'>No caso de
renova��o contratual de <b>CONTRATANTE</b> e/ou <b>BENEFICI�RIO</b>, o mesmo s�
ser� renovado mediante total quita��o com todas as obriga��es financeiras
decorrentes de anos anteriores e as previstas para o pagamento no ato da
Contrata��o. Em caso de quita��o de saldos pendentes de anos anteriores atrav�s
de CHEQUE, a Contrata��o s� poder� ocorrer ap�s a comprova��o da liquida��o do
mesmo por parte da institui��o banc�ria do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
4� - DO PLANEJAMENTO PEDAG�GICO: </span></b><span style='font-family:"Times New Roman","serif"'>O
Planejamento Pedag�gico e a presta��o dos servi�os de ensino, como orienta��o
did�tico-pedag�gica e educacional, sele��o de material did�tico e eventuais
altera��es, fixa��o de carga hor�ria, elabora��o de calend�rio educacional,
al�m de outras provid�ncias que as atividades docentes de curso preparat�rio
para o ENEM exigirem, s�o de responsabilidade do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATADO</span></b><span
style='font-family:"Times New Roman","serif"'> obedecendo ao seu exclusivo
crit�rio, sem inger�ncia do </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1�</span></b><span style='font-family:"Times New Roman","serif"'> - O objeto
deste contrato, al�m de suprir as exig�ncias do ENEM, abrange, no �mbito
educacional, processos seletivos diversos, assim como concursos que necessitam
de conhecimentos espec�ficos da l�ngua portuguesa e de produ��o textual.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:black'>Par�grafo 2� - </span></b><span style='font-family:"Times New Roman","serif";
color:black'>No decorrer do ano letivo, ser�o ofertadas ao <b>BENEFICI�RIO</b>
do </span><span style='font-family:"Times New Roman","serif";color:red'>EXTENSIVO
PORTUGU�S 2020</span><span style='font-family:"Times New Roman","serif";
color:black'>, em car�ter de bonifica��o e sem contrapresta��o, </span><span
style='font-family:"Times New Roman","serif"'>aulas com finalidade preparat�ria
para faculdades particulares; bem como, para o Sistema Seriado de Avalia��o da
Universidade de Pernambuco, obedecendo exclusivamente aos crit�rios do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:black'>Par�grafo 3� -</span></b><span style='font-family:"Times New Roman","serif";
color:black'> As 35 semanas letivas referentes ao objeto deste contrato somadas
�s semanas letivas das aulas em car�ter de bonifica��o, conforme Par�grafo 2�
da Cl�usula 4�, totalizam 41 semanas letivas. Assim, o ano letivo, compreendido
entre o objeto do contrato e as aulas em car�ter de bonificia��o, encerra-se em
11 de dezembro de 2020, compondo um total de carga hor�ria estimada de 123
horas. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
4� - </span></b><span style='font-family:"Times New Roman","serif"'>Divulgaremos
no decorrer da entrega do objeto deste contrato, a programa��o das aulas
ofertadas em car�ter de bonifica��o. A divulga��o ocorrer� atrav�s das redes
sociais oficiais do curso e no s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecife"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'>. A programa��o das aulas em
car�ter de bonifica��o poder� sofrer altera��es, sem inger�ncia do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
5� -</span></b><span style='font-family:"Times New Roman","serif"'> Em caso de feriados,
aus�ncia necess�ria ou motivos de for�a maior, a reposi��o das aulas
presenciais poder� ser ofertada no ambiente virtual �Na��o Online�, dispon�vel
no s�tio eletr�nico </span><a href="http://www.cursofernandapessoa.com.br"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'> ou por outro professor designado
pelo </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATADO</span></b><span
style='font-family:"Times New Roman","serif"'>, sem preju�zo e sem inger�ncia
do </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
5� � DO REGIMENTO INTERNO: </span></b><span style='font-family:"Times New Roman","serif"'>Ao
firmar o presente contrato, o <b>CONTRATANTE</b> submete-se ao Regimento
Interno do Aluno, que ser� enviado via e-mail informado no ato da Contrata��o e
que tamb�m est� dispon�vel na Secretaria e no s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Assim, assume a ci�ncia de que
o aluno � respons�vel por zelar pelo bom nome e reputa��o do <b>CONTRATADO</b>,
dentro e fora do ambiente da institui��o e, tamb�m, nos meios virtuais que
abrange a internet.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1� -</span></b><span style='font-family:"Times New Roman","serif"'> Sob nenhuma
hip�tese o <b>CONTRATADO</b> ser� responsabilizado pela perda ou extravio de
objetos de valor ou de uso pessoal do <b>BENEFICI�RIO</b>, tais como celulares,
joias, aparelhos eletr�nicos, etc.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
2� -</span></b><span style='font-family:"Times New Roman","serif"'> Caso o <b>BENEFICI�RIO</b>
cause preju�zo, volunt�rio e/ou involunt�rio, ao estabelecimento de ensino, aos
seus funcion�rios, aos seus colegas e/ou terceiros, o ressarcimento dos valores
pleiteados ser� de responsabilidade exclusiva do <b>CONTRATANTE</b> que der
causa ao dano.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
6� � DO USO DE IMAGEM: </span></b><span style='font-family:"Times New Roman","serif"'>O
<b>CONTRATADO</b>, livre de quaisquer �nus para com o <b>CONTRATANTE/BENEFICI�RIO</b>,
poder�, por prazo indeterminado e independentemente da vig�ncia deste contrato,
utilizar-se de seu nome e de sua imagem para fins exclusivos de divulga��o do <b>CONTRATADO</b>
e de suas atividades, podendo, para tanto, reproduzi-la ou divulga-la pela
internet, jornais, e todos os demais meios de comunica��o, p�blico e privados,
comprometendo-se a n�o utilizar de maneira contr�ria � moral, aos bons costumes
ou � ordem p�blica.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
7� - DO VALOR E PAGAMENTO:<span style='color:red'> </span></span></b><span
style='font-family:"Times New Roman","serif"'>Em contrapresta��o ao objeto
deste contrato e entre as op��es de parcelamento oferecidas pelo <b>CONTRATADO</b>,
o <b>CONTRATANTE</b> aceitou e optou por pagar o valor de <u>R$<span
style='color:red'> <%=VALOR_TOTAL%></span>, sendo R$ <span style='color:
red'><%=VALOR_MATRICULA%></span>, pagos no ato da contrata��o, e o saldo
residual dividido em <span style='color:red'><%=QTD_MENSALIDADE%></span> �parcelas
mensais e iguais de R$ <span style='color:red'><%=VALOR_MENSALIDADE%>,
<%=DESCONTO%></span></u>, que dever�o ser pagas na rede banc�ria ou casas
lot�ricas, atrav�s de boletos banc�rios emitidos pelo <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1� </span></b><span style='font-family:"Times New Roman","serif"'>- Entre as
op��es de parcelamento e entre os dias oferecidos para o vencimento das
parcelas, que s�o 01, 05 e 10 de cada m�s, o<b> CONTRATANTE </b>opta, ao firmar
o presente contrato, pelo dia de vencimento <span style='color:red'><%=DIA_VENC%><u>
</u></span>de cada m�s, comprometendo-se para os dias <span style='color:red'><%=VENCIMENTOS%></span>
de <span style='color:red'>2020</span>, totalizando assim, <span
style='color:red'><%=QTD_MENSALIDADE2%> </span>parcelas mensais e iguais.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
2� - </span></b><span style='font-family:"Times New Roman","serif"'>Em caso de
inadimplemento, poder� o <b>CONTRATADO</b>:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>����������� I
� Cobrar multa de 2% sobre a parcela devida e juros de mora de 1% ao m�s ou
fra��o de m�s, bem como poder� adotar todas as provid�ncias legais de cobran�a
cab�veis, inclusive inscrever o nome do <b>CONTRATANTE</b> em cadastro ou
servi�os legalmente constitu�dos e destinados � prote��o da cobran�a do cr�dito
advindo deste contrato, valendo o presente contrato como t�tulo executivo
extrajudicial, nos termos do Art. 784, III, do CPC, reconhecendo, o <b>CONTRATANTE</b>,
desde j�, este t�tulo, como l�quido, certo e exig�vel, ou, ainda, qualquer tipo
de cobran�a prevista na legisla��o brasileira, independentemente de pr�via
notifica��o, podendo tais provid�ncias serem tomadas isolada, gradativa ou
cumulativamente. Todas as despesas do <b>CONTRATADO</b> decorrentes da(s)
cobran�a(s) prevista(s) neste item poder�o ser cobradas do <b>CONTRATANTE</b> a
t�tulo de reembolso;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>����������� II
� Independentemente das medidas do inciso I, Par�grafo 2�, Cl�usula 7�, por
tamb�m restringir o <b>BENEFICI�RIO </b>do servi�o objeto e configurado neste
contrato (o acesso �s aulas correspondentes ao <span style='color:red'>EXTENSIVO
PORTUGU�S 2020</span>), assim como restringir parcial ou totalmente o acesso
e/ou o recebimento dos acess�rios n�o obrigat�rios descritos no Par�grafo 5� da
Cl�usula 2�.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>����������� III
� Pela rescis�o contratual ap�s 90 (noventa) dias de inadimplemento,
independentemente das medidas inclusas nos incisos I e II, do Par�grafo 2�,
Cl�usula 7�, e da exigibilidade do d�bito vencido e do devido no m�s da
efetiva��o da rescis�o.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
3� - </span></b><span style='font-family:"Times New Roman","serif"'>O <b>CONTRATANTE</b>
compreende que o valor pago em contrapresta��o aos servi�os contratados
independe de sua respectiva utiliza��o, uma vez que os servi�os estar�o �
disposi��o do <b>BENEFICI�RIO</b> e sua referente vaga ocupada, enquanto n�o
for expressamente cancelada sua Contrata��o, por ato formal de preencher,
assinar, entregar em <u>via original</u> e protocolar junto � Secretaria da
institui��o, uma via do <u>Requerimento de Cancelamento da Contrata��o</u>, que
pode ser obtido na Secretaria da institui��o, no s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecifes"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'>, ou solicitado atrav�s do e-mail
</span><a href="mailto:cancelamento@fernandapessoa.com.br"><span
style='font-family:"Times New Roman","serif";color:red'>cancelamento@fernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Assim, sua obriga��o de pagar
mant�m-se v�lida e eficaz, independentemente de o <b>CONTRATANTE/BENEFICI�RIO </b>ter
optado por n�o fazer ou tenha sido impossibilitado de assistir �s aulas e
exercer outros direitos inerentes ao curso, por raz�es que n�o sejam imputadas
ao <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
8� � DA EXTIN��O DO CONTRATO: </span></b><span style='font-family:"Times New Roman","serif"'>Este
contrato poder� ser rescindido:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;text-indent:35.4pt;line-height:115%'><span style='font-family:"Times New Roman","serif"'>I
� Pelo <b>CONTRATANTE </b>que, poder� a qualquer tempo resilir o presente
contrato, bastando, para tanto, preencher, assinar, entregar em <u>via original</u>
e protocolar junto � Secretaria do Curso, uma via do <u>Requerimento de
Cancelamento da Contrata��o</u>, que pode ser obtido na Secretaria da
institui��o, no s�tio eletr�nico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecifes"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'> ou solicitado atrav�s do e-mail </span><a
href="mailto:cancelamento@fernandapessoa.com.br"><span style='font-family:"Times New Roman","serif";
color:red'>cancelamento@fernandapessoa.com.br</span></a><span style='font-family:
"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;text-indent:35.4pt;line-height:115%'><span style='font-family:"Times New Roman","serif"'>II
� Pelo <b>CONTRATADO </b>que, poder� a qualquer tempo resilir (extin��o
unilateral motivada) o presente contrato, motivado por parte do <b>CONTRATANTE </b>e/ou
<b>BENEFICI�RIO</b>, pelo descumprimento dos termos aqui firmados, como o
descumprimento do Regimento Interno do Aluno e em caso de inadimplemento,
conforme previsto no inciso III, Par�grafo 2�, Cl�usula 7�, aplicando-se as
mesmas penalidades previstas.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
1� - </span></b><span style='font-family:"Times New Roman","serif"'>Em qualquer
dos casos, fica o <b>CONTRATANTE</b> obrigado a pagar o valor da parcela do m�s
em que ocorrer o evento. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
2�</span></b><span style='font-family:"Times New Roman","serif"'> - Quando
resilido pelo <b>CONTRATANTE</b>, o <b>BENEFICI�RIO</b> ter� o direito de
usufruir do objeto deste contrato at� o final do m�s em que ocorrer o evento.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
3�</span></b><span style='font-family:"Times New Roman","serif"'> - Nos casos
em que o <b>CONTRATANTE</b> optar por um plano de pagamento em que a quantidade
de parcelas exceder o prazo de entrega do objeto deste contrato, conforme
disposto no Par�grafo 1� da Cl�usula 2� e, ainda sim, compreendendo o direito
de usufruto estipulado no Par�grafo 2� da Cl�usula 8� e, n�o obstante a isso,
compreendendo tamb�m que a obriga��o de pagar mant�m-se v�lida e eficaz,
independentemente do gozo dos direitos, conforme exposto no Par�grafo 3� da
Cl�usula 7�, o <b>CONTRATANTE</b> ser� devedor de todo o saldo residual do
contrato em raz�o da entrega total do objeto deste.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
4� - </span></b><span style='font-family:"Times New Roman","serif"'>Exceto as
rescis�es efetuadas dentro das condi��es previstas no Par�grafo 3� da Cl�usula 8�,
fica o <b>CONTRATANTE </b>obrigado a pagar multa de 10% sobre o saldo devedor
dos meses subsequentes ao m�s da data protocolada da entrega do <u>Requerimento
de Cancelamento da Contrata��o</u>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Par�grafo
5� - </span></b><span style='font-family:"Times New Roman","serif"'>Fica livre
do pagamento de multa de 10% sobre o saldo devedor, aquele que resilir o
contrato motivado por aprova��o em processo seletivo do ano em vigor, cabendo
ao <b>CONTRATANTE/BENEFICI�RIO </b>apresentar no ato da entrega do <u>Requerimento
de Cancelamento da Contrata��o,</u> documento eficaz e comprobat�rio da
aprova��o, como �list�o� oficial do processo seletivo, publica��o em jornais ou
meios de comunica��o.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CL�USULA
9� � DO FORO: </span></b><span style='font-family:"Times New Roman","serif"'>As
partes elegem o Foro da Comarca da cidade do Recife-PE. E, por estarem justos e
contratados, assinam o presente instrumento em duas vias de igual teor, para
que se produzam todos os efeitos legais.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
115%'><span style='font-family:"Times New Roman","serif";color:red'>&nbsp;</span></p>

<p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:right;line-height:115%'><span style='font-family:"Times New Roman","serif";
color:red'><%=DATA%></span><span style='position:absolute;z-index:251659262;
left:0px;margin-left:270px;margin-top:17px;width:388px;height:50px'><img
width=388 height=50 src="PE2020_arquivos/image001.jpg"
alt="Descri��o: C:\Users\Cleison\Downloads\img20171102_15330207.jpg"></span></p>

<p class=MsoNormal align=right style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:right;line-height:115%'><span style='font-family:"Times New Roman","serif";
color:red'>&nbsp;</span></p>
    </br>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none' align="center">
 <tr>
  
  <td width=349 valign=top style='width:261.4pt;padding:0cm 5.4pt 0cm 5.4pt'>
  <div style='border:none;border-bottom:solid windowtext 1.5pt;padding:0cm 0cm 1.0pt 0cm'>
  <p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
  justify;line-height:115%;border:none;padding:0cm'><span style='font-family:
  "Times New Roman","serif"'>&nbsp;</span></p>
  </div>
  <p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
  text-align:center;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>FERNANDA
  PESSOA CURSO DE PORTUGU�S EIRELI</span></b><span style='font-family:"Times New Roman","serif"'>
  (CONTRATADO)</span></p>
  </td>
     
 </tr>
 <tr>
     <td>
         </br>
         <form runat="server" id="formcontrato">
     <div class="form-check form-group" id="areaTermosCondicoes">
     <input type="checkbox" id="accept-term" class="form-check-input">
     <label for="accept-term" class="form-check-label"><h2>Li e concordo com os <a href="#">Termos de uso</a> </h2></label>
     <div class="invalid-feedback">
          <span class="alert-message"></span>
     </div>
     <div class="valid-feedback">
          <span class="alert-message"></span>
     </div>
     <button type="submit" class="btn btn-secundary ml-2" id="cadastrar" ><a href="cadastroresp.aspx"> Continuar </a><span></span></button>
         </form>
</div>    </td>
 </tr>
</table>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:normal'><span style='font-size:12.0pt;font-family:"Times New Roman","serif"'>&nbsp;</span></p>

</div> 
                        </div>
                    </div>
                    </div>
    </div>
    </div>
    </div>


    <script src="assets/plugins/jquery/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/tether.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>

</html>
