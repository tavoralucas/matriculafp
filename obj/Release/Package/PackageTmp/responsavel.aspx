<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="responsavel.aspx.cs" Inherits="Simulado.responsavel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
	
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
	<title>Matrículas 2019</title>
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
</head>

<body>
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
    
	<section id="wrapper">

        <div class="login-register" style="background-image:url(assets/images/background/login-register2.jpg);">        
            <div class="login-box card">
            <div class="card-block">
                <form class="form-horizontal form-material" id="loginform" method="POST" action="#" runat="server">
	<%@ Import Namespace="System.IO" %>
	<%@ Import Namespace="System.Net" %>
	<%@ Import Namespace="System.Xml" %>
	<%@ Import Namespace="RestSharp" %>
					<%@ Import Namespace="MySql.Data.MySqlClient" %>
					<%@ Import Namespace="System.Web.Security" %>
					<%@ Import Namespace="Newtonsoft.Json" %>
					<%@ Import Namespace="Newtonsoft.Json.Serialization" %>
					<%
						String CPF_ALUNO = "";
						string TURMA = "";
						string TURMAMAT = "";
						string TURMAQUI = "";
						CPF_ALUNO = Request.Cookies["cpf"].Value.ToString();
						TURMA = Request.Cookies["TURMA"].Value.ToString();
						TURMAMAT = Request.Cookies["TURMAMAT"].Value.ToString();
						TURMAQUI = Request.Cookies["TURMAQUI"].Value.ToString();

						if (Request.QueryString.Count > 0)
						{
							if (!string.IsNullOrEmpty(Request.QueryString["erro"]))
							{
								ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
								  "alert('CPF ou data de nascimento inválidos.');", true);
							}

							if (!string.IsNullOrEmpty(Request.QueryString["email"]))
							{
								ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
								  "alert('Confirmação do e-mail incorreta.');", true);
							}


							if (!string.IsNullOrEmpty(Request.QueryString["emailexiste"]))
							{
								ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
								  "alert('Este e-mail encontra-se cadastrado em outro cpf no sistema.');", true);
							}

						}

						if (Request.Form.Count> 0)
						{
							string cpf = Request.Form["txtCPF"].ToString().Replace(".","").Replace("-","");
							string data_nasc = Request.Form["txtDATA"].ToString();
							DateTime dataN = Convert.ToDateTime(data_nasc);
							data_nasc = dataN.ToString("dd/MM/yyyy");
							string data_nasc2 = dataN.ToString("yyyy-MM-dd");

							string e_mail = Request.Form["txtEMAIL"].ToString();
							string e_mail2 = Request.Form["txtEMAIL2"].ToString();
							if (e_mail != e_mail2)
							{
								Response.Redirect("responsavel.aspx?email=S");
								return;

							}


							string Retorno = "";
							string titular = "";


							MySqlConnection connin = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
							MySqlCommand sqlLogin = new MySqlCommand();
							MySqlCommand sqlpendencia = new MySqlCommand();
							MySqlCommand sqlValidaEmail = new MySqlCommand();

							sqlLogin.Connection = connin;
							connin.Open();

							sqlpendencia.Connection = connin;
							sqlpendencia.CommandText = "Select * from pendencia where CPF_resp='" + cpf+"' and situacao='I'";
							MySqlDataReader dadosP = sqlpendencia.ExecuteReader();
							dadosP.Read();

							if (dadosP.HasRows)
							{
								ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
									"alert('Indisponível temporariamente, Favor realizar matrícula presencial ou tente mais tarde.');", true);
								return;
							}
							connin.Close();
							connin.Open();

							sqlLogin.CommandText = "Select cpf,cpf_resp,nome_resp,data_nasc_resp from disci_aluno where CPF='" + CPF_ALUNO+"'";
							MySqlDataReader dados = sqlLogin.ExecuteReader();

							dados.Read();
							if (dados.HasRows)
							{
								titular = dados["nome_resp"].ToString();
								if (TURMA != "" || TURMAMAT != "" || TURMAQUI != "")
								{
									MySqlCommand sqlinsert = new MySqlCommand();
									connin.Close();
									sqlinsert.Connection = connin;
									connin.Open();
									sqlinsert.CommandText = "update disci_aluno set turma='" + TURMA + "',cpf_resp='" + cpf + "',nome_resp='" + titular + "',data_nasc_resp='" + data_nasc2 + "',email_resp='" + e_mail + "',turma_mat='" + TURMAMAT + "',turma_qui='" + TURMAQUI + "'"+
										" WHERE CPF="+CPF_ALUNO;
									int retorno = sqlinsert.ExecuteNonQuery();
									if (retorno > 0)
									{
										Response.Cookies["cpf_resp"].Value = cpf;
										Response.Cookies["nome_resp"].Value = titular;
										Response.Cookies["email_resp"].Value = e_mail;
										Response.Redirect("cadastroresp.aspx");

									}
									else
										ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
										"alert('Erro ao continuar.');", true);

									connin.Close();
								}


								Response.Cookies["cpf_resp"].Value = cpf;
								Response.Cookies["nome_resp"].Value = dados["nome_resp"].ToString();
								Response.Cookies["email_resp"].Value = e_mail;
								Response.Redirect("cadastroresp.aspx");

							}
							else
							{
								ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3;
								var client = new RestClient("https://ws.iwebservice.info/CPF/?chave=4A5GG-B3781-E3CX8-CLPL1&cpf=" + cpf + "&dataNascimento=" + data_nasc);
								var request = new RestRequest(Method.GET);
								IRestResponse response = client.Execute(request);
								Retorno = response.Content.ToString();
								if (Retorno == "")
								{
									Response.Redirect("responsavel.aspx?erro=S");

									return;
								}



								if (Retorno == "")
								{
									Response.Redirect("responsavel.aspx?erro=S");

									return;
								}

								XmlDocument xml = new XmlDocument();
								xml.LoadXml(Retorno); // suppose that myXmlString contains "<Names>...</Names>"

								//Display all the book titles.
								XmlNodeList elemList = xml.GetElementsByTagName("Titular");
								for (int i = 0; i < elemList.Count; i++)
								{
									titular = elemList[i].InnerXml;
								}

								if (titular == "")
								{
									Response.Redirect("responsavel.aspx?erro=S");

									return;
								}

								if (TURMA != "" || TURMAMAT != "" || TURMAQUI != "")
								{
									MySqlCommand sqlinsert = new MySqlCommand();
									connin.Close();
									sqlinsert.Connection = connin;
									connin.Open();
									sqlinsert.CommandText = "insert into disci_aluno(cpf,cod_disciplina,disciplina,turma,cpf_resp,nome_resp,data_nasc_resp,email_resp,data_cadastro,turma_mat,turma_qui) values ('" + CPF_ALUNO + "',2,'Português','" + TURMA + "', '" + cpf + "','" + titular + "','" + data_nasc2 + "','" + e_mail + "',current_timestamp,'"+TURMAMAT+"','"+TURMAQUI+"')";
									int retorno = sqlinsert.ExecuteNonQuery();
									if (retorno > 0)
									{
										Response.Cookies["cpf_resp"].Value = cpf;
										Response.Cookies["nome_resp"].Value = titular;
										Response.Cookies["email_resp"].Value = e_mail;
										Response.Redirect("cadastroresp.aspx");

									}
									else
										ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
										"alert('Erro ao continuar.');", true);

									connin.Close();
								}



							}

						}


					%>
                    <h3 class="box-title m-b-20">Informe os dados do Responsável(a)</h3>
                    <div class="form-group ">
                        <div class="col-xs-12">
							<label>CPF do Responsável</label>
                            <input type="text" class="form-control"  required="" name="txtCPF" id="txtCPF" placeholder="000.000.000-00" onkeypress="$(this).mask('000.000.000-00');"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
							<label>Data nascimento</label>
                            <input type="text" class="form-control" required="" name="txtDATA" id="txtDATA" placeholder="dd/mm/aaaa" onkeypress="$(this).mask('00/00/0000');" maxlength="10"  >

                    </div>
						</div>
                            
                        <div class="col-xs-12">
							<div class="form-group">
							<label>E-mail</label>
							<div class="controls">
                            <input type="text" class="form-control" required="" name="txtEMAIL" id="txtEMAIL"  data-validation-regex-regex="([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})" data-validation-regex-message="E-mail inválido!"> 
						    </div>
								</div>

                        </div>

					<div class="col-xs-12">
							<div class="form-group">
							<label>Confirmar E-mail</label>
							<div class="controls">
                            <input type="text" class="form-control" required="" name="txtEMAIL2" id="txtEMAIL2"  data-validation-regex-regex="([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})" data-validation-regex-message="E-mail inválido!" autocomplete="chrome-off"> 
						    </div>
								</div>

                        </div>
                    

                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Continuar</button>
                        </div>
                    </div>
                </form>
            </div>
          </div>
        
        
    </section>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/tether.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <script src="js/validation.js"></script>
	<script src="js/mask.js"></script>
    
    <script>
    ! function(window, document, $) {
        "use strict";
        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation()
    }(window, document, jQuery);
    </script>

    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>
	
</body>

</html>