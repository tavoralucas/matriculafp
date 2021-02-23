<%@ Page Title="" Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="microregiaoconsulta.aspx.cs" Inherits="esmeraldino.site.microregiaoconsulta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">


	

	<form id="form1" runat="server" class="form-horizontal">

   <%@ Import Namespace="MySql.Data.MySqlClient" %>


		
	
	
<div class="container-fluid">

<div class="row">

<div class="col-md-6">

	                                           
                    

	
								<div class="form-group row">
                                    <div class="card-block">
                                
                                
                                <div class="table-responsive m-t-40">
                                    <table id="example23" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
												<th>#</th>
												<th>#</th>
												<th>#</th>
												<th>Código</th>
                                                <th>Descrição</th>
												
                                            </tr>
                                        </thead>


                                        <tbody>
											   
      
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection conn = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select * from REGIAO order by DESCRICAO";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();

		  if (!dados.HasRows)
		  {
			  Response.Write("<tr>");
			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-8' href='microregiao.aspx?cmd=new'><i class='fa fa-file'></i> <span class='tooltip-content2'>Novo</span></a></p>"+
							 "  </td>");

			  Response.Write("<td>"+
							 "<p><a class='mytooltip tooltip-effect-7' href='microregiao.aspx?cmd=new'><i class='fa fa-edit'></i> <span class='tooltip-content2'>Alterar</span></a></p>"+
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
				             "<p><a class='mytooltip tooltip-effect-8' href='microregiao.aspx?cmd=new'><i class='fa fa-file'></i> <span class='tooltip-content2'>Novo</span></a></p>"+ 
				             "  </td>"); 

			  Response.Write("<td>"+
				             "<p><a class='mytooltip tooltip-effect-7' href='microregiao.aspx?cmd=edit&id="+dados["ID"].ToString()+"'><i class='fa fa-edit'></i> <span class='tooltip-content2'>Alterar</span></a></p>"+ 
				             "  </td>");

			  Response.Write("<td>"+ 
				             "<p><a class='mytooltip tooltip-effect-6'href='excluir.aspx?page=microregiaoconsulta&cmd=REGIAO&id="+dados["ID"].ToString()+"' ><i class='fa fa-times'></i><span class='tooltip-content2'>Excluir</span> </a></p>"+
							 " "+
				             "  </td>");


			  Response.Write("<td>"+dados["ID"].ToString()+"</td>");
			  Response.Write("<td>"+dados["DESCRICAO"].ToString()+"</td>");

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
</form>

	
</asp:Content>
