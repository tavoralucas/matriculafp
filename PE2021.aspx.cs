using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Net;
using MySql.Data.MySqlClient;

using OpenHtmlToPdf;

namespace esmeraldino
{
	public partial class PE2021 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
           
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			String CPF = "";
			String NOME = "";
			String NOME_RESP = "";

			CPF = Request.Cookies["cpf"].Value.ToString();

			MySqlConnection connedit = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");
			MySqlCommand sqlConsultaCO = new MySqlCommand();
			sqlConsultaCO.Connection = connedit;
			connedit.Open();
			sqlConsultaCO.CommandText = "Select * from aluno  left outer join disci_aluno on aluno.CPF=disci_aluno.CPF where aluno.cpf='" + CPF + "'";


			MySqlDataReader dadosCO = sqlConsultaCO.ExecuteReader();
			dadosCO.Read();
			NOME_RESP = dadosCO["nome_resp"].ToString();
			connedit.Close();


			string html = "";
			using (WebClient client = new WebClient())
			{
				 html = client.DownloadString(Server.MapPath("")+"/PE2021.aspx");
			}
			html = html.Replace("<%@ Page Language='C#' AutoEventWireup='true' CodeBehind='PE2021.aspx.cs' Inherits='esmeraldino.PE2021' %>","");
			html = html.Replace("<%=NOME_RESP%>", NOME_RESP);
			var pdf = Pdf.From(html)
				.OfSize(PaperSize.A4)
				.WithObjectSetting("web.defaultEncoding", "windows-1252")
				.WithTitle("Title")
				.WithoutOutline()
				.WithMargins(1.25.Centimeters())
				.Portrait()
				.Comressed()
				.Content();

			Response.Clear();
			Response.ContentType = "application/pdf";
			Response.AddHeader("Content-Disposition", "attachment; filename=contrato.pdf");
			Response.BinaryWrite(pdf);
			Response.End();
		}
	}
}