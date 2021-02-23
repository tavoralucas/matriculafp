<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="historico.aspx.cs" Inherits="esmeraldino.historico" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">

	<form id="form1" runat="server" class="form-horizontal" method="post">
   <%@ Import Namespace="MySql.Data.MySqlClient" %>
	<%
		String comandogeral = "";
		String sCODIGO = "";



		if (Request.QueryString.Count > 0)
		{

			comandogeral = Request.QueryString["cmd"].ToString();
			sCODIGO = Request.QueryString["id"].ToString();

		}
		if (Request.Form.Count> 0)
		{

			string comando = Request.Form["cmdpost"].ToString();
			if ((comando == "SAVE") &&(comandogeral=="edit"))
			{

				String usuario = "";
				if (Request.Cookies["usuario"] != null)
					usuario = Server.HtmlEncode(Request.Cookies["usuario"].Value);

				String sData = "";

				if (!string.IsNullOrEmpty(Request.Form["txtdata"]))
				{
					sData = Request.Form["txtdata"].ToString();
					DateTime dDataNasc = Convert.ToDateTime(sData);
					sData = dDataNasc.ToString("yyyy-MM-dd HH:mm:ss");

				}
				String tipo = "";
				if (!string.IsNullOrEmpty(Request.Form["cbxtipo"]))
				{
					tipo = Request.Form["cbxtipo"].ToString();

				}

				String solicitacao = "";
				if (!string.IsNullOrEmpty(Request.Form["cbxsolicitacao"]))
				{
					solicitacao = Request.Form["cbxsolicitacao"].ToString();

				}

				String assunto = "";
				if (!string.IsNullOrEmpty(Request.Form["txtassunto"]))
				{
					assunto = Request.Form["txtassunto"].ToString();

				}

				MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlinsert = new MySqlCommand();
				sqlinsert.Connection = connin;
				connin.Open();
				sqlinsert.CommandText = "insert into HISTORICO (DATA,ID_COLIGADO,USUARIO,TIPO,SOLICITACAO,HISTORICO,DATA_INCLUSAO) "+
					" values ('"+sData+"',"+sCODIGO+",'"+usuario+"','"+tipo+"','"+solicitacao+"','"+assunto+"',current_Date)";
				int result = sqlinsert.ExecuteNonQuery();
				connin.Close();
				Response.Redirect("consulta.aspx");
			}

		}

		%>
<div class="container-fluid">

<div class="row">


	<div class="col-md-6">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Histórico</h3>
                            
                                                     <div class="form-group">
                                                    <label for="cbxtipo">TIPO HISTÓRICO</label>
                                                    
													   <select class="custom-select form-control" id="cbxtipo" name="cbxtipo" >
                                                        <option value="">Selecione</option>
                                                        <option value="Presencial">Presencial</option>
                                                        <option value="Telefônico">Telefônico</option>
														<option value="Outros">Outros</option>
                                                    </select>

                                                </div>

                                              <div class="form-group">
                                                    <label for="cbxsolicitacao">TIPO SOLICITAÇÃO</label>
                                                    
													   <select class="custom-select form-control" id="cbxsolicitacao" name="cbxsolicitacao" >
                                                        <option value="">Selecione</option>
                                                        <option value="Neutro">Neutro</option>
                                                        <option value="Urgente">Urgente</option>
														<option value="Moderado">Moderado</option>
                                                    </select>

                                                </div>

                                                <div class="form-group">
                                                    <label for="txtdata">Data</label>
													<input type="text" placeholder="" data-mask="99/99/9999" class="form-control" id="txtdata" name="txtdata">
                                                    
												</div> 

							         <div class="form-group">
                                    <label>Assunto</label>
                                    <textarea class="form-control" rows="5" name="txtassunto" id="txtassunto"></textarea>
                                </div>


                                <div class="form-group m-b-0">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button type="submit" class="btn btn-info waves-effect waves-light m-t-10" name="cmdpost" value="SAVE">Salvar</button>
                                        <button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse waves-effect waves-light m-t-10" name="cmdpost" value="CANCEL">Cancelar</button>
									
                                    </div>
                                </div>
							</div>

								
                                </div>



	<div class="col-md-6">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Consulta</h3>
                            
                                

                               
                                
                                
                                <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
												<th>#</th>
												<th>Data</th>
												<th>Usuário</th>
                                                <th>Tipo Sol.</th>
												<th>Solicitação</th>
												<th>Histórico</th>
												
                                            </tr>
                                        </thead>


                                        <tbody>
											   
      
      <%  
		  Response.ContentType="text/HTML";
		  		String sCODIGO2 = "";
		


		if (Request.QueryString.Count > 0)
		{

			
			sCODIGO2 = Request.QueryString["id"].ToString();

		}

		  MySqlConnection conn = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select *,'VAZIO' from HISTORICO WHERE ID_COLIGADO="+sCODIGO2+" order by DATA";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();
		  if (!dados.HasRows)
		  {
			  Response.Write("<tr>");
			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-8' href='cargo.aspx?cmd=new'><i class='fa fa-file'></i> <span class='tooltip-content2'>Novo</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-7' href='cargo.aspx?cmd=new'><i class='fa fa-edit'></i> <span class='tooltip-content2'>Alterar</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
							 "  </td>");


			  Response.Write("<td>0</td>");
			  Response.Write("<td>NENHUM REGISTRO</td>");

			  Response.Write("</tr>");

		  }
		  while (dados.Read())
		  {
			  Response.Write("<tr>");


			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-6'href='excluir.aspx?page=historico&cmd=HISTORICO&id="+dados["ID"].ToString()+"' ><i class='fa fa-times'></i><span class='tooltip-content2'>Excluir</span> </a></p>"+
							 " "+
							 "  </td>");


			  Response.Write("<td>"+dados["DATA"].ToString()+"</td>");
			  Response.Write("<td>"+dados["USUARIO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["TIPO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["SOLICITACAO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["HISTORICO"].ToString()+"</td>");

			  Response.Write("</tr>");


		  }
		  conn.Close();

       %>

                                        </tbody>
                                    </table>
                                </div>
                                                         


							</div>

								
                                </div>



                        
                    </div>
	</div>


</form>


</asp:Content>
