<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="matricula.aspx.cs" Inherits="Simulado.matricula" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content=" Tela de Cadastro">
    <meta name="author" content="TI - Fernanda Pessoa">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="imagens/florpreta.png">
    
	<title>Matrículas 2021 - Curso Fernanda Pessoa</title>
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

<body style="color:#b44146 !important; border-color:#b44146">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
<!--<div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
	</div>
-->
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    
	<section id="wrapper" >
		<div style="background-color: #b44146; display: flex; justify-content: center; border-color: #b44146;">
			<img src="imagens/logo_CURSO.png" class="imagemlogo"/>
		</div>
        <div class="login-register" style="background-color:#b44146;border-color: #b44146;">        
            <div class="login-box card">
            <div class="card-block">
				<form style="" class="form-horizontal form-material" id="loginform" method="POST" action="#" runat="server" autocomplete="off">
	<%@ Import Namespace="System.IO" %>
	<%@ Import Namespace="System.Net" %>
	<%@ Import Namespace="System.Xml" %>
					<%@ Import Namespace="RestSharp" %>
	
					<%@ Import Namespace="MySql.Data.MySqlClient" %>
					<%@ Import Namespace="System.Web.Security" %>
					<%
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
								Response.Redirect("matricula.aspx?email=S");
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
							sqlpendencia.CommandText = "Select * from pendencia where CPF='" + cpf+"' and situacao='I'";
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

							sqlValidaEmail.Connection = connin;
							sqlValidaEmail.CommandText ="Select cpf,nome from aluno where CPF<>'" + cpf+"' and e_mail='"+e_mail+"'";
							MySqlDataReader dadosEmail = sqlValidaEmail.ExecuteReader();
							dadosEmail.Read();
							if (dadosEmail.HasRows)
							{
								Response.Redirect("matricula.aspx?emailexiste=S");

								return;

							}
							connin.Close();
							connin.Open();

							sqlLogin.CommandText = "Select cpf,nome from aluno where CPF='" + cpf+"'";
							MySqlDataReader dados = sqlLogin.ExecuteReader();

							dados.Read();
							if (dados.HasRows)
							{
								Response.Cookies["cpf"].Value = cpf;
								Response.Cookies["nome"].Value = dados["nome"].ToString();
								Response.Cookies["usuario"].Expires = DateTime.Now.AddDays(1);


								if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
								{
									FormsAuthentication.SetAuthCookie(cpf, false);
									Response.Redirect("cadastro.aspx");
								}
								else
									FormsAuthentication.RedirectFromLoginPage(cpf, false);

							}
							else
							{
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3;
            //WebRequest request = WebRequest.Create("https://ws.iwebservice.info/CPF/?chave=4A5GG-B3781-E3CX8-CLPL1&cpf="+cpf+"&dataNascimento="+data_nasc);
            // If required by the server, set the credentials.
            //request.Credentials = CredentialCache.DefaultCredentials;

            // Get the response.
            //WebResponse response = request.GetResponse();
            // Display the status.
            //Retorno = ((HttpWebResponse)response).ContentEncoding;


								var client = new RestClient("https://ws.iwebservice.info/CPF/?chave=4A5GG-B3781-E3CX8-CLPL1&cpf="+cpf+"&dataNascimento="+data_nasc);
								var request = new RestRequest(Method.GET);
								IRestResponse response = client.Execute(request);
								Retorno = response.Content.ToString();
								if (Retorno == "")
								{
									Response.Redirect("matricula.aspx?erro=S");

									return;
								}

								XmlDocument xml = new XmlDocument();
								xml.LoadXml(Retorno); // suppose that myXmlString contains "<Names>...</Names>"

								//Display all the book titles.
								XmlNodeList elemList = xml.GetElementsByTagName("Titular");
								for (int i=0; i < elemList.Count; i++)
								{
									titular = elemList[i].InnerXml;
								}

								if (titular == "")
								{
									Response.Redirect("matricula.aspx?erro=S");

									Response.Redirect("matricula.aspx");
									return;
								}


								MySqlCommand sqlinsert = new MySqlCommand();
								connin.Close();
								sqlinsert.Connection = connin;
								connin.Open();
								sqlinsert.CommandText = "insert into aluno(cpf,data_nasc,e_mail,nome,data_cad) values ('" + cpf + "','" + data_nasc2 + "','" + e_mail + "','"+titular+"',current_timestamp)";
								int retorno = sqlinsert.ExecuteNonQuery();
								if (retorno > 0)
								{
									Response.Cookies["cpf"].Value = cpf;
									Response.Cookies["usuario"].Expires = DateTime.Now.AddDays(1);
									Response.Cookies["nome"].Value = titular;
									if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
									{
										FormsAuthentication.SetAuthCookie(cpf, false);
										Response.Redirect("cadastro.aspx");
									}
									else
										FormsAuthentication.RedirectFromLoginPage(cpf, false);

								}
								else
									ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
									"alert('Erro ao continuar.');", true);
							}
							connin.Close();

						}


					%>
					
					<h3 class="box-title m-b-20">Informe os dados do aluno(a)</h3>
                    <div class="form-group ">
                        <div class="col-xs-12">
							<label>CPF do Aluno</label>
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
                            <input type="text" class="form-control" required="" name="txtEMAIL" id="txtEMAIL"  data-validation-regex-regex="([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})" data-validation-regex-message="E-mail inválido!" autocomplete="off"> 
						    </div>
								</div>

                        </div>

					<div class="col-xs-12">
							<div class="form-group">
							<label>Confirmar E-mail</label>
							<div class="controls">
                            <input type="text" runat="server" class="form-control" required="" name="txtEMAIL2" id="txtEMAIL2"  data-validation-regex-regex="([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})" data-validation-regex-message="E-mail inválido!" autocomplete="chrome-off"> 
						    </div>
								</div>

                        </div>
                    

                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit" style="background-color: #a8151a !important; border-color: #a8151a;">Continuar</button>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.min.js"></script>


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

</body>

</html>