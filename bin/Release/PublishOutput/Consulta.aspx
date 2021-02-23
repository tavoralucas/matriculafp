<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="esmeraldino.Consulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">

	<form id="form1" runat="server" class="form-horizontal">

   <%@ Import Namespace="MySql.Data.MySqlClient" %>


		
	
	
<div class="container-fluid">

<div class="row">

<div class="col-md-12">
<div class="card">
	                                           
                    

	
								<div class="form-group row">
                                    <div class="card-block">
                                
                                <p><a class="mytooltip tooltip-effect-8" href="coligado.aspx?cmd=new"><i class="fa fa-file">Incluir Novo</i> <span class="tooltip-content2">Incluir Novo</span></a></p>
								
                                <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
												<th>Região</th>
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
							 "<p><a class='mytooltip tooltip-effect-8' href='coligado.aspx?cmd=new'><i class='fa fa-file'></i> <span class='tooltip-content2'>Novo</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-7' href='coligado.aspx?cmd=new'><i class='fa fa-edit'></i> <span class='tooltip-content2'>Alterar</span></a></p>"+
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
			  Response.Write("<td>"+dados["ID"].ToString()+"</td>");
			  Response.Write("<td>"+
				  
							 "<p><a class='mytooltip tooltip-effect-7' href='historico.aspx?cmd=edit&id="+dados["ID"].ToString()+"'><i class='fa fa-history'></i> <span class='tooltip-content2'>Histórico</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
				  
							 "<p><a class='mytooltip tooltip-effect-7' href='arvore.aspx?cmd=edit&id="+dados["ID"].ToString()+"'><i class='fa fa-arrows'></i> <span class='tooltip-content2'>Associar</span></a></p>"+
							 "  </td>");


			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-7' href='coligado.aspx?cmd=edit&id="+dados["ID"].ToString()+"'><i class='fa fa-edit'></i> <span class='tooltip-content2'>Alterar</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-6'href='excluir.aspx?page=Consulta&cmd=COLIGADO&id="+dados["ID"].ToString()+"' ><i class='fa fa-times'></i><span class='tooltip-content2'>Excluir</span> </a></p>"+
							 " "+
							 "  </td>");


			  Response.Write("<td>"+dados["REGIAO"].ToString()+"</td>");
			  
			  
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
