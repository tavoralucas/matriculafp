using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Uol.PagSeguro.Util;
using Uol.PagSeguro.Domain;
using Uol.PagSeguro.Service;
using Uol.PagSeguro.XmlParse;
using Uol.PagSeguro.Constants;
using Uol.PagSeguro.Parse;
using Uol.PagSeguro.Exception;
using Uol.PagSeguro.Log;
using Uol.PagSeguro.Resources;
using System.IO;
using MySql.Data;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using System.Data;

namespace Simulado
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string METODO = Request.HttpMethod;

            MySqlConnection conn = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**");

            /*MySqlCommand XsqlUpdate0 = new MySqlCommand();
            XsqlUpdate0.Connection = conn;
            conn.Open();
            XsqlUpdate0.CommandText = "INSERT INTO LOG_PG (METODO)" +
                                                 " VALUES('" + METODO + "')";
            XsqlUpdate0.ExecuteNonQuery();
            conn.Close(); */


            if (Request.Form.Count > 0)
            {

                if (File.Exists(Server.MapPath("PagSeguroConfig.xml")))
                {

                    PagSeguroConfiguration.UrlXmlConfiguration = Server.MapPath("PagSeguroConfig.xml");
                }

                /* MySqlCommand XsqlUpdateW = new MySqlCommand();
                XsqlUpdateW.Connection = conn;
                conn.Open();
                foreach (string key in HttpContext.Current.Request.Form.AllKeys)
                {
                    string value = HttpContext.Current.Request.Form[key];
                    XsqlUpdateW.CommandText = "INSERT INTO LOG_PG (METODO, notificationCode)" +
                                                         " VALUES('" + key + "', '" + value + "')";
                    XsqlUpdateW.ExecuteNonQuery();

                }
                conn.Close(); */
                String notificationCode = "";

                if (!string.IsNullOrEmpty(Request.Form["TransacaoID"]))
                {
                    notificationCode = Request.Form["TransacaoID"].ToString();
                }

                if (!string.IsNullOrEmpty(Request.Form["id"]))
                {
                    notificationCode = Request.Form["id"].ToString();
                }

                if (!string.IsNullOrEmpty(Request.Form["notificationCode"]))
                {
                     notificationCode = Request.Form["notificationCode"].ToString();
                }

                
                /* String notificationType = "";
                 try
                 {
                     notificationType = Request.Form["notificationType"].ToString();
                 }
                 catch (IOException verro)
                 {
                     notificationType = verro.Message;
                 } */




                //                    if (notificationCode == "transaction")
                if (notificationCode != "")
                    {
                    if (File.Exists(Server.MapPath("PagSeguroConfig.xml")))
                    {

                        PagSeguroConfiguration.UrlXmlConfiguration = Server.MapPath("PagSeguroConfig.xml");
                    }

                    string transactionCode = notificationCode;

                    AccountCredentials Credencial = PagSeguroConfiguration.Credentials(false);
                    // Realizando uma consulta de transação a partir do código identificador   
                    // para obter o objeto Transaction  
                    Transaction transaction = TransactionSearchService.SearchByCode(Credencial, transactionCode);



                    //o método GET indica que a requisição é o retorno do Checkout PagSeguro para o site vendedor.
                    //no término do checkout o usuário é redirecionado para este bloco.
                    if (transaction.Reference != "")
                    {

                        String TransacaoID = transactionCode;
                        String Referencia = transaction.Reference;
                        String Situacao = transaction.TransactionStatus.ToString();
                        Decimal nValorliq = transaction.NetAmount;
                        DateTime Data = transaction.LastEventDate;

                        MySqlParameter VALOR_PAG = new MySqlParameter();
                        VALOR_PAG.ParameterName = "VALOR_PAG";
                        VALOR_PAG.DbType = DbType.Decimal;
                        VALOR_PAG.Value = nValorliq;


                        String Data2 = Data.ToString("yyyy-MM-dd hh:mm:ss");

                        MySqlCommand sqlUpdate = new MySqlCommand();
                        sqlUpdate.Connection = conn;
                        conn.Open();
                        sqlUpdate.CommandText = "update PAGSEGURO set CHAVEMP='" + TransacaoID + "', SITUACAOMP='" + Situacao + "'" +
                                ",VALOR_PAG=@VALOR_PAG,DATA_PAG='" + Data2 + "'" +
                            " where REFERENCIA='" + Referencia + "'";
                        sqlUpdate.Parameters.Add(VALOR_PAG);

                        sqlUpdate.ExecuteNonQuery();
                        conn.Close();
                    }


                }

            }

                else if (METODO == "GET")
                {
                if (File.Exists(Server.MapPath("PagSeguroConfig.xml")))
                {

                    PagSeguroConfiguration.UrlXmlConfiguration = Server.MapPath("PagSeguroConfig.xml");
                }

                string transactionCode = Request.QueryString["id"];
                    
                    AccountCredentials Credencial = PagSeguroConfiguration.Credentials(false);
                    // Realizando uma consulta de transação a partir do código identificador   
                    // para obter o objeto Transaction  
                    Transaction transaction = TransactionSearchService.SearchByCode(Credencial, transactionCode);

                    

                    //o método GET indica que a requisição é o retorno do Checkout PagSeguro para o site vendedor.
                    //no término do checkout o usuário é redirecionado para este bloco.
                    if (transaction.Reference != "")
                    {

                        String TransacaoID = transactionCode;
                        String Referencia = transaction.Reference;
                        String Situacao = transaction.TransactionStatus.ToString();
                        Decimal nValorliq = transaction.NetAmount;
                        DateTime Data = transaction.LastEventDate;

                            MySqlParameter VALOR_PAG = new MySqlParameter();
                    VALOR_PAG.ParameterName = "VALOR_PAG";
                    VALOR_PAG.DbType = DbType.Decimal;
                    VALOR_PAG.Value = nValorliq;


                    String Data2 = Data.ToString("yyyy-MM-dd hh:mm:ss");

                        MySqlCommand sqlUpdate = new MySqlCommand();
                        sqlUpdate.Connection = conn;
                        conn.Open();
                        sqlUpdate.CommandText = "update PAGSEGURO set CHAVEMP='" + TransacaoID + "', SITUACAOMP='" + Situacao + "'" +
                                ",VALOR_PAG=@VALOR_PAG,DATA_PAG='"+Data2+"'" +
                            " where REFERENCIA='" + Referencia+"'";
                            sqlUpdate.Parameters.Add(VALOR_PAG);

                        sqlUpdate.ExecuteNonQuery();
                        conn.Close();
                    }

                }
            
        }
    }
}