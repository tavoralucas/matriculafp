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
	{mso-style-link:"Cabeçalho Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{mso-style-link:"Rodapé Char";
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
	{mso-style-name:"Menção Pendente1";
	color:#605E5C;
	background:#E1DFDD;}
span.RodapChar
	{mso-style-name:"Rodapé Char";
	mso-style-link:Rodapé;}
span.UnresolvedMention
	{mso-style-name:"Unresolved Mention";
	color:#605E5C;
	background:#E1DFDD;}
span.CabealhoChar
	{mso-style-name:"Cabeçalho Char";
	mso-style-link:Cabeçalho;}
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
DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS - <u><span style='color:red'>EXTENSIVO
PORTUGUÊS 2020</span></u></span></b></p>

<p class=MsoNormal align=center style='margin-bottom:0cm;margin-bottom:.0001pt;
text-align:center;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:red'>&nbsp;</span></b></p>


<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>Pelo
presente instrumento particular de <b>CONTRATO DE PRESTAÇÃO DE SERVIÇOS
EDUCACIONAIS</b>, de um lado, <b>FERNANDA PESSOA CURSO DE PORTUGUÊS EIRELI</b>,
inscrito no CNPJ sob o n° 11.640.027/0001-65, com sede à Rua Benfica, 505,
anexo do Clube Internacional do Recife, Madalena, Recife-PE, CEP 50720-001,
doravante denominado <b>CONTRATADO</b>, e, de outro: <u><span style='color:
red'><%=Nome %>;</span></u>, nacionalidade: <u><span style='color:red'><%=NACIONALIDADE_RESP%></span></u>,
portador do RG :<u><span style='color:red'><%=RG_RESP%></span></u>,
órgão/estado emissor: <u><span style='color:red'><%=ORG_RESP%></span></u>,
CPF: <u><span style='color:red'<%=CPF_RESP %>;</span></u>, data de
nascimento: <u><span style='color:red'><%=DATA_NASC_RESP%></span></u>,
profissão: <u><span style='color:red'><%=PROFISSAO_RESP%></span></u>, estado
civil: <u><span style='color:red'><%=ESTADO_CIVIL_RESP%></span></u>, residente
e domiciliado à Av. / Rua: <u><span style='color:red'><%=ENDERECO_RESP_S%></span></u>,
n° <u><span style='color:red'><%=NUMERO_RESP%>,</span></u><span
style='color:red'> </span>complemento: <u><span style='color:red'><%=COMPL_RESP%></span></u>,
bairro<span style='color:black'>:</span><u><span style='color:red'> <%=BAIRRO_RESP%></span></u>,
cidade: <u><span style='color:red'><%=CIDADE_RESP%></span></u>, estado: <u><span
style='color:red'><%=UF_RESP%></span></u>, CEP: <u><span style='color:red'><%=CEP_RESP%></span></u>,
telefone fixo: <u><span style='color:red'><%=FONE1_RESP%></span></u>,
telefone celular: <u><span style='color:red'><%=FONE2_RESP%></span></u>,
E-mail: <u><span style='color:red'><%=EMAIL_RESP%></span></u>, doravante
denominado<b> CONTRATANTE</b>, representante e responsável financeiro pelo(a)
aluno(a): <u><span style='color:red'><%=NOME%></span></u>, portador do RG: <u><span
style='color:red'><%=RG%></span></u>, órgão/estado emissor: <u><span
style='color:red'><%=ORG%></span></u>, CPF: <u><span style='color:red'><%=CPF%></span></u>,
data de nascimento: <u><span style='color:red'><%=DATA_NASC%></span></u>,
residente e domiciliado à Av./ Rua: <span style='color:red'><%=ENDERECO_S%></span>,
n°: <span style='color:red'><%=NUMERO%></span>, complemento: <u><span
style='color:red'><%=COMPL%></span></u>, bairro: <u><span style='color:red'><%=BAIRRO%></span></u>,
cidade: <u><span style='color:red'><%=CIDADE%></span></u>, estado: <u><span
style='color:red'><%=UF%></span></u>, CEP: <u><span style='color:red'><%=CEP%></span></u>,
telefone fixo: <u><span style='color:red'><%=FONE1%></span></u>, telefone
celular: <u><span style='color:red'><%=FONE2%></span></u>, E-mail: <u><span
style='color:red'><%=EMAIL%></span></u>, doravante denominado <b>BENEFICIÁRIO,</b>
têm entre si, justo e acertado por via deste instrumento, sempre como base na
boa-fé e no equilíbrio contratual, mediante as seguintes cláusulas:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
1ª - DA LEGISLAÇÃO: </span></b><span style='font-family:"Times New Roman","serif"'>O
presente contrato é celebrado nos termos da Lei n° 10.406/2002 (Código Civil Brasileiro)
e Lei n° 8078/90 (Código de Defesa do Consumidor).</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
2ª - DO OBJETO: </span></b><span style='font-family:"Times New Roman","serif"'>O
objeto do presente contrato é a prestação de serviços por parte do <b>CONTRATADO
</b>em favor do <b>BENEFICIÁRIO,</b> na área educacional, para oferta de CURSO
LIVRE em Linguagens, Códigos e suas Tecnologias (Exceto língua estrangeira), doravante
denominado “<span style='color:red'>EXTENSIVO PORTUGUÊS 2020</span>”, com
finalidade preparatória para o ENEM, assim entendido pela CNAE/IBGE
(Classificação Nacional de Atividades Econômicas) 8599-6/99 como a atividade de
instituições que oferecem cursos de educação não sujeitos à regulamentação
curricular ou legislação específica.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º -</span></b><span style='font-family:"Times New Roman","serif"'> A prestação
do serviço se dará por meio de aulas presenciais, ministradas na sede ou em
locais indicados pelo <b>CONTRATADO</b>, tendo em vista a natureza do conteúdo
e técnica pedagógica necessária, com conteúdo programático próprio e demais
atividades elaboradas pelo <b>CONTRATADO</b>. O <span style='color:red'>EXTENSIVO
PORTUGUÊS 2020 </span>será ministrado no formato <span style='color:red'>35
semanas letivas</span>, com 01 (uma) aula para cada semana. Cada aula possui
duração de 03 horas, em dias e turnos a serem escolhidos pelo <b>CONTRATANTE</b>,
conforme disponibilidade informada pelo <b>CONTRATADO</b>. O início das semanas
letivas do <span style='color:red'>EXTENSIVO PORTUGUÊS 2020</span> se dará em <span
style='color:red'>05 de fevereiro de 2020</span> e a última semana letiva se
encerra em <span style='color:red'>30 de outubro de 2020</span>. São previstos
os recessos para os períodos de <span style='color:red'>24 de fevereiro a 28 de
fevereiro</span>, <span style='color:red'>06 de abril a 10 de abril</span> e <span
style='color:red'>13 de julho a 24 de julho de 2020</span>, conferindo o total
de <span style='color:red'>35</span> aulas regulares e uma carga horária estimada
de <span style='color:red'>105 horas</span><span style='color:black'>.</span></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
2º - </span></b><span style='font-family:"Times New Roman","serif"'>O<b>
CONTRATADO </b>ressalta que, como curso livre preparatório, não oferece
diplomas, atestados ou certificados de qualquer tipo, reconhecidos ou não pelo
Ministério da Educação; bem como, não cede declaração de despesas com instrução
para dedução no imposto de renda, pelo não enquadramento nos critérios para
tal.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
3º -</span></b><span style='font-family:"Times New Roman","serif"'> É de
responsabilidade do <b>CONTRATANTE</b> a apresentação de documentação original,
com fins comprobatórios para os dados aqui mencionados, assim como a sua
conferência antes da assinatura deste contrato. Também é de responsabilidade do
<b>CONTRATANTE</b> manter os dados cadastrais atualizados, tais como endereço,
e-mail e números de telefone para contato, uma vez que o <b>CONTRATADO </b>não
se responsabilizará pela falta da comunicação que se fizer necessária.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
4º - </span></b><span style='font-family:"Times New Roman","serif"'>Fica o <b>CONTRATADO</b>
expressamente autorizado pelo <b>CONTRATANTE,</b> a enviar e/ou entregar todo e
qualquer comunicado ao <b>CONTRATANTE</b> e/ou <b>BENEFICIÁRIO</b>,
pessoalmente ou através dos meios de comunicação aqui informados,
independentemente do teor do comunicado.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
5º -</span></b><span style='font-family:"Times New Roman","serif"'> São
oferecidos, a título de serviços acessórios, mediante a
disponibilidade/capacidade e sem ingerência por parte do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>: o acesso às salas de estudo; o
acesso à monitoria correspondente ao objeto deste contrato; o aluguel de
livros, não estando inclusas possíveis taxas extras pelo descumprimento das
regras expressas do serviço; o acesso ao Laboratório de Redação; e o acesso ao
conteúdo restrito do ambiente virtual “Nação Online”, correspondente ao objeto
deste contrato, disponível através do sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'> </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
3ª - DA CONTRATAÇÃO: </span></b><span style='font-family:"Times New Roman","serif"'>A
configuração formal do ato da contratação se dará somente após a assinatura
deste contrato e da quitação do pagamento da primeira parcela, conforme
estipulado na Cláusula 7ª. Para o pagamento da primeira parcela realizado através
de CHEQUE, a mesma só será efetivada após a compensação do CHEQUE por parte da
instituição bancária do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º</span></b><span style='font-family:"Times New Roman","serif"'> <b>-</b>
Entre os dias e horários ofertados para o <span style='color:red'>EXTENSIVO
PORTUGUÊS 2020</span>, o <b>CONTRATANTE</b> optou pela <span style='color:red'><%=DIATURMA%></span>,
das <span style='color:red'><%=HORARIO%></span>, que corresponde à turma de
sigla: <u><span style='color:red'><%=TURMA2%></span></u>, com início em <span
style='color:red'><%=DATA_INICIAL%> </span><span style='color:black'>e
encerrando em </span><span style='color:red'><%=DATA_FINAL%></span><span
style='color:black'>.</span></span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
2º -</span></b><span style='font-family:"Times New Roman","serif"'> Caberá,
exclusivamente, ao <b>CONTRATADO</b> definir a sua política comercial e os seus
critérios para concessão de descontos e modalidades de pagamento. O <b>CONTRATANTE</b>
declara ter plena ciência que, dependendo do período em que seja firmada a
contratação do serviço, e de acordo com o plano e meio de pagamento escolhido,
os valores praticados poderão ter sido diferenciados de outras oportunidades,
tais como eventuais promoções realizadas em outros períodos.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
3º - </span></b><span style='font-family:"Times New Roman","serif"'>O <b>CONTRATADO</b>
não garante a entrega retroativa das aulas anteriores à data da Contratação.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
4º - </span></b><span style='font-family:"Times New Roman","serif"'>É garantido
ao <b>CONTRATANTE</b> a devolução de 100% do valor pago no ato da Contratação, <u>somente
se, até a data limite de 31 de janeiro de 2020</u>, o processo de cancelamento
da Contratação ocorrer por ato formal de preencher, assinar, entregar em <u>via
original</u> e protocolar junto à Secretaria da instituição, uma via do <u>Requerimento
de Cancelamento da Contratação</u>, que pode ser obtido na Secretaria da
instituição, no sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br/cancelamentorecife.pdf"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/cancelamentorecife.pdf</span></a><span
style='font-family:"Times New Roman","serif"'> ou solicitado através do e-mail </span><a
href="mailto:cancelamento@fernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>cancelamento@fernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Para toda e qualquer outra
solicitação que não atenda esses requisitos, não haverá devolução, parcial ou
total, do valor pago da primeira parcela.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
5º - </span></b><span style='font-family:"Times New Roman","serif"'>No caso de
renovação contratual de <b>CONTRATANTE</b> e/ou <b>BENEFICIÁRIO</b>, o mesmo só
será renovado mediante total quitação com todas as obrigações financeiras
decorrentes de anos anteriores e as previstas para o pagamento no ato da
Contratação. Em caso de quitação de saldos pendentes de anos anteriores através
de CHEQUE, a Contratação só poderá ocorrer após a comprovação da liquidação do
mesmo por parte da instituição bancária do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
4ª - DO PLANEJAMENTO PEDAGÓGICO: </span></b><span style='font-family:"Times New Roman","serif"'>O
Planejamento Pedagógico e a prestação dos serviços de ensino, como orientação
didático-pedagógica e educacional, seleção de material didático e eventuais
alterações, fixação de carga horária, elaboração de calendário educacional,
além de outras providências que as atividades docentes de curso preparatório
para o ENEM exigirem, são de responsabilidade do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATADO</span></b><span
style='font-family:"Times New Roman","serif"'> obedecendo ao seu exclusivo
critério, sem ingerência do </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º</span></b><span style='font-family:"Times New Roman","serif"'> - O objeto
deste contrato, além de suprir as exigências do ENEM, abrange, no âmbito
educacional, processos seletivos diversos, assim como concursos que necessitam
de conhecimentos específicos da língua portuguesa e de produção textual.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:black'>Parágrafo 2º - </span></b><span style='font-family:"Times New Roman","serif";
color:black'>No decorrer do ano letivo, serão ofertadas ao <b>BENEFICIÁRIO</b>
do </span><span style='font-family:"Times New Roman","serif";color:red'>EXTENSIVO
PORTUGUÊS 2020</span><span style='font-family:"Times New Roman","serif";
color:black'>, em caráter de bonificação e sem contraprestação, </span><span
style='font-family:"Times New Roman","serif"'>aulas com finalidade preparatória
para faculdades particulares; bem como, para o Sistema Seriado de Avaliação da
Universidade de Pernambuco, obedecendo exclusivamente aos critérios do <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif";
color:black'>Parágrafo 3º -</span></b><span style='font-family:"Times New Roman","serif";
color:black'> As 35 semanas letivas referentes ao objeto deste contrato somadas
às semanas letivas das aulas em caráter de bonificação, conforme Parágrafo 2º
da Cláusula 4ª, totalizam 41 semanas letivas. Assim, o ano letivo, compreendido
entre o objeto do contrato e as aulas em caráter de bonificiação, encerra-se em
11 de dezembro de 2020, compondo um total de carga horária estimada de 123
horas. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
4º - </span></b><span style='font-family:"Times New Roman","serif"'>Divulgaremos
no decorrer da entrega do objeto deste contrato, a programação das aulas
ofertadas em caráter de bonificação. A divulgação ocorrerá através das redes
sociais oficiais do curso e no sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecife"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'>. A programação das aulas em
caráter de bonificação poderá sofrer alterações, sem ingerência do </span><b><span
style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
5º -</span></b><span style='font-family:"Times New Roman","serif"'> Em caso de feriados,
ausência necessária ou motivos de força maior, a reposição das aulas
presenciais poderá ser ofertada no ambiente virtual “Nação Online”, disponível
no sítio eletrônico </span><a href="http://www.cursofernandapessoa.com.br"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'> ou por outro professor designado
pelo </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATADO</span></b><span
style='font-family:"Times New Roman","serif"'>, sem prejuízo e sem ingerência
do </span><b><span style='font-family:"Times New Roman","serif"'>CONTRATANTE</span></b><span
style='font-family:"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
5ª – DO REGIMENTO INTERNO: </span></b><span style='font-family:"Times New Roman","serif"'>Ao
firmar o presente contrato, o <b>CONTRATANTE</b> submete-se ao Regimento
Interno do Aluno, que será enviado via e-mail informado no ato da Contratação e
que também está disponível na Secretaria e no sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br"><span style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Assim, assume a ciência de que
o aluno é responsável por zelar pelo bom nome e reputação do <b>CONTRATADO</b>,
dentro e fora do ambiente da instituição e, também, nos meios virtuais que
abrange a internet.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º -</span></b><span style='font-family:"Times New Roman","serif"'> Sob nenhuma
hipótese o <b>CONTRATADO</b> será responsabilizado pela perda ou extravio de
objetos de valor ou de uso pessoal do <b>BENEFICIÁRIO</b>, tais como celulares,
joias, aparelhos eletrônicos, etc.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
2º -</span></b><span style='font-family:"Times New Roman","serif"'> Caso o <b>BENEFICIÁRIO</b>
cause prejuízo, voluntário e/ou involuntário, ao estabelecimento de ensino, aos
seus funcionários, aos seus colegas e/ou terceiros, o ressarcimento dos valores
pleiteados será de responsabilidade exclusiva do <b>CONTRATANTE</b> que der
causa ao dano.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
6ª – DO USO DE IMAGEM: </span></b><span style='font-family:"Times New Roman","serif"'>O
<b>CONTRATADO</b>, livre de quaisquer ônus para com o <b>CONTRATANTE/BENEFICIÁRIO</b>,
poderá, por prazo indeterminado e independentemente da vigência deste contrato,
utilizar-se de seu nome e de sua imagem para fins exclusivos de divulgação do <b>CONTRATADO</b>
e de suas atividades, podendo, para tanto, reproduzi-la ou divulga-la pela
internet, jornais, e todos os demais meios de comunicação, público e privados,
comprometendo-se a não utilizar de maneira contrária à moral, aos bons costumes
ou à ordem pública.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
7ª - DO VALOR E PAGAMENTO:<span style='color:red'> </span></span></b><span
style='font-family:"Times New Roman","serif"'>Em contraprestação ao objeto
deste contrato e entre as opções de parcelamento oferecidas pelo <b>CONTRATADO</b>,
o <b>CONTRATANTE</b> aceitou e optou por pagar o valor de <u>R$<span
style='color:red'> <%=VALOR_TOTAL%></span>, sendo R$ <span style='color:
red'><%=VALOR_MATRICULA%></span>, pagos no ato da contratação, e o saldo
residual dividido em <span style='color:red'><%=QTD_MENSALIDADE%></span>  parcelas
mensais e iguais de R$ <span style='color:red'><%=VALOR_MENSALIDADE%>,
<%=DESCONTO%></span></u>, que deverão ser pagas na rede bancária ou casas
lotéricas, através de boletos bancários emitidos pelo <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º </span></b><span style='font-family:"Times New Roman","serif"'>- Entre as
opções de parcelamento e entre os dias oferecidos para o vencimento das
parcelas, que são 01, 05 e 10 de cada mês, o<b> CONTRATANTE </b>opta, ao firmar
o presente contrato, pelo dia de vencimento <span style='color:red'><%=DIA_VENC%><u>
</u></span>de cada mês, comprometendo-se para os dias <span style='color:red'><%=VENCIMENTOS%></span>
de <span style='color:red'>2020</span>, totalizando assim, <span
style='color:red'><%=QTD_MENSALIDADE2%> </span>parcelas mensais e iguais.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
2º - </span></b><span style='font-family:"Times New Roman","serif"'>Em caso de
inadimplemento, poderá o <b>CONTRATADO</b>:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>            I
– Cobrar multa de 2% sobre a parcela devida e juros de mora de 1% ao mês ou
fração de mês, bem como poderá adotar todas as providências legais de cobrança
cabíveis, inclusive inscrever o nome do <b>CONTRATANTE</b> em cadastro ou
serviços legalmente constituídos e destinados à proteção da cobrança do crédito
advindo deste contrato, valendo o presente contrato como título executivo
extrajudicial, nos termos do Art. 784, III, do CPC, reconhecendo, o <b>CONTRATANTE</b>,
desde já, este título, como líquido, certo e exigível, ou, ainda, qualquer tipo
de cobrança prevista na legislação brasileira, independentemente de prévia
notificação, podendo tais providências serem tomadas isolada, gradativa ou
cumulativamente. Todas as despesas do <b>CONTRATADO</b> decorrentes da(s)
cobrança(s) prevista(s) neste item poderão ser cobradas do <b>CONTRATANTE</b> a
título de reembolso;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>            II
– Independentemente das medidas do inciso I, Parágrafo 2º, Cláusula 7ª, por
também restringir o <b>BENEFICIÁRIO </b>do serviço objeto e configurado neste
contrato (o acesso às aulas correspondentes ao <span style='color:red'>EXTENSIVO
PORTUGUÊS 2020</span>), assim como restringir parcial ou totalmente o acesso
e/ou o recebimento dos acessórios não obrigatórios descritos no Parágrafo 5º da
Cláusula 2ª.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>            III
– Pela rescisão contratual após 90 (noventa) dias de inadimplemento,
independentemente das medidas inclusas nos incisos I e II, do Parágrafo 2º,
Cláusula 7ª, e da exigibilidade do débito vencido e do devido no mês da
efetivação da rescisão.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
3º - </span></b><span style='font-family:"Times New Roman","serif"'>O <b>CONTRATANTE</b>
compreende que o valor pago em contraprestação aos serviços contratados
independe de sua respectiva utilização, uma vez que os serviços estarão à
disposição do <b>BENEFICIÁRIO</b> e sua referente vaga ocupada, enquanto não
for expressamente cancelada sua Contratação, por ato formal de preencher,
assinar, entregar em <u>via original</u> e protocolar junto à Secretaria da
instituição, uma via do <u>Requerimento de Cancelamento da Contratação</u>, que
pode ser obtido na Secretaria da instituição, no sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecifes"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'>, ou solicitado através do e-mail
</span><a href="mailto:cancelamento@fernandapessoa.com.br"><span
style='font-family:"Times New Roman","serif";color:red'>cancelamento@fernandapessoa.com.br</span></a><span
style='font-family:"Times New Roman","serif"'>. Assim, sua obrigação de pagar
mantém-se válida e eficaz, independentemente de o <b>CONTRATANTE/BENEFICIÁRIO </b>ter
optado por não fazer ou tenha sido impossibilitado de assistir às aulas e
exercer outros direitos inerentes ao curso, por razões que não sejam imputadas
ao <b>CONTRATADO</b>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
8ª – DA EXTINÇÃO DO CONTRATO: </span></b><span style='font-family:"Times New Roman","serif"'>Este
contrato poderá ser rescindido:</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;text-indent:35.4pt;line-height:115%'><span style='font-family:"Times New Roman","serif"'>I
– Pelo <b>CONTRATANTE </b>que, poderá a qualquer tempo resilir o presente
contrato, bastando, para tanto, preencher, assinar, entregar em <u>via original</u>
e protocolar junto à Secretaria do Curso, uma via do <u>Requerimento de
Cancelamento da Contratação</u>, que pode ser obtido na Secretaria da
instituição, no sítio eletrônico </span><a
href="http://www.cursofernandapessoa.com.br/matriculasrecifes"><span
style='font-family:"Times New Roman","serif"'>www.cursofernandapessoa.com.br/matriculasrecife</span></a><span
style='font-family:"Times New Roman","serif"'> ou solicitado através do e-mail </span><a
href="mailto:cancelamento@fernandapessoa.com.br"><span style='font-family:"Times New Roman","serif";
color:red'>cancelamento@fernandapessoa.com.br</span></a><span style='font-family:
"Times New Roman","serif"'>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;text-indent:35.4pt;line-height:115%'><span style='font-family:"Times New Roman","serif"'>II
– Pelo <b>CONTRATADO </b>que, poderá a qualquer tempo resilir (extinção
unilateral motivada) o presente contrato, motivado por parte do <b>CONTRATANTE </b>e/ou
<b>BENEFICIÁRIO</b>, pelo descumprimento dos termos aqui firmados, como o
descumprimento do Regimento Interno do Aluno e em caso de inadimplemento,
conforme previsto no inciso III, Parágrafo 2º, Cláusula 7ª, aplicando-se as
mesmas penalidades previstas.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
1º - </span></b><span style='font-family:"Times New Roman","serif"'>Em qualquer
dos casos, fica o <b>CONTRATANTE</b> obrigado a pagar o valor da parcela do mês
em que ocorrer o evento. </span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
2º</span></b><span style='font-family:"Times New Roman","serif"'> - Quando
resilido pelo <b>CONTRATANTE</b>, o <b>BENEFICIÁRIO</b> terá o direito de
usufruir do objeto deste contrato até o final do mês em que ocorrer o evento.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
3º</span></b><span style='font-family:"Times New Roman","serif"'> - Nos casos
em que o <b>CONTRATANTE</b> optar por um plano de pagamento em que a quantidade
de parcelas exceder o prazo de entrega do objeto deste contrato, conforme
disposto no Parágrafo 1º da Cláusula 2ª e, ainda sim, compreendendo o direito
de usufruto estipulado no Parágrafo 2º da Cláusula 8ª e, não obstante a isso,
compreendendo também que a obrigação de pagar mantém-se válida e eficaz,
independentemente do gozo dos direitos, conforme exposto no Parágrafo 3º da
Cláusula 7ª, o <b>CONTRATANTE</b> será devedor de todo o saldo residual do
contrato em razão da entrega total do objeto deste.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
4º - </span></b><span style='font-family:"Times New Roman","serif"'>Exceto as
rescisões efetuadas dentro das condições previstas no Parágrafo 3º da Cláusula 8ª,
fica o <b>CONTRATANTE </b>obrigado a pagar multa de 10% sobre o saldo devedor
dos meses subsequentes ao mês da data protocolada da entrega do <u>Requerimento
de Cancelamento da Contratação</u>.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>Parágrafo
5º - </span></b><span style='font-family:"Times New Roman","serif"'>Fica livre
do pagamento de multa de 10% sobre o saldo devedor, aquele que resilir o
contrato motivado por aprovação em processo seletivo do ano em vigor, cabendo
ao <b>CONTRATANTE/BENEFICIÁRIO </b>apresentar no ato da entrega do <u>Requerimento
de Cancelamento da Contratação,</u> documento eficaz e comprobatório da
aprovação, como “listão” oficial do processo seletivo, publicação em jornais ou
meios de comunicação.</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><span style='font-family:"Times New Roman","serif"'>&nbsp;</span></p>

<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;text-align:
justify;line-height:115%'><b><span style='font-family:"Times New Roman","serif"'>CLÁUSULA
9ª – DO FORO: </span></b><span style='font-family:"Times New Roman","serif"'>As
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
alt="Descrição: C:\Users\Cleison\Downloads\img20171102_15330207.jpg"></span></p>

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
  PESSOA CURSO DE PORTUGUÊS EIRELI</span></b><span style='font-family:"Times New Roman","serif"'>
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
