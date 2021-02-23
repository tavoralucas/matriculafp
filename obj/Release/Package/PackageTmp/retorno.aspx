<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="retorno.aspx.cs" Inherits="Simulado.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <style type="text/css">


        .style1
        {
            width: 658px;
            font-size: medium;
        }
        .style2
        {
            border-width: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <img alt="" class="style2" src="img/banner.png" /><br />
        <br />
        Sua transação com o <strong>pagseguro</strong> foi realizada com sucesso!
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/matricula.aspx">Voltar</asp:HyperLink>
    &nbsp;</form>
</body>
</html>
