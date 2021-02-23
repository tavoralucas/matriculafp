<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pagar.aspx.cs" Inherits="Simulado.pagar" %>

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

<body runat="server">
    
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    


	<form id="wrapper" runat="server" method="post">
 	<%@ Import Namespace="Uol.PagSeguro.Util" %>
	<%@ Import Namespace="Uol.PagSeguro.Domain" %>
	<%@ Import Namespace="Uol.PagSeguro.Service" %>
	<%@ Import Namespace="Uol.PagSeguro.XmlParse" %>
	<%@ Import Namespace="Uol.PagSeguro.Constants" %>
	<%@ Import Namespace="Uol.PagSeguro.Parse" %>
	<%@ Import Namespace="Uol.PagSeguro.Exception" %>
	<%@ Import Namespace="Uol.PagSeguro.Log" %>
	<%@ Import Namespace="Uol.PagSeguro.Resources" %>
	<%@ Import Namespace="System.Web.Security" %>
		

		<%
			string comando = "";
			if (Request.Form.Count > 0)
			{
				comando = Request.Form["cmdpost"].ToString();
				if (comando == "SAVE")
				{
					//PagSeguroConfiguration.UrlXmlConfiguration = Server.MapPath("PagSeguroConfig.xml");
					
					AccountCredentials Credencial = PagSeguroConfiguration.Credentials(false);


					//string transactionCode = "7FC75C3D-0551-42B6-A258-F6FA76412D7E";
					//Transaction transaction = TransactionSearchService.SearchByCode(
					//	Credencial,
					//	transactionCode
					//);

					//AccountCredentials credentials = PagSeguroConfiguration.Credentials(false);

					PaymentRequest payment = new PaymentRequest();

					payment.AddParameter("encoding", "utf-8");
					string pturma = Request.Cookies["turma"].Value.ToString();
					Double valor = 5;
					payment.Items.Add(new Item("0001",
												 "CURSO FERNANDA PESSOA - PORTUGUES EXTENSIVO TURMA " + pturma,
													   1,
										Convert.ToDecimal(valor.ToString().Replace("R$", "").Trim())));

					string pFone1 = "";
					if (pFone1.Length >= 13)
					{
						pFone1 = pFone1.Substring(4, 9).Replace("-", "");
					}
					else
						pFone1 = "";
					String pNome = Request.Cookies["nome_resp"].Value.ToString();
					String pEmail = Request.Cookies["email_resp"].Value.ToString();
					String pCPF = Request.Cookies["cpf_resp"].Value.ToString();
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

					//payment.RedirectUri = new Uri("http://totvs.faintvisa.com.br/conic/retorno.aspx");
					payment.Reference = pCPF;


					Uri paymentRedirectUri = payment.Register(Credencial);

					Response.Redirect(paymentRedirectUri.ToString());


				}
			}

			%>
		<div class="container">
		<div class="container-fluid">
<div class="row" runat="server">
                    <div class="col-md-12" runat="server">
                        <div class="card card-body printableArea">
                            <h3><b>PEDIDO Nº</b> <span class="float-right">#5669626</span></h3>
                            
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="float-left">
                                        <address>
                                            <h3> &nbsp;<b class="text-danger">Curso Fernanda Pessoa</b></h3>
                                            <p class="text-muted ml-1">Rua benfica, 505
                                                <br/>Derby,
                                                <br/> Recife-PE,
                                                <br/> Fone - (81)0000-0000</p>
                                        </address>
                                    </div>
                                    <div class="float-right text-right">
                                        <address>
                                            <h3>Pagador,</h3>
                                            <h4 class="font-bold">Cliente: CLEISON SALUSTIANO DA SILVA ,</h4>
                                            <p class="text-muted ml-4">CPF: 051.353.834-84
                                            <p class="mt-4"><b>Data :</b> <i class="fa fa-calendar"></i> 23rd Jan 2019</p>
                                        </address>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="table-responsive mt-5" style="clear: both;">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th>Descrição</th>
                                                    <th class="text-right">Quantidade</th>
                                                    <th class="text-right">Preço</th>
                                                    <th class="text-right">Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="text-center">1</td>
                                                    <td>PORTUGUÊS EXTENSIVO</td>
                                                    <td class="text-right">1 </td>
                                                    <td class="text-right"> R$ 320,00 </td>
                                                    <td class="text-right"> R$ 320,00 </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-12" runat="server">
                                    <div class="float-right mt-4 text-right">
                                        <h3><b>Total :</b> R$ 320,00</h3>
                                    </div>
                                    <div class="clearfix"></div>
                                    
                                    <div class="text-right" runat="server">
										<button type="submit" class="btn btn-success" name="cmdpost" value="SAVE">Efetuar pagamento</button>
                                        <button id="print" class="btn btn-default btn-outline" type="button"> <span><i class="fa fa-print"></i> Print</span> </button>
										
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
           </div>                
       </div>
  </div>

			
    </form>
	

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

	
		<p>
			&nbsp;</p>

	


	<script type='text/javascript'>var s=document.createElement('script');s.type='text/javascript';var v=parseInt(Math.random()*1000000);s.src='https://sandbox.gerencianet.com.br/v1/cdn/d332f6db39c4739cfcfbef95290456b3/'+v;s.async=false;s.id='d332f6db39c4739cfcfbef95290456b3';if(!document.getElementById('d332f6db39c4739cfcfbef95290456b3')){document.getElementsByTagName('head')[0].appendChild(s);};$gn={validForm:true,processed:false,done:{},ready:function(fn){$gn.done=fn;}};</script>
	<script>
		$gn.ready(function(checkout) {
 
  var callback = function(error, response) {
    if(error) {
      // Trata o erro ocorrido
      console.error(error);
    } else {
      // Trata a resposta
      console.log(response);
    }
  };
 
  checkout.getPaymentToken({
    brand: 'visa', // bandeira do cartão
    number: '4012001038443335', // número do cartão
    cvv: '123', // código de segurança
    expiration_month: '05', // mês de vencimento
    expiration_year: '2018' // ano de vencimento
  }, callback);
 
		});

		$gn.ready(function(checkout){
 
  checkout.getInstallments(50000,'visa', function(error, response){
    if(error) {
      // Trata o erro ocorrido
      console.log(error);
    } else {
      // Insere o parcelamento no site
    }
  });
 
});

	</script>
</body>

</html>
