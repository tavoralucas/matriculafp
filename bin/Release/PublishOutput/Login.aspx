<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="esmeraldino.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Esmeraldino System</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/green.css" id="theme" rel="stylesheet">
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
        <div class="login-register" style="background-image:url(assets/images/background/login-register.jpg);">        
            <div class="login-box card">
            <div class="card-block">
                <form class="form-horizontal form-material" id="loginform" method="POST" action="#" runat="server">
					 <%@ Import Namespace="MySql.Data.MySqlClient" %>
					<%@ Import Namespace="System.Web.Security" %>
					<%
						if (Request.Form.Count> 0)
						{
							string login = Request.Form["txtlogin"].ToString();
							string senha = Request.Form["txtsenha"].ToString();


							MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
							MySqlCommand sqlLogin = new MySqlCommand();
							sqlLogin.Connection = connin;
							connin.Open();
							sqlLogin.CommandText = "Select * from USUARIO where LOGIN='" + login + "' and SENHA='" + senha + "'";
							MySqlDataReader dados = sqlLogin.ExecuteReader();

							if (dados.HasRows)
							{
								Response.Cookies["usuario"].Value = login;
								Response.Cookies["usuario"].Expires = DateTime.Now.AddDays(1);

								if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
								{
									FormsAuthentication.SetAuthCookie(login, false);
									Response.Redirect("index.aspx");
								}
								else
									FormsAuthentication.RedirectFromLoginPage(login, false);

							}
							else
							{
								ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage",
								"alert('Usuário ou senha incorretos!');", true);
							}
							connin.Close();

						}


					%>
                    <h3 class="box-title m-b-20">Login</h3>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="text" required="" placeholder="Username" name="txtlogin"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" type="password" required="" placeholder="Password" name="txtsenha"> </div>
                    </div>
                            
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Entrar</button>
                        </div>
                    </div>
                </form>
            </div>
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
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>

</html>