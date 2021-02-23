<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="coligado.aspx.cs" Inherits="esmeraldino.coligado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentmain" runat="server">

	    
			
	                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Cadastro de Pessoas</h4>
                            </div>
								<div class="card-block">
                                <form action="#" class="form-horizontal" enctype="multipart/form-data" runat="server" method="post">


									<%@ Import Namespace="MySql.Data.MySqlClient" %>
									<%@ Import Namespace="System.Data" %>
									<%@ Import Namespace="MySql.Data.Types" %>
									<%@ Import Namespace="System.IO" %>
									<%@ Import Namespace="System.Drawing" %>
							
									
									
									
	<%
		if (!this.IsPostBack)
		{
			DataTable tbArvore = new DataTable();
			tbArvore.Columns.AddRange(new DataColumn[4] { new DataColumn("ID_COLIGADO"), new DataColumn("ID_PAI"), new DataColumn("VINCULO"), new DataColumn("SUBVINCULO") });
			//dt.Rows.Add(1, "John Hammond", "United States");
			ViewState["tbArvore"] = tbArvore;

		}


		String comandogeral = "";
		string comando = "";

		String ID = "";
		String Regiao = "";
		String RegiaoNome = "Selecione";


		String Nome = "";
		String Marcador = "";
		String Apelido = "";
		String DataNasc = "";
		MySqlDateTime vDataNasc = new MySqlDateTime();


		String Sexo = "Selecione";

		String Cargo = "";
		String CargoNome = "Selecione";
		String Funcao = "";
		String Fone1 = "";
		String Fone2 = "";
		String Fone3 = "";
		String Email = "";
		String Cep = "";
		String Endereco = "";
		String Complemento = "";
		String Numero = "";
		String Bairro = "";
		String Cidade = "";
		String UF = "";
		String chkM1 = "";
		String chkM2 = "";
		String chkM3 = "";
		String usuario = "";


		if (Request.QueryString.Count > 0)
		{
			comandogeral = Request.QueryString["cmd"].ToString();
			if (!string.IsNullOrEmpty(Request.QueryString["id"]))
			{
				ID = Request.QueryString["id"].ToString();
			}
			else
			{
				ID = "0";
			}

			MySqlConnection connedit = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
			MySqlCommand sqlConsultaCO = new MySqlCommand();
			sqlConsultaCO.Connection = connedit;
			connedit.Open();
			sqlConsultaCO.CommandText = "Select COLIGADO.*,REGIAO.DESCRICAO AS REGIAO,CARGOS.DESCRICAO AS CARGO from COLIGADO,CARGOS,REGIAO where COLIGADO.ID=" + ID.ToString() +
				" AND COLIGADO.ID_REGIAO=REGIAO.ID AND COLIGADO.ID_CARGO=CARGOS.ID";
			MySqlDataReader dadosCO = sqlConsultaCO.ExecuteReader();
			dadosCO.Read();
			if (dadosCO.HasRows)
			{
				Regiao = dadosCO["ID_REGIAO"].ToString();
				RegiaoNome = dadosCO["REGIAO"].ToString();
				Nome = dadosCO["nome"].ToString();
				Marcador = dadosCO["Marcador"].ToString();
				if (Marcador == "M1")
				{
					chkM1 = "checked";
				}

				if (Marcador == "M2")
				{
					chkM2 = "checked";
				}

				if (Marcador == "M3")
				{
					chkM3 = "checked";
				}

				Apelido = dadosCO["Apelido"].ToString();


				vDataNasc = dadosCO.GetMySqlDateTime("DATA_NASC");
				DataNasc = vDataNasc.Value.ToString("dd/MM/yyyy");

				Sexo = dadosCO["Sexo"].ToString();
				Cargo = dadosCO["ID_CARGO"].ToString();
				CargoNome = dadosCO["CARGO"].ToString();
				Funcao = dadosCO["Funcao"].ToString();
				Fone1 = dadosCO["Fone1"].ToString();
				Fone2 = dadosCO["Fone2"].ToString();
				Fone3 = dadosCO["Fone3"].ToString();
				Email = dadosCO["email"].ToString();
				Cep = dadosCO["cep"].ToString();
				Endereco = dadosCO["endereco"].ToString();
				Numero = dadosCO["Numero"].ToString();
				Complemento = dadosCO["Complemento"].ToString();
				Bairro = dadosCO["Bairro"].ToString();
				Cidade = dadosCO["Cidade"].ToString();
				UF = dadosCO["UF"].ToString();


			}
			connedit.Close();
		}

		if (Request.Form.Count > 0)
		{
			if (Request.Cookies["usuario"] != null)
				usuario = Server.HtmlEncode(Request.Cookies["usuario"].Value);


			comando = Request.Form["cmdpost"].ToString();



			if (!string.IsNullOrEmpty(Request.Form["txtregiao"]))
			{
				Regiao = Request.Form["txtregiao"].ToString();


			}

			if (!string.IsNullOrEmpty(Request.Form["txtmarcador"]))
			{
				Marcador = Request.Form["txtmarcador"].ToString();

			}


			if (!string.IsNullOrEmpty(Request.Form["txtnome"]))
			{
				Nome = Request.Form["txtnome"].ToString();

			}

			if (!string.IsNullOrEmpty(Request.Form["txtapelido"]))
			{
				Apelido = Request.Form["txtapelido"].ToString();

			}

			if (!string.IsNullOrEmpty(Request.Form["txtdata_nasc"]))
			{
				DataNasc = Request.Form["txtdata_nasc"].ToString();
				DateTime dDataNasc = Convert.ToDateTime(DataNasc);
				DataNasc = dDataNasc.ToString("yyyy-MM-dd HH:mm:ss");

			}

			if (!string.IsNullOrEmpty(Request.Form["cbxSexo"]))
			{
				Sexo = Request.Form["cbxSexo"].ToString();

			}

			if (!string.IsNullOrEmpty(Request.Form["cbxcargo"]))
			{
				Cargo = Request.Form["cbxcargo"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfuncao"]))
			{
				Funcao = Request.Form["txtfuncao"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfone1"]))
			{
				Fone1 = Request.Form["txtfone1"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtfone2"]))
			{
				Fone2 = Request.Form["txtfone2"].ToString();
			}
			if (!string.IsNullOrEmpty(Request.Form["txtfone3"]))
			{
				Fone3 = Request.Form["txtfone3"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtemail"]))
			{
				Email = Request.Form["txtemail"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcep"]))
			{
				Cep = Request.Form["txtcep"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtendereco"]))
			{
				Endereco = Request.Form["txtendereco"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtnumero"]))
			{
				Numero = Request.Form["txtnumero"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcomplemento"]))
			{
				Complemento = Request.Form["txtcomplemento"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtbairro"]))
			{
				Bairro = Request.Form["txtbairro"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtcidade"]))
			{
				Cidade = Request.Form["txtcidade"].ToString();
			}

			if (!string.IsNullOrEmpty(Request.Form["txtuf"]))
			{
				UF = Request.Form["txtuf"].ToString();
			}
		}

		if ((comandogeral == "edit") && (comando=="SAVE"))
		{
			MySqlConnection connup = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
			MySqlCommand sqlUpdate = new MySqlCommand();
			sqlUpdate.Connection = connup;
			connup.Open();
			sqlUpdate.CommandText = "Update COLIGADO set ID_REGIAO='" + Regiao + "'," +
			"NOME='" + Nome + "', APELIDO='" + Apelido + "', MARCADOR='" + Marcador + "', DATA_NASC='" + DataNasc + "', SEXO='" + Sexo + "'," +
			"ID_CARGO='" + Cargo + "', FUNCAO='" + Funcao + "', FONE1='" + Fone1 + "', FONE2='" + Fone2 + "', FONE3='" + Fone3 + "', EMAIL='" + Email + "'," +
			"CEP='" + Cep + "', ENDERECO='" + Endereco + "', NUMERO='" + Numero + "', COMPLEMENTO='" + Complemento + "', BAIRRO='" + Bairro + "', CIDADE='" + Cidade + "'," +
			" UF='" + UF+"' where ID="+ID.ToString();

			int result = sqlUpdate.ExecuteNonQuery();
			connup.Close();


			if (Request.Files.Count>0)
			{
				// String ArqFoto = "C:\\fernandaPessoa\\fotos\\170057.jpg";//Request.Form["foto"].ToString();
				//String ArqFoto = Request.Files[0].FileName.ToString();
				//if (System.IO.File.Exists(ArqFoto))

				if (Request.Files[0].InputStream.Length >0)
				{
					System.Drawing.Image fotopessoa = System.Drawing.Image.FromStream(Request.Files[0].InputStream);

					String path = Server.MapPath("fotos");
					string imgPath = Path.Combine(path, "FT" + ID.ToString() + ".jpg");
					fotopessoa.Save(imgPath);
				}

				
			}

			Response.Redirect("consulta.aspx");


		}
		else
		if ((comandogeral == "new") && (comando=="SAVE"))
		{
			MySqlConnection connin = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");
			MySqlCommand sqlinsert = new MySqlCommand();
			sqlinsert.Connection = connin;
			connin.Open();
			sqlinsert.CommandText = "insert into COLIGADO (ID_REGIAO,NOME,APELIDO,MARCADOR,DATA_NASC,SEXO,ID_CARGO,FUNCAO,FONE1,FONE2,FONE3,EMAIL,CEP,ENDERECO,NUMERO,COMPLEMENTO,BAIRRO,CIDADE,UF,DATA_INCLUSAO,USUARIO) "+
				" values ('" + Regiao+ "','"+Nome+"','"+Apelido+"','"+Marcador+"','"+DataNasc+"','"+Sexo+"','"+Cargo+"','"+Funcao+"','"+Fone1+"','"+Fone2+"','"+Fone3+"','"+Email+"','"+Cep+"','"+Endereco+"','"+Numero+"','"+Complemento+"','"+Bairro+"','"+Cidade+"','"+UF+"',CURRENT_DATE,'"+usuario+"')";
			int result = sqlinsert.ExecuteNonQuery();
			connin.Close();



			if (Request.Files.Count>0)
			{
				if (Request.Files[0].InputStream.Length > 0)
				{ 
				System.Drawing.Image fotopessoa = System.Drawing.Image.FromStream(Request.Files[0].InputStream);

					connin.Open();
					sqlinsert.CommandText = "Select Max(ID) as ID from COLIGADO where usuario='" + usuario + "'";
					MySqlDataReader dadosFotoIn = sqlinsert.ExecuteReader();
					dadosFotoIn.Read();
					String path = Server.MapPath("fotos");
					string imgPath = Path.Combine(path, "FT" + dadosFotoIn["ID"].ToString() + ".jpg");
					fotopessoa.Save(imgPath);

					connin.Close();
				}
			}
			Response.Redirect("consulta.aspx");

		}


	%>
	    

                                    <!-- Step 1 -->
                                    
                                    <div class="form-body">
										<h3 class="box-title">Dados Pessoais</h3>
										<hr class="m-t-0 m-b-40">
										<div class="row">

  										    <div class="col-md-6">
                                            <div class="form-group">
											<div class="card">
                                            <div class="card-block">
                                            <h4 class="card-title">Foto</h4>
                                            <label for="input-file-now">Clique no quadro para selecionar</label>
                                            <input type="file" id="input-file-now" class="dropify" name="foto"/>
                                            </div>
                                            </div>
											</div>
                                            </div>

  										    <div class="col-md-6">
                                            <div class="form-group">
											<div class="card">
                                            <div class="card-block">
                                            <label for="input-file-now"></label>
                                            </div>
                                            </div>
											</div>
                                            </div>


											<div class="col-md-6">
                                              <div class="form-group">

                                                    <label for="txtregiao">Micro região</label>
                                                    <select class="custom-select form-control" id="txtregiao" name="txtregiao">
      <%  
		  Response.ContentType="text/HTML";

		  MySqlConnection conn = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn.Open();
		  MySqlCommand sqlConsulta = new MySqlCommand();
		  sqlConsulta.Connection = conn;
		  sqlConsulta.CommandText = "Select * from REGIAO order by DESCRICAO";
		  MySqlDataReader dados = sqlConsulta.ExecuteReader();
		  Response.Write("<option value=''>"+RegiaoNome+"</option>");

		  while (dados.Read())
		  {
			  Response.Write("<option value='" + dados["ID"].ToString() + "'>" + dados["DESCRICAO"].ToString() + "</option>");

		  }
		  conn.Close();

       %>

                                                        
               </select>
											    
											  </div>
											</div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtmarcador">Marcador</label>
													   <div class="skin skin-minimal">
														   <div class="input-group">
                                                        <ul class="icheck-list">
												        
                                                            <li>
																<table>
																	<tr>
																		<td><input type="checkbox" class="check" data-checkbox="icheckbox_line-blue" data-label="1" name="txtmarcador" id="C1" value="M1" <%=chkM1%></td>
																		<td><input type="checkbox" class="check" data-checkbox="icheckbox_line-green" data-label="2" name="txtmarcador" id="C2" value="M2" <%=chkM2%>></td>
																		<td><input type="checkbox" class="check" data-checkbox="icheckbox_line-yellow" data-label="3" name="txtmarcador" id="C3" value="M3" <%=chkM3%>></td>
																	</tr>
																</table>
                                                                
                                                                
																
                                                            </li>
                                                        
														</ul>
														</div>
														</div>

                                            </div>

										</div>
											</div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtid">Código</label>
                                                    <input type="text" class="form-control" id="txtid" name="txtid" disabled value="<%=ID%>"> </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtnome">Nome</label>
                                                    <input type="text" class="form-control" id="txtnome" name="txtnome" value="<%=Nome %>" required data-validation-required-message="preencher campo obrigatório"> </div>
												
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtapelido">Apelido</label>
                                                    <input type="text" class="form-control" id="txtapelido" name="txtapelido" value="<%=Apelido %>"> </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtdata_nasc">Data Nasc.</label>
													<input type="text" placeholder="" data-mask="99/99/9999" class="form-control" id="txtdata_nasc" name="txtdata_nasc" value="<%=DataNasc%>"required data-validation-required-message="preencher campo obrigatório" >
                                                    
												</div> 
                                            </div>
                                        </div>
                                        <div class="row">
											                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cbxSexo">Sexo</label>
                                                    
													   <select class="custom-select form-control" id="cbxSexo" name="cbxSexo" >
                                                        <option value=""><%=Sexo %></option>
                                                        <option value="Masculino">Masculino</option>
                                                        <option value="Ferminino">Feminino</option>
                                                        
                                                    </select>



                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cbxcargo">Cargo</label>
                                                    <select class="custom-select form-control" id="cbxcargo" name="cbxcargo" value="<%=Cargo %>" >
      <%  
		  Response.ContentType="text/HTML";                                                           

		  MySqlConnection conn2 = new MySqlConnection("server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000");

		  conn2.Open();
		  MySqlCommand sqlConsulta2 = new MySqlCommand();
		  sqlConsulta2.Connection = conn2;
		  sqlConsulta2.CommandText = "Select * from CARGOS order by DESCRICAO";
		  MySqlDataReader dados2 = sqlConsulta2.ExecuteReader();
		  Response.Write("<option value=''>"+CargoNome+"</option>");

		  while (dados2.Read())
		  {
			 Response.Write("<option value='" + dados2["ID"].ToString() + "'>" + dados2["DESCRICAO"].ToString() + "</option>");
		  }
		  conn2.Close();

       %>

                                                    </select>
                                                </div>
                                            </div>

											                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfuncao">Função</label>
                                                    <input type="text" class="form-control" id="txtfuncao" name="txtfuncao" value="<%=Funcao %>"> </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- Step 2 -->
                                    
                                    <div class="form-body">
										<h3 class="box-title">Telefones</h3>
										<hr class="m-t-0 m-b-40">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfone1">Fone1</label>
                                                    <input type="text" class="form-control" id="txtfone1" name="txtfone1" value="<%=Fone1 %>"> </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfone2">Fone2</label>
                                                    <input type="text" class="form-control" id="txtfone2" name="txtfone2" value="<%=Fone2 %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtfone3">Fone3</label>
                                                    <input type="text" class="form-control" id="txtfone3" name="txtfone3" value="<%=Fone3 %>">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtemail">Email</label>
                                                    <input type="text" class="form-control" id="txtemail" name="txtemail" value="<%=Email %>">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- Step 3 -->
                                    <div class="form-body">
										<h3 class="box-title">Endereços</h3>
										<hr class="m-t-0 m-b-40">
                                    
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcep">CEP</label>
                                                    <input type="text" class="form-control" id="txtcep" name="txtcep" value="<%=Cep %>"> 
                                                </div>
                                            </div>

                                            <div class="col-md-6">

                                                <div class="form-group">
                                                    <label for="txtendereco">Endereço</label>
                                                    <input type="text" class="form-control" id="txtendereco" name="txtendereco" value="<%=Endereco %>"> 

                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtnumero">Número</label>
                                                    <input type="text" class="form-control" id="txtnumero" name="txtnumero" value="<%=Numero %>">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcomplemento">Complemento</label>
                                                    <input type="text" class="form-control" id="txtcomplemento" name="txtcomplemento" value="<%=Complemento %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtbairro">Bairro</label>
                                                    <input type="text" class="form-control" id="txtbairro" name="txtbairro" value="<%=Bairro %>">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtcidade">Cidade</label>
                                                    <input type="text" class="form-control" id="txtcidade" name="txtcidade" value="<%=Cidade %>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="txtuf">UF</label>
                                                    <input type="text" class="form-control" id="txtuf" name="txtuf" value="<%=UF %>">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <!-- Step 4 -->
                                    <div class="form-body">
										<hr class="m-t-0 m-b-40">
                                        <div class="row">
                                            <div class="col-md-6">
                                                    <div class="col-md-offset-3 col-md-9">
                                                        <button type="submit" class="btn btn-success" name="cmdpost" value="SAVE">Salvar</button>
                                                        <button type="button" Onclick="javascript:window.history.back()" class="btn btn-inverse" name="cmdpost" value="CANCEL">Cancelar</button>
                                                    </div>
                                            </div>

                                        </div>
                                    </div>
								
                                </form>
							    </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                


</asp:Content>
