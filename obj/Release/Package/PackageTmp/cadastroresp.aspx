<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastroresp.aspx.cs" Inherits="Simulado.cadastroresp" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <!--<link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">-->
    
	<title>Matrículas 2019</title>

<script type="text/javascript" src="js/MSGAguarde.js"></script>	

	
<script type="text/javascript">
		function receberCS()
		{
			PageMethods.receber(onSucess, onerror);

			function onSucess(result)
			{
				alert(result);
			}

			function onerror(result)
			{
				alert('Something wrong.');
			}
		}
	</script>

	<!-- Adicionando Javascript CONSULTA CEP -->
    <script type="text/javascript" >
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('txtendereco').value=("");
            document.getElementById('txtbairro').value=("");
            document.getElementById('txtcidade').value=("");
            document.getElementById('txtuf').value=("");
            //document.getElementById('ibge').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('txtendereco').value=(conteudo.logradouro);
            document.getElementById('txtbairro').value=(conteudo.bairro);
            document.getElementById('txtcidade').value=(conteudo.localidade);
            document.getElementById('txtuf').value=(conteudo.uf);
            //document.getElementById('ibge').value=(conteudo.ibge);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
    }
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('txtendereco').value="...";
                document.getElementById('txtbairro').value="...";
                document.getElementById('txtcidade').value="...";
                document.getElementById('txtuf').value="...";
                //document.getElementById('ibge').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };

    </script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/plugins/wizard/steps.css" rel="stylesheet">
    <!-- chartist CSS -->
    <link href="assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="assets/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
    <link href="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="assets/plugins/css-chart/css-chart.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">

    <link href="assets/plugins/icheck/skins/all.css" rel="stylesheet"> 
    <link rel="stylesheet" href="assets/plugins/dropify/dist/css/dropify.min.css">

    <!-- You can change the theme colors from here -->
    <link href="css/colors/red.css" id="theme" rel="stylesheet">
    
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    

<![endif]-->
</head>


<body class="fix-header fix-sidebar card-no-border">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0 ">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                        <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="icon-arrow-left-circle"></i></a> </li>
                        <!-- ============================================================== -->
                        
                        <!-- ============================================================== -->
                        
                        <!-- ============================================================== -->
                        <!-- ============================================================== -->
                        
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container">
            
	

	    
			
	                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Cadastro de Pessoas</h4>
                            </div>
								<div class="card-block">
                                <form action="#" class="form-horizontal" enctype="multipart/form-data" runat="server" method="post">


									<%@ Import Namespace="MySql.Data.MySqlClient" %>
									<%@ Import Namespace="System.Data" %>
									<%@ Import Namespace="System.Web" %>
									<%@ Import Namespace="System.Web.UI" %>
									<%@ Import Namespace="MySql.Data.Types" %>
									<%@ Import Namespace="System.IO" %>
									<%@ Import Namespace="System.Drawing" %>
									<%@ Import Namespace="System.Text" %>
									<%@ Import Namespace="Newtonsoft.Json.Serialization" %>
									<%@ Import Namespace="Newtonsoft.Json" %>
					                <%@ Import Namespace="RestSharp" %>
                                    <%@ Import Namespace="Uol.PagSeguro.Util" %>
					                <%@ Import Namespace="Uol.PagSeguro.Domain" %>
					                <%@ Import Namespace="Uol.PagSeguro.Service" %>
					                <%@ Import Namespace="Uol.PagSeguro.XmlParse" %>
					                <%@ Import Namespace="Uol.PagSeguro.Constants" %>
					                <%@ Import Namespace="Uol.PagSeguro.Parse" %>
					                <%@ Import Namespace="Uol.PagSeguro.Exception" %>
					                <%@ Import Namespace="Uol.PagSeguro.Log" %>
					                <%@ Import Namespace="Uol.PagSeguro.Resources" %>
									
									
									
							
						
									
									
	<%

		if (!this.IsPostBack)
		{
			DataTable tbArvore = new DataTable();
			tbArvore.Columns.AddRange(new DataColumn[4] { new DataColumn("ID_COLIGADO"), new DataColumn("ID_PAI"), new DataColumn("VINCULO"), new DataColumn("SUBVINCULO") });
			//dt.Rows.Add(1, "John Hammond", "United States");
			ViewState["tbArvore"] = tbArvore;

		}






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
		String estado_civil = "Selecione";
		String nacionalidade = "";

		if (CPF != "")
		{
			comandogeral = "edit";

			MySqlConnection connedit = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			MySqlCommand sqlConsultaCO = new MySqlCommand();
			sqlConsultaCO.Connection = connedit;
			connedit.Open();
			sqlConsultaCO.CommandText = "Select * from aluno,disci_aluno  where  aluno.CPF=disci_aluno.CPF and aluno.cpf='" + CPF + "'";


			MySqlDataReader dadosCO = sqlConsultaCO.ExecuteReader();
			dadosCO.Read();
			if (dadosCO.HasRows)
			{
				turma = dadosCO["TURMA"].ToString();
				Nome = dadosCO["nome_resp"].ToString();
				vDataNasc = dadosCO.GetMySqlDateTime("DATA_NASC_resp");
				DataNasc = vDataNasc.Value.ToString("dd/MM/yyyy");
				DataNasc2 = vDataNasc.Value.ToString("yyyy-MM-dd");
				Sexo = dadosCO["Sexo"].ToString();

				RG = dadosCO["RG_resp"].ToString();
				Orgao = dadosCO["ORG_resp"].ToString();
				prof_resp = dadosCO["prof_resp"].ToString();

				Fone1 = dadosCO["Fone1_resp"].ToString();
				Fone2 = dadosCO["Fone2_resp"].ToString();
				Email = dadosCO["email_resp"].ToString();
				Cep = dadosCO["cep_resp"].ToString();
				Endereco = dadosCO["endereco_resp"].ToString();
				Numero = dadosCO["Numero_resp"].ToString();
				Complemento = dadosCO["COMPL_resp"].ToString();
				Bairro = dadosCO["Bairro_resp"].ToString();
				Cidade = dadosCO["Cidade_resp"].ToString();
				UF = dadosCO["UF_resp"].ToString();
				estado_civil = dadosCO["est_civil_resp"].ToString();
				nacionalidade = dadosCO["nacionalidade_resp"].ToString();



			}
			connedit.Close();
		}

		if (Request.Form.Count > 0)
		{
			if (Request.Cookies["usuario"] != null)
				usuario = Server.HtmlEncode(Request.Cookies["usuario"].Value);

			comando = Request.Form["cmdpost"].ToString();


			if (!string.IsNullOrEmpty(Request.Form["txtprof_resp"]))
			{
				prof_resp = Request.Form["txtprof_resp"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtrg"]))
			{
				RG = Request.Form["txtrg"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtorgao"]))
			{
				Orgao = Request.Form["txtorgao"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtnome"]))
			{
				Nome = Request.Form["txtnome"].ToString();

			}

			if (!string.IsNullOrEmpty(Request.Form["txtdata_nasc"]))
			{
				DataNasc = Request.Form["txtdata_nasc"].ToString();
				DateTime dDataNasc = Convert.ToDateTime(DataNasc);
				DataNasc2 = dDataNasc.ToString("yyyy-MM-dd");

			}

			if (!string.IsNullOrEmpty(Request.Form["cbxSexo"]))
			{
				Sexo = Request.Form["cbxSexo"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfone1"]))
			{
				Fone1 = Request.Form["txtfone1"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfone2"]))
			{
				Fone2 = Request.Form["txtfone2"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtemail"]))
			{
				Email = Request.Form["txtemail"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcep"]))
			{
				Cep = Request.Form["txtcep"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtendereco"]))
			{
				Endereco = Request.Form["txtendereco"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtnumero"]))
			{
				Numero = Request.Form["txtnumero"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcomplemento"]))
			{
				Complemento = Request.Form["txtcomplemento"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtbairro"]))
			{
				Bairro = Request.Form["txtbairro"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcidade"]))
			{
				Cidade = Request.Form["txtcidade"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtuf"]))
			{
				UF = Request.Form["txtuf"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtest_civil_resp"]))
			{
				estado_civil = Request.Form["txtest_civil_resp"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtnacionalidade_resp"]))
			{
				nacionalidade = Request.Form["txtnacionalidade_resp"].ToString();
			}

		}
		if (comando == "PRINTPE")
		{
			Response.Redirect("PE2021.aspx?CPF=" + CPF);
		}
		else
		if ((comandogeral == "edit") && (comando=="SAVE"))
		{
			MySqlConnection connup = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			MySqlCommand sqlUpdate = new MySqlCommand();
			sqlUpdate.Connection = connup;
			connup.Open();
			sqlUpdate.CommandText = "Update disci_aluno set NOME_resp='" + Nome + "', prof_resp='" + prof_resp + "', DATA_NASC_RESP='" + DataNasc2 + "', " +
			" RG_RESP='" + RG + "', ORG_RESP ='" + Orgao + "'," +
			" FONE1_RESP='" + Fone1 + "', FONE2_RESP='" + Fone2 + "', EMAIL_RESP	='" + Email + "'," +
			" CEP_RESP='" + Cep + "', ENDERECO_RESP='" + Endereco + "', NUMERO_RESP='" + Numero + "', COMPL_RESP='" + Complemento + "', BAIRRO_RESP='" + Bairro + "', CIDADE_RESP='" + Cidade + "'," +
			" UF_RESP='" + UF + "',"+
			" est_civil_resp='"+estado_civil+"',"+
			" nacionalidade_resp='"+nacionalidade+"' "+
			" where cpf='" + CPF+"'";//+"' and TURMA='"+turma+"'";

			int result = sqlUpdate.ExecuteNonQuery();
			connup.Close();

			if (File.Exists(Server.MapPath("PagSeguroConfig.xml")))
			{

				PagSeguroConfiguration.UrlXmlConfiguration = Server.MapPath("PagSeguroConfig.xml");
			}

			AccountCredentials Credencial = PagSeguroConfiguration.Credentials(false);

			PaymentRequest payment = new PaymentRequest();

			payment.AddParameter("encoding", "utf-8");
			string pturma = Request.Cookies["turma"].Value.ToString();
			string pturmamat = Request.Cookies["turmamat"].Value.ToString();
			string pturmaqui = Request.Cookies["turmaqui"].Value.ToString();
			int contador = 1;
			string REFERENCIA = CPF + DateTime.Now.ToString("ddMMyyyyhhmmss");

			//ADICIONADO ITEM DE PORTUGUES
			MySqlConnection connVerifica = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			connVerifica.Open();
			MySqlCommand sqlVerifica = new MySqlCommand();
			sqlVerifica.Connection = connVerifica;
			sqlVerifica.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturma+"' AND DATA_PAG IS NOT NULL";

			MySqlDataReader dadosVerifica = sqlVerifica.ExecuteReader();
			dadosVerifica.Read();
			bool Matriculado = dadosVerifica.HasRows;
			connVerifica.Close();

			if (pturma != "" && !Matriculado)
			{
				MySqlConnection connPS = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

				connPS.Open();
				MySqlCommand sqlConsultaPS = new MySqlCommand();
				sqlConsultaPS.Connection = connPS;
				sqlConsultaPS.CommandText = "Select VALOR_MAT from turma where turma='" + turma + "' order by turma";
				MySqlDataReader dadosPS = sqlConsultaPS.ExecuteReader();

				dadosPS.Read();
				Double valor = 0;
				if (dadosPS["VALOR_MAT"].ToString() != "")
				{
					valor = Convert.ToDouble(dadosPS["VALOR_MAT"]);
				}


				connPS.Close();
				payment.Items.Add(new Item(contador.ToString(),
											 "CURSO FERNANDA PESSOA - PORTUGUES EXTENSIVO TURMA " + pturma,
												   1,
									Convert.ToDecimal(valor.ToString().Replace("R$", "").Trim())));
				contador++;

				MySqlConnection connVerificaPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
				connVerificaPORTUGUES.Open();
				MySqlCommand sqlVerificaPORTUGUES = new MySqlCommand();
				sqlVerificaPORTUGUES.Connection = connVerificaPORTUGUES;
				sqlVerificaPORTUGUES.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturma+"'";
				MySqlDataReader dadosVerificaPORTUGUES = sqlVerificaPORTUGUES.ExecuteReader();
				dadosVerificaPORTUGUES.Read();
				bool MatriculadoPORTUGUES = dadosVerificaPORTUGUES.HasRows;
				connVerificaPORTUGUES.Close();

				if (!MatriculadoPORTUGUES)
				{
					MySqlConnection conninsertPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
					conninsertPORTUGUES.Open();
					MySqlCommand sqlinsertPORTUGUES = new MySqlCommand();
					sqlinsertPORTUGUES.Connection = conninsertPORTUGUES;
					sqlinsertPORTUGUES.CommandText = "INSERT INTO PAGSEGURO(CPF,TURMA,DATA_CADASTRO,SITUACAOMP,REFERENCIA) VALUES ('" + CPF + "','" + pturma + "',current_timestamp,'ABERTO','" + REFERENCIA + "')";

					int retornoportugues = sqlinsertPORTUGUES.ExecuteNonQuery();
					conninsertPORTUGUES.Close();

				}

			}

			// FINAL ITEM PORTUGUES


			//ADICIONADO ITEM DE MATEMATICA
			MySqlConnection connVerificamat = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			connVerificamat.Open();
			MySqlCommand sqlVerificamat = new MySqlCommand();
			sqlVerificamat.Connection = connVerificamat;
			sqlVerificamat.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturmamat+"' AND DATA_PAG IS NOT NULL";

			MySqlDataReader dadosVerificamat = sqlVerificamat.ExecuteReader();
			dadosVerificamat.Read();
			bool Matriculadomat = dadosVerificamat.HasRows;
			connVerificamat.Close();

			if (pturmamat != "" && !Matriculadomat)
			{
				MySqlConnection connPS = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

				connPS.Open();
				MySqlCommand sqlConsultaPS = new MySqlCommand();
				sqlConsultaPS.Connection = connPS;
				sqlConsultaPS.CommandText = "Select VALOR_MAT from turma where turma='" + pturmamat + "' order by turma";
				MySqlDataReader dadosPS = sqlConsultaPS.ExecuteReader();

				dadosPS.Read();
				Double valor = 0;
				if (dadosPS["VALOR_MAT"].ToString() != "")
				{
					valor = Convert.ToDouble(dadosPS["VALOR_MAT"]);
				}


				connPS.Close();
				payment.Items.Add(new Item(contador.ToString(),
											 "CURSO FERNANDA PESSOA - MATEMATICA EXTENSIVO TURMA " + pturmamat,
												   1,
									Convert.ToDecimal(valor.ToString().Replace("R$", "").Trim())));
				contador++;

				MySqlConnection connVerificaPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
				connVerificaPORTUGUES.Open();
				MySqlCommand sqlVerificaPORTUGUES = new MySqlCommand();
				sqlVerificaPORTUGUES.Connection = connVerificaPORTUGUES;
				sqlVerificaPORTUGUES.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturmamat+"'";
				MySqlDataReader dadosVerificaPORTUGUES = sqlVerificaPORTUGUES.ExecuteReader();
				dadosVerificaPORTUGUES.Read();
				bool MatriculadoPORTUGUES = dadosVerificaPORTUGUES.HasRows;
				connVerificaPORTUGUES.Close();

				if (!MatriculadoPORTUGUES)
				{
					MySqlConnection conninsertPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
					conninsertPORTUGUES.Open();
					MySqlCommand sqlinsertPORTUGUES = new MySqlCommand();
					sqlinsertPORTUGUES.Connection = conninsertPORTUGUES;
					sqlinsertPORTUGUES.CommandText = "INSERT INTO PAGSEGURO(CPF,TURMA,DATA_CADASTRO,SITUACAOMP,REFERENCIA) VALUES ('" + CPF + "','" + pturmamat + "',current_timestamp,'ABERTO','" + REFERENCIA + "')";

					int retornoportugues = sqlinsertPORTUGUES.ExecuteNonQuery();
					conninsertPORTUGUES.Close();

				}

			}
			// FINAL ITEM MATEMATICA



			//ADICIONADO ITEM DE QUIMICA
			MySqlConnection connVerificaqui = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			connVerificaqui.Open();
			MySqlCommand sqlVerificaqui = new MySqlCommand();
			sqlVerificaqui.Connection = connVerificaqui;
			sqlVerificaqui.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturmaqui+"' AND DATA_PAG IS NOT NULL";
			MySqlDataReader dadosVerificaqui = sqlVerificaqui.ExecuteReader();
			dadosVerificaqui.Read();
			bool Matriculadoqui = dadosVerificaqui.HasRows;
			connVerificaqui.Close();

			if (pturmaqui != "" && !Matriculadoqui)
			{
				MySqlConnection connPS = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

				connPS.Open();
				MySqlCommand sqlConsultaPS = new MySqlCommand();
				sqlConsultaPS.Connection = connPS;
				sqlConsultaPS.CommandText = "Select VALOR_MAT from turma where turma='" + pturmaqui + "' order by turma";
				MySqlDataReader dadosPS = sqlConsultaPS.ExecuteReader();

				dadosPS.Read();
				Double valor = 0;
				if (dadosPS["VALOR_MAT"].ToString() != "")
				{
					valor = Convert.ToDouble(dadosPS["VALOR_MAT"]);
				}


				connPS.Close();
				payment.Items.Add(new Item(contador.ToString(),
											 "CURSO FERNANDA PESSOA - QUIMICA EXTENSIVO TURMA " + pturmaqui,
												   1,
									Convert.ToDecimal(valor.ToString().Replace("R$", "").Trim())));
				contador++;

				MySqlConnection connVerificaPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
				connVerificaPORTUGUES.Open();
				MySqlCommand sqlVerificaPORTUGUES = new MySqlCommand();
				sqlVerificaPORTUGUES.Connection = connVerificaPORTUGUES;
				sqlVerificaPORTUGUES.CommandText = "Select * from PAGSEGURO where cpf='"+CPF+"' and  turma='" + pturmaqui+"'";
				MySqlDataReader dadosVerificaPORTUGUES = sqlVerificaPORTUGUES.ExecuteReader();
				dadosVerificaPORTUGUES.Read();
				bool MatriculadoPORTUGUES = dadosVerificaPORTUGUES.HasRows;
				connVerificaPORTUGUES.Close();

				if (!MatriculadoPORTUGUES)
				{
					MySqlConnection conninsertPORTUGUES = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
					conninsertPORTUGUES.Open();
					MySqlCommand sqlinsertPORTUGUES = new MySqlCommand();
					sqlinsertPORTUGUES.Connection = conninsertPORTUGUES;
					sqlinsertPORTUGUES.CommandText = "INSERT INTO PAGSEGURO(CPF,TURMA,DATA_CADASTRO,SITUACAOMP,REFERENCIA) VALUES ('" + CPF + "','" + pturmaqui + "',current_timestamp,'ABERTO','" + REFERENCIA + "')";

					int retornoportugues = sqlinsertPORTUGUES.ExecuteNonQuery();
					conninsertPORTUGUES.Close();

				}

			}
			// FINAL ITEM QUIMICA


			string pFone1 = "";
			if (pFone1.Length >= 13)
			{
				pFone1 = pFone1.Substring(4, 9).Replace("-", "");
			}
			else
				pFone1 = "";
			String pNome = Request.Cookies["nome_resp"].Value.ToString();
			String pEmail = Request.Cookies["email_resp"].Value.ToString();
			String pCPF = CPF;
			payment.Sender = new Sender(pNome,
											 pEmail,
											(new Phone("81", pFone1)));
			payment.Shipping = new Shipping();
			payment.Shipping.ShippingType = ShippingType.Sedex;

			payment.Shipping.Address = new Address(
				"BRA",
				"",//EditUF.Text.ToUpper(),
				"",//EditCidade.Text,
				"",//EditBairro.Text,
				"",//EditCEP.Text.Replace(".","").Replace("-",""),
				"",//EditEndereco.Text,
				"",//EditNumero.Text,
				""//EditCompl.Text
			);

			SenderDocument senderCPF = new SenderDocument(
			Documents.GetDocumentByType("CPF"), pCPF);
			payment.Sender.Documents.Add(senderCPF);
			payment.Currency = Currency.Brl;

			payment.Reference = REFERENCIA;
			if (payment.Items.Count > 0)
			{
				payment.NotificationURL = "http://cursofern2.dominiotemporario.com/matriculas2019/retorno.aspx";
				Uri paymentRedirectUri = payment.Register(Credencial);

				Response.Redirect(paymentRedirectUri.ToString());
				//			Response.Redirect("pagar.aspx");
			}
			else
				Response.Redirect("matricula.aspx");

		}








	%>
	    

                                    <!-- Step 1 -->
                                    
                                    <div class="form-body">
										<h3 class="box-title">Dados Pessoais</h3>
										<hr class="m-t-0 m-b-40">
										<div class="row">



											

                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtid">CPF</label>
                                                    <input type="text" class="form-control" id="txtCPF" name="txtCPF" disabled value="<%=CPF_RESP%>"> </div>
                                            </div>
											
											</div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtnome">Nome</label>
                                                    <input type="text" class="form-control" id="txtnome" name="txtnome" disabled value="<%=Nome %>" required data-validation-required-message="preencher campo obrigatório"> </div>
												
                                            </div>

                                        <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtprof_resp">Profissão</label>
                                                    <input type="text" class="form-control" id="txtprof_resp" name="txtprof_resp" value="<%=prof_resp %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtdata_nasc">Data Nasc.</label>
													<input type="text" placeholder="" data-mask="99/99/9999" class="form-control" id="txtdata_nasc" name="txtdata_nasc" value="<%=DataNasc%>" disabled required data-validation-required-message="preencher campo obrigatório" >
                                                    
												</div> 
                                            </div>

											<div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cbxSexo">Estado Civil</label>
                                                    
													   <select class="custom-select form-control" id="txtest_civil_resp" name="txtest_civil_resp" required data-validation-required-message="preencher campo obrigatório">
                                                       <option value="<%=estado_civil %>"><%=estado_civil %></option>
                                                       <option value="Solteiro(a)">Solteiro(a)</option>
                                                       <option value="Casado(a)">Casado(a)</option>
													   <option value="Divorciado(a)">Divorciado(a)</option>
													   <option value="Viúvo(a)">Viúvo(a)</option>

														   
                                                        
                                                    </select>

													

                                                </div>
                                            </div>


                                   
                                        </div>

                                        <div class="row">
											<div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfone1">Fone1</label>
                                                    <input type="text" class="form-control" id="txtfone1" name="txtfone1" value="<%=Fone1 %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>

                                           <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfone2">Fone2</label>
                                                    <input type="text" class="form-control" id="txtfone2" name="txtfone2" value="<%=Fone2 %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>



                                        </div>


                                        <div class="row">
											<div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtrg">E-mail</label>
                                                    <input type="text" class="form-control" id="txtemail" name="txtemail" value="<%=Email %>" disabled required data-validation-required-message="preencher campo obrigatório" > </div>
                                            </div>

											<div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtrg">RG</label>
                                                    <input type="text" class="form-control" id="txtrg" name="txtrg" value="<%=RG %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>

                                           <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtorgao">Orgão Emissor/UF</label>
                                                    <input type="text" class="form-control" id="txtorgao" name="txtORGAO" value="<%=Orgao %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>


                                        </div>
                                    </div>
                                    <!-- Step 2 -->
                                    
                                   
                                    <!-- Step 3 -->
                                    <div class="form-body">
										<h3 class="box-title">Endereços</h3>
										<hr class="m-t-0 m-b-40">
                                    
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcep">CEP</label>
                                                    <input type="text" class="form-control" id="txtcep" name="txtcep" maxlength="10" size="9" onblur="pesquisacep(this.value);" value="<%=Cep %>" required data-validation-required-message="preencher campo obrigatório"> 
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label for="txtendereco">Endereço</label>
                                                    <input type="text" class="form-control" id="txtendereco" name="txtendereco" value="<%=Endereco %>" required data-validation-required-message="preencher campo obrigatório"> 

                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtnumero">Número</label>
                                                    <input type="text" class="form-control" id="txtnumero" name="txtnumero" value="<%=Numero %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcomplemento">Complemento</label>
                                                    <input type="text" class="form-control" id="txtcomplemento" name="txtcomplemento" value="<%=Complemento %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtbairro">Bairro</label>
                                                    <input type="text" class="form-control" id="txtbairro" name="txtbairro" value="<%=Bairro %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcidade">Cidade</label>
                                                    <input type="text" class="form-control" id="txtcidade" name="txtcidade" value="<%=Cidade %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtuf">UF</label>
                                                    <input type="text" class="form-control" id="txtuf" name="txtuf" value="<%=UF %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtnacionalidade_resp">Nacionalidade</label>
                                                    <input type="text" class="form-control" id="txtnacionalidade_resp" name="txtnacionalidade_resp" value="<%=nacionalidade %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>


                                        </div>
                                    </div>

									 


                                        

									
                                    <!-- Step 4 -->
                                    <div class="form-body">
										<hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-success" name="cmdpost" value="SAVE">Finalizar</button>
                                                        <button type="submit" class="btn btn-success" name="cmdpost" value="PRINTPE">Imprimir Contrato</button>
														<button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse" name="cmdpost" value="CANCEL">Cancelar</button>

                                                    </div>
                                            </div>

                                        </div>
                                    </div>
								
                                </form>
							    </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                



			</div>

            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                © Curso Fernanda Pessoa
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    
	<!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->


<!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js" type="text/javascript"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/tether.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
	<!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js" type="text/javascript"></script>
    <!--Wave Effects -->
    <script src="js/waves.js" type="text/javascript"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js" type="text/javascript"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js" type="text/javascript"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js" type="text/javascript"></script>
	    <script src="js/validation.js"></script>
    <script>
		! function (window, document, $) {
			"use strict";
			$("input,select,textarea").not("[type=submit]").jqBootstrapValidation(), $(".skin-square input").iCheck({
				checkboxClass: "icheckbox_square-green",
				radioClass: "iradio_square-green"
			}), $(".touchspin").TouchSpin(), $(".switchBootstrap").bootstrapSwitch();
		}(window, document, jQuery);
    </script>

    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>

    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>


	    <script src="assets/plugins/moment/min/moment.min.js"></script>
    <script src="assets/plugins/wizard/jquery.steps.min.js"></script>
    <script src="assets/plugins/wizard/jquery.validate.min.js"></script>
    <script src="assets/plugins/wizard/steps.js"></script>

    <!-- ============================================================== -->
    <!-- This page plugins -->
    <!-- ============================================================== -->
    <!-- chartist chart -->
    <script src="assets/plugins/chartist-js/dist/chartist.min.js" type="text/javascript"></script>
    <script src="assets/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js" type="text/javascript"></script>
    <!-- Chart JS -->
    <script src="assets/plugins/echarts/echarts-all.js" type="text/javascript"></script>
    <!-- Chart JS -->
    <script src="js/dashboard1.js" type="text/javascript"></script>
    <!-- ============================================================== -->


    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js" type="text/javascript"></script>
   <script src="assets/plugins/icheck/icheck.min.js"></script>

    <script src="assets/plugins/icheck/icheck.init.js"></script>

    <script src="assets/plugins/sweetalert/sweetalert.min.js"></script>


    
    <script src="assets/plugins/jsgrid/dist/jsgrid.min.js" type="text/javascript"></script>
    <script src="js/jsgrid-init.js"></script>
	<script src="js/mask.js"></script>
	<script src="assets/plugins/dropify/dist/js/dropify.min.js"></script>

	


	    <script>
			$(document).ready(function () {
				// Basic
				$('.dropify').dropify();

				// Translated
				$('.dropify-fr').dropify({
					messages: {
						default: 'Glissez-déposez un fichier ici ou cliquez',
						replace: 'Glissez-déposez un fichier ou cliquez pour remplacer',
						remove: 'Supprimer',
						error: 'Désolé, le fichier trop volumineux'
					}
				});

				// Used events
				var drEvent = $('#input-file-events').dropify();

				drEvent.on('dropify.beforeClear', function (event, element) {
					return confirm("Do you really want to delete \"" + element.file.name + "\" ?");
				});

				drEvent.on('dropify.afterClear', function (event, element) {
					alert('File deleted');
				});

				drEvent.on('dropify.errors', function (event, element) {
					console.log('Has Errors');
				});

				var drDestroy = $('#input-file-to-destroy').dropify();
				drDestroy = drDestroy.data('dropify')
				$('#toggleDropify').on('click', function (e) {
					e.preventDefault();
					if (drDestroy.isDropified()) {
						drDestroy.destroy();
					} else {
						drDestroy.init();
					}
				})
			});
    </script>

    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->




	<script>
		$(document).ready(function () {
			$('#myTable').DataTable();
			$(document).ready(function () {
				var table = $('#example').DataTable({
					"columnDefs": [{
						"visible": false,
						"targets": 2
					}],
					"order": [
						[2, 'asc']
					],
					"displayLength": 25,
					"drawCallback": function (settings) {
						var api = this.api();
						var rows = api.rows({
							page: 'current'
						}).nodes();
						var last = null;
						api.column(2, {
							page: 'current'
						}).data().each(function (group, i) {
							if (last !== group) {
								$(rows).eq(i).before('<tr class="group"><td colspan="5">' + group + '</td></tr>');
								last = group;
							}
						});
					}
				});
				// Order by the grouping
				$('#example tbody').on('click', 'tr.group', function () {
					var currentOrder = table.order()[0];
					if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
						table.order([2, 'desc']).draw();
					} else {
						table.order([2, 'asc']).draw();
					}
				});
			});
		});
		$('#example23').DataTable({
			dom: 'Bfrtip',
			buttons: [
				 'excel'
			]
		});

		$('#report').DataTable({
			dom: 'Bfrtip',
			buttons: [
				'excel','pdf','print'
			]
		});
    </script>

	<script type="text/javascript">
    $(function () {
        $("[id$=txtescola]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("cadastro.aspx/GetEscolas") %>',
                    data: "{ 'prefixo': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("[id$=hfCustomerId]").val(i.item.val);
            },
            minLength: 1
        });
    });  
</script>



	<script type="text/javascript">
    $(function () {
        $("[id$=txtcurso]").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("cadastro.aspx/GetCursos") %>',
                    data: "{ 'prefixo': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("[id$=hfCustomerId]").val(i.item.val);
            },
            minLength: 1
        });
    });  
</script>

	<script src="js/EnterTab.js"></script>


    
</body>



</html>
