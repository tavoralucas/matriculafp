<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="Simulado.cadastro" %>

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
    
	<title>Matrículas 2021</title>

<script type="text/javascript" src="js/MSGAguarde.js"></script>	

	
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
									<%@ Import Namespace="MySql.Data.Types" %>
									<%@ Import Namespace="System.IO" %>
									<%@ Import Namespace="System.Drawing" %>
									<%@ Import Namespace="System.Security" %>
									<%@ Import Namespace="System.Security.Permissions" %>
									<%@ Import Namespace="System" %>
							
									
									
									
	<%


		String comandogeral = "edit";
		string comando = "";

		String CPF = "";
		CPF = Request.Cookies["cpf"].Value.ToString();
		String turma = "Selecione";
		String turmadisable = "";
		String turmamat = "Selecione";
		String turmamatdisable = "";

		String turmaqui = "Selecione";
		String turmaquidisable = "";

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
		Nome = Request.Cookies["nome"].Value.ToString();
		String Apelido = "";
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


		if (CPF != "")
		{
			comandogeral = "edit";

			MySqlConnection connedit = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			MySqlCommand sqlConsultaCO = new MySqlCommand();
			sqlConsultaCO.Connection = connedit;
			connedit.Open();
			sqlConsultaCO.CommandText = "Select * from aluno  left outer join disci_aluno on aluno.CPF=disci_aluno.CPF where aluno.cpf='" + CPF + "'";


			MySqlDataReader dadosCO = sqlConsultaCO.ExecuteReader();
			dadosCO.Read();
			if (dadosCO.HasRows)
			{
				turma = dadosCO["TURMA"].ToString();
				if (turma != "")
					turmadisable = " disabled";

				turmamat = dadosCO["TURMA_MAT"].ToString();
				if (turmamat != "")
					turmamatdisable = " disabled";

				turmaqui = dadosCO["TURMA_QUI"].ToString();
				if (turmaqui != "")
					turmaquidisable = " disabled";

				Nome = dadosCO["nome"].ToString();

				Apelido = dadosCO["Apelido"].ToString();


				vDataNasc = dadosCO.GetMySqlDateTime("DATA_NASC");
				DataNasc = vDataNasc.Value.ToString("dd/MM/yyyy");
				DataNasc2 = vDataNasc.Value.ToString("yyyy-MM-dd");
				Sexo = dadosCO["Sexo"].ToString();

				Pai = dadosCO["Pai"].ToString();
				Fone_pai = dadosCO["Fone_pai"].ToString();
				Prof_pai = dadosCO["Prof_Pai"].ToString();

				Mae = dadosCO["mae"].ToString();
				Fone_mae = dadosCO["fone_mae"].ToString();
				Prof_mae = dadosCO["Prof_mae"].ToString();
				Curso = dadosCO["Curso"].ToString();
				Escola = dadosCO["colegio"].ToString();
				Serie = dadosCO["serie"].ToString();
				Ano_conclusao = dadosCO["conclusao"].ToString();
				RG = dadosCO["RG"].ToString();
				Orgao = dadosCO["ORG"].ToString();
				Area = dadosCO["Area"].ToString();
				Curso = dadosCO["Curso"].ToString();

				Fone1 = dadosCO["Fone1"].ToString();
				Fone2 = dadosCO["Fone2"].ToString();
				Fone3 = dadosCO["Fone3"].ToString();
				Email = dadosCO["e_mail"].ToString();
				Cep = dadosCO["cep"].ToString();
				Endereco = dadosCO["endereco"].ToString();
				Numero = dadosCO["Numero"].ToString();
				Complemento = dadosCO["COMPL"].ToString();
				Bairro = dadosCO["Bairro"].ToString();
				Cidade = dadosCO["Cidade"].ToString();
				UF = dadosCO["UF"].ToString();



			}
			connedit.Close();
		}

		if (Request.Form.Count > 0)
		{
			if (Request.Cookies["usuario"] != null)
				usuario = Server.HtmlEncode(Request.Cookies["usuario"].Value);


			comando = Request.Form["cmdpost"].ToString();



			if (!string.IsNullOrEmpty(Request.Form["txtturma"]))
			{
				turma = Request.Form["txtturma"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtturmamat"]))
			{
				turmamat = Request.Form["txtturmamat"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtturmaqui"]))
			{
				turmaqui = Request.Form["txtturmaqui"].ToString();
			}


			if (!string.IsNullOrEmpty(Request.Form["txtpai"]))
			{
				Pai = Request.Form["txtpai"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfonepai"]))
			{
				Fone_pai = Request.Form["txtfonepai"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtprofpai"]))
			{
				Prof_pai = Request.Form["txtprofpai"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtmae"]))
			{
				Mae = Request.Form["txtmae"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfonemae"]))
			{
				Fone_mae = Request.Form["txtfonemae"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtprofmae"]))
			{
				Prof_mae = Request.Form["txtprofmae"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcurso"]))
			{
				Curso = Request.Form["txtcurso"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtarea"]))
			{
				Area = Request.Form["txtarea"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtescola"]))
			{
				Escola = Request.Form["txtescola"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtserie"]))
			{
				Serie = Request.Form["txtserie"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtano_conclusao"]))
			{
				Ano_conclusao = Request.Form["txtano_conclusao"].ToString();
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

			if (!string.IsNullOrEmpty(Request.Form["txtapelido"]))
			{
				Apelido = Request.Form["txtapelido"].ToString();

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
			if (!string.IsNullOrEmpty(Request.Form["txtfone3"]))
			{
				Fone3 = Request.Form["txtfone3"].ToString();
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
		}

		if ((comandogeral == "edit") && (comando=="SAVE"))
		{
			MySqlConnection connup = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			MySqlCommand sqlUpdate = new MySqlCommand();
			sqlUpdate.Connection = connup;
			connup.Open();
			sqlUpdate.CommandText = "Update aluno set NOME='" + Nome + "', APELIDO='" + Apelido + "', DATA_NASC='" + DataNasc2 + "', SEXO='" + Sexo + "'," +
			"Pai='" + Pai + "', Fone_pai ='" + Fone_pai + "', Prof_pai='" + Prof_pai +"',"+
			"Mae='" + Mae + "', Fone_mae ='" + Fone_mae + "', Prof_mae='" + Prof_mae +"',"+
			"Area='" + Area + "', Curso ='" + Curso +"',"+
			"RG='" + RG + "', ORG ='" + Orgao +"',"+
			"COLEGIO='" + Escola + "', CONCLUSAO ='" + Ano_conclusao + "', serie='" + Serie +"',"+
			"FONE1='" + Fone1 + "', FONE2='" + Fone2 + "', FONE3='" + Fone3 + "', E_MAIL='" + Email + "'," +
			"CEP='" + Cep + "', ENDERECO='" + Endereco + "', NUMERO='" + Numero + "', COMPL='" + Complemento + "', BAIRRO='" + Bairro + "', CIDADE='" + Cidade + "'," +
			" UF='" + UF+"' where cpf='"+CPF+"'";

			int result = sqlUpdate.ExecuteNonQuery();
			connup.Close();


			if (Request.Files.Count>0)
			{
				// String ArqFoto = "C:\\fernandaPessoa\\fotos\\170057.jpg";
                //Request.Form["foto"].ToString();
				//String ArqFoto = Request.Files[0].FileName.ToString();
				//if (System.IO.File.Exists(ArqFoto))

				if (Request.Files[0].InputStream.Length >0)
				{
					System.Drawing.Image fotopessoa = System.Drawing.Image.FromStream(Request.Files[0].InputStream);

					String path = Server.MapPath("fotos");
					string imgPath = Server.MapPath(@"fotos/FT" +  CPF.ToString() + ".jpg");
					fotopessoa.Save(imgPath);
				}


			}
			Response.Cookies["turma"].Value = turma;
			Response.Cookies["turmamat"].Value = turmamat;
			Response.Cookies["turmaqui"].Value = turmaqui;
			Response.Redirect("responsavel.aspx");


		}


	%>
	    

                                    <!-- Step 1 -->
                                    
                                    <div class="form-body">
										<h3 class="box-title">Dados Pessoais</h3>
										<hr class="m-t-0 m-b-40">
										<div class="row">

  										    <div class="col-md-6">
                                            <div class="form-group">
											<div class="card">
                                            <div class="card-block">
                                            <h4 class="card-title">Foto</h4>
                                            <label for="input-file-now">Clique no quadro para selecionar</label>
                                            <input type="file" id="input-file-now" class="dropify" name="foto"/>
                                            </div>
                                            </div>
											</div>
                                            </div>

  										    <div class="col-md-6">
                                            <div class="form-group">
											<div class="card">
                                            <div class="card-block">
                                            <label for="input-file-now"></label>
                                            </div>
                                            </div>
											</div>
                                            </div>
                                            <div class="container">
                                            <div class="row">
											<div class="col-md-4">
                                              <div class="form-group">

                                                    <label for="txtregiao">PORTUGUÊS</label>
                                                  <%   
													 Response.Write("<select class='custom-select form-control' id='txtturma' name='txtturma'  "+turmadisable+">");
  											      %>
<%
		  Response.ContentType="text/HTML";

		  MySqlConnection conn = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select * from turma where cod_disciplina=2 order by turma";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();
		  Response.Write("<option value='"+turma+"'>"+turma+"</option>");

		  while (dados.Read())
		  {
			  Response.Write("<option value='" + dados["TURMA"].ToString() + "'>" + dados["TURMA"].ToString()+" - "+dados["DIATURMA"].ToString()+" de "+dados["HORARIO"].ToString() +" ás "+dados["HORARIO2"].ToString() +"</option>");

		  }
		  conn.Close();

       %>

                                                        
               </select>
											    
											  </div>
                                                </div>

                                                <div class="col-md-4">
                                                 <div class="form-group">

                                                    <label for="txtregiao">MATEMÁTICA</label>
                                                  <%   
													 Response.Write("<select class='custom-select form-control' id='txtturmamat' name='txtturmamat' "+turmamatdisable+">");
  											      %>

      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection connmat = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

		  connmat.Open();
		  MySqlCommand sqlConsultamat = new MySqlCommand();
		  sqlConsultamat.Connection = connmat;
		  sqlConsultamat.CommandText = "Select * from turma where cod_disciplina=9 order by turma";
		  MySqlDataReader dadosmat = sqlConsultamat.ExecuteReader();
		  Response.Write("<option value='"+turmamat+"'>"+turmamat+"</option>");

		  while (dadosmat.Read())
		  {
			  Response.Write("<option value='" + dadosmat["TURMA"].ToString() + "'>" + dadosmat["TURMA"].ToString()+" - "+dadosmat["DIATURMA"].ToString()+" de "+dadosmat["HORARIO"].ToString() +" ás "+dadosmat["HORARIO2"].ToString() +"</option>");

		  }
		  connmat.Close();

       %>

                                                        
               </select>
											    
											  </div>
                                                </div>

<div class="col-md-4">
<div class="form-group">

                                                    <label for="txtregiao">QUÍMICA</label>
                                                  <%   
													 Response.Write("<select class='custom-select form-control' id='txtturmaqui' name='txtturmaqui' "+turmaquidisable+">");
  											      %>

      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection connqui = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

		  connqui.Open();
		  MySqlCommand sqlConsultaqui = new MySqlCommand();
		  sqlConsultaqui.Connection = connqui;
		  sqlConsultaqui.CommandText = "Select * from turma where cod_disciplina=20 order by turma";
		  MySqlDataReader dadosqui = sqlConsultaqui.ExecuteReader();
		  Response.Write("<option value='"+turmaqui+"'>"+turmaqui+"</option>");

		  while (dadosqui.Read())
		  {
			  Response.Write("<option value='" + dadosqui["TURMA"].ToString() + "'>" + dadosqui["TURMA"].ToString()+" - "+dadosqui["DIATURMA"].ToString()+" de "+dadosqui["HORARIO"].ToString() +" ás "+dadosqui["HORARIO2"].ToString() +"</option>");

		  }
		  conn.Close();

       %>

                                                        
               </select>
											    
											  </div>


											</div>
                                                </div>
             </div>                               
             

                                                <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtid">CPF</label>
                                                    <input type="text" class="form-control" id="txtCPF" name="txtCPF" disabled value="<%=CPF%>"> </div>
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
                                                    <label for="txtapelido">Nome Social</label>
                                                    <input type="text" class="form-control" id="txtapelido" name="txtapelido" value="<%=Apelido %>" required data-validation-required-message="preencher campo obrigatório"> </div>
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
                                                    <label for="cbxSexo">Gênero</label>
                                                    
													   <select class="custom-select form-control" id="cbxSexo" name="cbxSexo" required data-validation-required-message="preencher campo obrigatório">
                                                       <option value="<%=Sexo %>"><%=Sexo %></option>
                                                       <option value="Masculino">Masculino</option>
                                                       <option value="Ferminino">Feminino</option>
													   <option value="Transhomem">Transhomem</option>
													   <option value="Transmulher">Transmulher</option>
													   <option value="Travesti">Transmulher</option>
													   <option value="Transgênero">Transmulher</option>
													   <option value="Sem Gênero">Sem Gênero</option>

														   
                                                        
                                                    </select>

													

                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
											<div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfone1">Fone1</label>
                                                    <input type="text" class="form-control" id="txtfone1" name="txtfone1" value="<%=Fone1 %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>

                                           <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfone2">Fone2</label>
                                                    <input type="text" class="form-control" id="txtfone2" name="txtfone2" value="<%=Fone2 %>"> </div>
                                            </div>

                                           <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfone3">Fone3</label>
                                                    <input type="text" class="form-control" id="txtfone3" name="txtfone3" value="<%=Fone3 %>" > </div>
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


                                        </div>
                                    </div>

									 <div class="form-body">
										<h3 class="box-title">Filiação</h3>
										<hr class="m-t-0 m-b-40">

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtpai">Nome do Pai</label>
                                                    <input type="text" class="form-control" id="txtpai" name="txtpai" value="<%=Pai %>" required data-validation-required-message="preencher campo obrigatório"> </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfonepai">Fone</label>
                                                    <input type="text" class="form-control" id="txtfonepai" name="txtfonepai" value="<%=Fone_pai %>" required data-validation-required-message="preencher campo obrigatório"> 
                                                </div>
                                            </div>
											<div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtprofpai">Profissão</label>
                                                    <input type="text" class="form-control" id="txtprofpai" name="txtprofpai" value="<%=Prof_pai %>" required data-validation-required-message="preencher campo obrigatório"> 
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtmae">Nome da Mãe</label>
                                                    <input type="text" class="form-control" id="txtmae" name="txtmae" value="<%=Mae %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfonemae">Fone</label>
                                                    <input type="text" class="form-control" id="txtfonemae" name="txtfonemae" value="<%=Fone_mae %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>
																						<div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtprofmae">Profissão</label>
                                                    <input type="text" class="form-control" id="txtprofmae" name="txtprofmae" value="<%=Prof_mae %>" required data-validation-required-message="preencher campo obrigatório"> 
                                                </div>
                                            </div>

                                        </div>
                                    </div>


                                        <div class="form-body">
										<h3 class="box-title">Escolaridade</h3>
										<hr class="m-t-0 m-b-40">

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtescola">Colégio</label>
                                                    <input type="text" class="form-control" id="txtescola" name="txtescola" value="<%=Escola %>" required data-validation-required-message="preencher campo obrigatório"> </div>
												  <asp:HiddenField ID="hfCustomerId" runat="server" />
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtfonepai">Ano de Conclusão</label>
                                                    <input type="text" class="form-control" id="txtano_conclusao" name="txtano_conclusao" value="<%=Ano_conclusao %>" required data-validation-required-message="preencher campo obrigatório">
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label for="txtserie">Série</label>
                                                    <select class="custom-select form-control" id="txtserie" name="txtserie" required data-validation-required-message="preencher campo obrigatório">
                                                       <option value="<%=Serie %>"><%=Serie %></option>
                                                       <option value="1º ANO">1º ANO</option>
                                                       <option value="2º ANO">2º ANO</option>
													   <option value="3º ANO">3º ANO</option>

														   
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                           

                                        </div>
                                    </div>

									<div class="form-body">
										<h3 class="box-title">Pretenção</h3>
										<hr class="m-t-0 m-b-40">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtarea">Área</label>
                                                    <select class="custom-select form-control" id="txtarea" name="txtarea" required data-validation-required-message="preencher campo obrigatório">
                                                       <option value="<%=Area %>"><%=Area %></option>
                                                       <option value="HUMANAS">HUMANAS</option>
                                                       <option value="SAÚDE">SAÚDE</option>
													   <option value="EXATAS">EXATAS</option>
													   <option value="OUTROS">OUTROS</option>
													   <option value="A DEFINIR">A DEFINIR</option>

														   
                                                        
                                                    </select>
                                            </div>
												</div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcurso">Curso</label>
                                                    <input type="text" class="form-control" id="txtcurso" name="txtcurso" value="<%=Curso %>" required data-validation-required-message="preencher campo obrigatório">
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
                                                        <button type="submit" class="btn btn-success" name="cmdpost" value="SAVE">Continuar</button>
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
						default: 'Arraste e solte uma imagem aqui ou clique para procurar!',
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
