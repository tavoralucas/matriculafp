<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="relatorios.aspx.cs" Inherits="esmeraldino.relatorios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">
	<form id="form1" runat="server" class="form-horizontal">
   <%@ Import Namespace="MySql.Data.MySqlClient" %>
	
<div class="container-fluid">

<div class="row">

<div class="col-md-12">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Vincular Pessoas</h3>
                            
                            
                                              <div class="form-group">

                                                    <label for="txtregiao">Micro região</label>
                                                    <select class="custom-select form-control" id="txtregiao" name="txtregiao">
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection conn = new MySqlConnection("server=127.0.0.1;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select * from REGIAO order by DESCRICAO";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();
		  Response.Write("<option value=''>Selecione</option>");

		  while (dados.Read())
		  {
			  Response.Write("<option value='" + dados["ID"].ToString() + "'>" + dados["DESCRICAO"].ToString() + "</option>");

		  }
		  conn.Close();

       %>

                                                        
               </select>
											    
											  </div>

							<div class="form-group">
                                                    <label for="txtcidade">Cidade</label>
                                                    <input type="text" class="form-control" id="txtcidade" name="txtcidade" >
                                                </div>

							<div class="form-group">
                                                    <label for="txtnome">Nome</label>
                                                    <input type="text" class="form-control" id="txtnome" name="txtnome" >
                                                </div>


                                              

                                <div class="form-group m-b-0">
                                    <div class="offset-sm-3 col-sm-9">
                                        <button type="submit" class="btn btn-info waves-effect waves-light m-t-10" name="cmdpost" value="FIND">Pesquisar</button>
                                        <button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse waves-effect waves-light m-t-10" name="cmdpost" value="VOLTAR">Voltar</button>
									
                                    </div>
                                </div>
							</div>

								
                                </div>
	<div class="col-md-12">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Relatórios</h3>



	

							<div class="table-responsive m-t-40">
                                    <table id="report" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th></th>
											
                                            </tr>
                                        </thead>


                                        <tbody>
											
											   
      
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection connD = new MySqlConnection("server=127.0.0.1;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  connD.Open();
		  MySqlCommand sqlConsultaD = new MySqlCommand();
		  sqlConsultaD.Connection = connD;
		  string sqlRegiao = "";
		  string sqlCidade = "";
		  string sqlNome = "";
		  if (Request.Form.Count > 0)
		  {
			  if (!string.IsNullOrEmpty(Request.Form["txtregiao"]))
			{
				sqlRegiao = " AND REGIAO.ID="+Request.Form["txtregiao"].ToString()+"";


			}

			  if (!string.IsNullOrEmpty(Request.Form["txtcidade"]))
			{
				sqlCidade = " AND upper(CIDADE) LIKE '"+Request.Form["txtregiao"].ToString().ToUpper()+"%'";


			}


			  if (!string.IsNullOrEmpty(Request.Form["txtnome"]))
			{
				sqlNome = " AND upper(NOME) LIKE '"+Request.Form["txtnome"].ToString().ToUpper()+"%'";


			}

		  }

		  sqlConsultaD.CommandText = "Select REGIAO.DESCRICAO AS REGIAO,CARGOS.DESCRICAO AS CARGO,COLIGADO.ID,COLIGADO.NOME,COLIGADO.APELIDO,"+
			  "COLIGADO.CIDADE,COLIGADO.FUNCAO,COLIGADO.ENDERECO,COLIGADO.NUMERO,COLIGADO.COMPLEMENTO,COLIGADO.FONE1,COLIGADO.FONE2,COLIGADO.EMAIL,COLIGADO.CEP,COLIGADO.UF,COLIGADO.BAIRRO"+
			  " from COLIGADO,REGIAO,CARGOS where COLIGADO.ID_REGIAO=REGIAO.ID AND COLIGADO.ID_CARGO=CARGOS.ID"+sqlRegiao+sqlCidade+sqlNome+" order by NOME ";
		  MySqlDataReader dadosD = sqlConsultaD.ExecuteReader();

		  if (!dadosD.HasRows)
		  {
			  Response.Write("<tr>");
			  Response.Write("<td>0</td>");
			  Response.Write("<td>NENHUM REGISTRO</td>");
			  Response.Write("</tr>");

		  }

		  while (dadosD.Read())
		  {


			  Response.Write("<tr>");

			  Response.Write("<td>");

			  Response.Write("<div class='d-flex flex-row'>");
			  Response.Write("<div class=''><img src='fotos/FT"+dadosD["ID"].ToString()+".jpg' alt='user' class='img-circle' width='100'></div>");
			  Response.Write("<div class='p-l-20'>");
			  Response.Write("<h3 class='font-medium'>"+dadosD["NOME"].ToString()+"</h3> ");
			  Response.Write("<h6>("+dadosD["APELIDO"].ToString()+" - "+dadosD["CARGO"].ToString()+")</h6> ");
			  Response.Write("<h5>"+dadosD["ENDERECO"].ToString()+", "+dadosD["NUMERO"].ToString()+" "+dadosD["COMPLEMENTO"].ToString()+"</h5> ");
			  Response.Write("<h5>"+dadosD["BAIRRO"].ToString()+", "+dadosD["CIDADE"].ToString()+" "+dadosD["UF"].ToString()+"</h5> ");
			  Response.Write("<h5>"+dadosD["FONE1"].ToString()+", "+dadosD["FONE2"].ToString()+" "+dadosD["EMAIL"].ToString()+"</h5> ");
			  Response.Write("</div>");
			  Response.Write("</div>");

			  Response.Write("</td>");
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
