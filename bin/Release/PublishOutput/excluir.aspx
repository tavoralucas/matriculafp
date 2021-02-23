<%@ Page Title="" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="excluir.aspx.cs" Inherits="esmeraldino.site.excluir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">
	   <%@ Import Namespace="MySql.Data.MySqlClient" %>

	<%

		if (Request.Form.Count > 0)
		{
			string page = "";
			if (Request.QueryString.Count > 0)
			{
				page = Request.QueryString["page"].ToString();
			}
			string cmd = Request.Form["btnresult"].ToString();
			if (cmd == "OK")
			{
				String tabela = Request.QueryString["cmd"].ToString();
				String pID = Request.QueryString["ID"].ToString();
				if (tabela == "ARVORE")
				{
					String pIDFILHO = Request.QueryString["IDFILHO"].ToString();
					MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
					MySqlCommand sqldel = new MySqlCommand();
					sqldel.Connection = connin;
					connin.Open();
					sqldel.CommandText = "delete from " + tabela + " where ID_COLIGADO=" + pID+ " AND ID_FILHO="+pIDFILHO;
					int result = sqldel.ExecuteNonQuery();
					connin.Close();
					Response.Redirect("arvore.aspx?cmd=edit&id="+pID);

				}
				else
				{
					MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
					MySqlCommand sqldel = new MySqlCommand();
					sqldel.Connection = connin;
					connin.Open();
					sqldel.CommandText = "delete from " + tabela + " where ID=" + pID;
					int result = sqldel.ExecuteNonQuery();
					connin.Close();
					Response.Redirect(page + ".aspx");
				}
			}

		}

		%>
	<div class="row">
                    <div class="col-md-6">
                        
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <blockquote>
									<form method="post">
                                        <div class="form-group">
                                        
											<h2>Comfirma exclusão do registro?</h2>
                                        

                                        </div>
                                        <button type="submit" class="btn btn-success waves-effect waves-light m-r-10" name="btnresult" value="OK">Confirmar</button>
                                        <button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse waves-effect waves-light" name="btnresult" value="CANCEL">Cancelar	</button>
                                    </form>
								</blockquote>
                                </div>
                            </div>
                    </div>
</div>

</asp:Content>
