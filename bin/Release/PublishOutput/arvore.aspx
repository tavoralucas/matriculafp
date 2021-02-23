<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="arvore.aspx.cs" Inherits="esmeraldino.arvore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">

	<form id="form1" runat="server" class="form-horizontal">

   <%@ Import Namespace="MySql.Data.MySqlClient" %>

		<%
			String vID = "";
			String comandogeral = "";
			String NOME = "";
			if (Request.QueryString.Count > 0)
			{
				comandogeral = Request.QueryString["cmd"].ToString();
			
				if (!string.IsNullOrEmpty(Request.QueryString["id"]))
				{
					vID = Request.QueryString["id"].ToString();
									MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlconsulta = new MySqlCommand();
				sqlconsulta.Connection = connin;
				connin.Open();
				sqlconsulta.CommandText = "Select NOME from COLIGADO where ID=" + vID;
				MySqlDataReader result = sqlconsulta.ExecuteReader();
				result.Read();
				NOME = result["NOME"].ToString();
				connin.Close();

				}
				else
				{
					vID = "0";
				}
			}



			%>
		
	
	
<div class="container-fluid">

<div class="row">


	<div class="col-md-12">
<div class="card">
	                                           
                    

	
								<div class="form-group row">
                                    <div class="card-block">
										<ol class="breadcrumb bc-colored m-b-30 bg-warning">
                                <h3>Pessoas Vinculadas à <%=NOME %></h3>

                                </ol>
                                
																		
                                <div class="table-responsive m-t-40">
                                    <table id="example24 class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
												<th>Região</th>
                                                <th>#</th>
												<th>Vínculo</th>
												<th>Nome</th>
												<th>Apelido</th>
												<th>Cargo</th>
												<th>Função</th>
												<th>Cidade</th>
												
                                            </tr>
                                        </thead>


                                        <tbody>
											   
      
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection conn2 = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn2.Open();
		  MySqlCommand sqlConsulta2 = new MySqlCommand();
		  sqlConsulta2.Connection = conn2;
		  sqlConsulta2.CommandText = "Select REGIAO.DESCRICAO AS REGIAO,CARGOS.DESCRICAO AS CARGO,COLIGADO.ID,COLIGADO.NOME,COLIGADO.APELIDO,"+
			  "COLIGADO.CIDADE,COLIGADO.FUNCAO,ARVORE.VINCULO,ARVORE.SUBVINCULO"+
			  " from COLIGADO,REGIAO,CARGOS,ARVORE where COLIGADO.ID_REGIAO=REGIAO.ID AND COLIGADO.ID_CARGO=CARGOS.ID "+
			  " and ARVORE.ID_FILHO=COLIGADO.ID AND ARVORE.ID_COLIGADO="+vID+" order by COLIGADO.NOME ";
		  MySqlDataReader dados2 = sqlConsulta2.ExecuteReader();

		  if (!dados2.HasRows)
		  {
			  Response.Write("<tr>");



			  Response.Write("<td>0</td>");
			  Response.Write("<td>NENHUM REGISTRO</td>");

			  Response.Write("</tr>");

		  }

		  while (dados2.Read())
		  {
			  Response.Write("<tr>");
			  string vinculo = "";
			  if (dados2["VINCULO"].ToString().ToUpper() == "FAMILIAR")
			  {
				  vinculo = "<span class='label label-danger'>" + dados2["VINCULO"].ToString() + "</span> ";
			  }
			  else
			  if (dados2["VINCULO"].ToString().ToUpper() == "ALIADO")
			  {
				  vinculo = "<span class='label label-info'>" + dados2["VINCULO"].ToString() + "</span> ";
			  }
			  else
			  if (dados2["VINCULO"].ToString().ToUpper() == "ACESSOR")
			  {
				  vinculo = "<span class='label label-inverse'>" + dados2["VINCULO"].ToString() + "</span> ";
			  }
			  else
			  {
				  vinculo = "<span class='label label-warning'>" + dados2["VINCULO"].ToString() + "</span> ";
			  }



			  Response.Write("<td>"+dados2["REGIAO"].ToString()+"</td>");
			  			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-6'href='excluir.aspx?page=consulta&cmd=ARVORE&idfilho="+dados2["ID"].ToString()+"&id="+vID+"' ><i class='fa fa-times'></i><span class='tooltip-content2'>Excluir</span> </a></p>"+
							 " "+
							 "  </td>");

			  Response.Write("<td>"+vinculo+"</td>");


			  Response.Write("<td> <a href='fotos/FT"+dados2["ID"].ToString()+".jpg' target='_blank'><img src='fotos/FT"+dados2["ID"].ToString()+".jpg' alt='user' width='40' class='img-circle' /> "+dados2["NOME"].ToString()+"</a> </td>");
			  //Response.Write("<td>"+dados["NOME"].ToString()+"</td>");
			  Response.Write("<td>"+dados2["APELIDO"].ToString()+"</td>");
			  Response.Write("<td>"+dados2["CARGO"].ToString()+"</td>");
			  Response.Write("<td>"+dados2["FUNCAO"].ToString()+"</td>");
			  Response.Write("<td>"+dados2["CIDADE"].ToString()+"</td>");

			  Response.Write("</tr>");


		  }
		  conn2.Close();

       %>

                                        </tbody>
                                    </table>
                                </div>
                             </div>
                                </div>
				 </div>
                        </div>


<div class="col-md-12">
<div class="card">
	                                           
                    

	
								<div class="form-group row">
                                    <div class="card-block">
                                <nav class="breadcrumb">
                                <h3>Consultar Pessoas</h3>

                                </nav>

                                
																		
                                <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
												<th>Região</th>
												<th> </th>
												<th>Nome</th>
												<th>Apelido</th>
												<th>Cargo</th>
												<th>Função</th>
												<th>Cidade</th>
												
                                            </tr>
                                        </thead>


                                        <tbody>
											   
      
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection conn = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select REGIAO.DESCRICAO AS REGIAO,CARGOS.DESCRICAO AS CARGO,COLIGADO.ID,COLIGADO.NOME,COLIGADO.APELIDO,"+
			  "COLIGADO.CIDADE,COLIGADO.FUNCAO"+
			  " from COLIGADO,REGIAO,CARGOS where COLIGADO.ID_REGIAO=REGIAO.ID AND COLIGADO.ID_CARGO=CARGOS.ID order by NOME ";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();

		  if (!dados.HasRows)
		  {
			  Response.Write("<tr>");
			  Response.Write("<td>"+
							 "  </td>");



			  Response.Write("<td>0</td>");
			  Response.Write("<td>NENHUM REGISTRO</td>");

			  Response.Write("</tr>");

		  }

		  while (dados.Read())
		  {
			  Response.Write("<tr>");
			  Response.Write("<td>"+dados["REGIAO"].ToString()+"</td>");
			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-7' href='arvoreincluir.aspx?cmd=incluir&idfilho="+dados["ID"].ToString()+"&id="+vID+"'><i class='fa fa-arrow-circle-o-up'></i> <span class='tooltip-content2'>Vincular</span></a></p>"+
							 "  </td>");





			  Response.Write("<td> <a href='fotos/FT"+dados["ID"].ToString()+".jpg' target='_blank'><img src='fotos/FT"+dados["ID"].ToString()+".jpg' alt='user' width='40' class='img-circle' /> "+dados["NOME"].ToString()+"</a> </td>");
			  //Response.Write("<td>"+dados["NOME"].ToString()+"</td>");
			  Response.Write("<td>"+dados["APELIDO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["CARGO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["FUNCAO"].ToString()+"</td>");
			  Response.Write("<td>"+dados["CIDADE"].ToString()+"</td>");

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



	

                    </div>
	

</div>
</form>


</asp:Content>
