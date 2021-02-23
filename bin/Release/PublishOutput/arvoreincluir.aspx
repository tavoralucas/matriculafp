<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="arvoreincluir.aspx.cs" Inherits="esmeraldino.arvoreincluir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">
<form id="form1" runat="server" class="form-horizontal">
   <%@ Import Namespace="MySql.Data.MySqlClient" %>
	<%
		String comandogeral = "";
		String sCODIGO = "";
		String sCODIGOFILHO = "";
		
		String sDESCRICAO = "";
		if (Request.QueryString.Count > 0)
		{

			comandogeral = Request.QueryString["cmd"].ToString();
  		    sCODIGO = Request.QueryString["id"].ToString();
			sCODIGOFILHO = Request.QueryString["idfilho"].ToString();
		}
		if (Request.Form.Count> 0)
		{
			
			string comando = Request.Form["cmdpost"].ToString();
			if ((comando == "SAVE") &&(comandogeral=="incluir"))
			{
				String vVinculo = Request.Form["cbxvinculo"].ToString();
				String vSubVinculo = Request.Form["cbxvinculof"].ToString();
				MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
				MySqlCommand sqlinsert = new MySqlCommand();
				sqlinsert.Connection = connin;
				connin.Open();
				sqlinsert.CommandText = "insert into ARVORE (ID_COLIGADO,ID_FILHO,VINCULO,SUBVINCULO,DATA_INCLUSAO) "+
					" values ("+sCODIGO+","+sCODIGOFILHO+",'"+vVinculo+"','"+vSubVinculo+"',current_Date)";
				int result = sqlinsert.ExecuteNonQuery();
				connin.Close();
				Response.Redirect("arvore.aspx?cmd=edit&id="+sCODIGO);
			}

		}

		%>
<div class="container-fluid">

<div class="row">

<div class="col-md-6">
                        <div class="card card-block">
                            <h3 class="box-title m-b-0">Vincular Pessoas</h3>
                            
                            
                                              <div class="form-group">
                                                    <label for="cbxSexo">Vínculo</label>
                                                    
													   <select class="custom-select form-control" id="cbxvinculo" name="cbxvinculo" >
                                                        <option value="">Selecione</option>
                                                        <option value="Acessor">Acessor</option>
                                                        <option value="Aliado">Aliado</option>
														<option value="Familiar">Familiar</option>
                                                    </select>

                                                </div>

                                              <div class="form-group">
                                                    <label for="cbxSexo">Vínculo Familiar</label>
                                                    
													   <select class="custom-select form-control" id="cbxvinculof" name="cbxvinculof" >
                                                        <option value="">Selecione</option>
														<option value="Mulher">Mulher</option>
                                                        <option value="Marido">Marido</option>
                                                        <option value="Irmão">Irmão</option>
                                                        <option value="Pai">Pai</option>
														<option value="Mãe">Mãe</option>
														<option value="Mãe">Filho(a)</option>
														<option value="Tio(a)">Tio(a)</option>
														<option value="Primo(a)">Primo(a)</option>
														<option value="Sobrinho(a)">Sobrinho(a)</option>
														<option value="Neto(a)">Neto(a)</option>
														<option value="Avô(ó)">Avô(ó)</option>
                                                    </select>

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
