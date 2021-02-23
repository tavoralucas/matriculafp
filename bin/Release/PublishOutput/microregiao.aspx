<%@ Page Title="" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="microregiao.aspx.cs" Inherits="esmeraldino.site.microregiao" %>

<asp:Content ID="Content" ContentPlaceHolderID="contentmain" runat="server">

<form id="form1" runat="server" class="form-horizontal">
   <%@ Import Namespace="MySql.Data.MySqlClient" %>
	<%
		String comandogeral = "";
		String sCODIGO = "";
		String pCODIGO = "";
		String sDESCRICAO = "";
		if (Request.QueryString.Count > 0)
		{

			comandogeral = Request.QueryString["cmd"].ToString();
			if (comandogeral == "edit")
			{
				sCODIGO = Request.QueryString["ID"].ToString();
				MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlconsulta = new MySqlCommand();
				sqlconsulta.Connection = connin;
				connin.Open();
				sqlconsulta.CommandText = "Select DESCRICAO from REGIAO where ID=" + sCODIGO;
				MySqlDataReader result = sqlconsulta.ExecuteReader();
				result.Read();
				sDESCRICAO = result["DESCRICAO"].ToString();
				connin.Close();
				
			}
		}
		if (Request.Form.Count> 0)
		{
			string comando = Request.Form["cmdpost"].ToString();
			if ((comando == "SAVE") &&(comandogeral=="new"))
			{
				String pDESCRICAO = Request.Form["txtdescricao"].ToString();
				MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlinsert = new MySqlCommand();
				sqlinsert.Connection = connin;
				connin.Open();
				sqlinsert.CommandText = "insert into REGIAO (DESCRICAO) values ('" + pDESCRICAO + "')";
				int result = sqlinsert.ExecuteNonQuery();
				connin.Close();
				Response.Redirect("microregiaoconsulta.aspx");
			}

			if ((comando == "SAVE") &&(comandogeral=="edit"))
			{
				String pDESCRICAO = Request.Form["txtdescricao"].ToString();
				MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlinsert = new MySqlCommand();
				sqlinsert.Connection = connin;
				connin.Open();
				sqlinsert.CommandText = "update REGIAO set DESCRICAO='" + pDESCRICAO + "' where ID="+sCODIGO;
				int result = sqlinsert.ExecuteNonQuery();
				connin.Close();
				Response.Redirect("microregiaoconsulta.aspx");
			}

		}

		%>
<div class="container-fluid">

<div class="row">

<div class="col-md-6">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Cadastro de microregião</h3>
                            
                            
                                <div class="form-group row">
                                    <label for="txtcodigo" class="col-sm-3 text-right control-label col-form-label"> Código*</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="txtcodigo" placeholder="Código" Disabled value="<%=sCODIGO%>">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtdescricao" class="col-sm-3 text-right control-label col-form-label">Descrição*</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" name="txtdescricao" id="txtdescricao" placeholder="Descrição" value="<%=sDESCRICAO %>">
                                    </div>
                                </div>
                                <div class="form-group m-b-0">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button type="submit" class="btn btn-info waves-effect waves-light m-t-10" name="cmdpost" value="SAVE">Salvar</button>
                                        <button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse waves-effect waves-light m-t-10" name="cmdpost" value="CANCEL">Cancelar</button>
									
                                    </div>
                                </div>
							</div>

								
                                </div>



                        
                    </div>
	</div>


</form>

</asp:Content>
