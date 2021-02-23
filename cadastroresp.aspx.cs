using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using MySql.Data.MySqlClient;

namespace Simulado
{
	public partial class cadastroresp : System.Web.UI.Page
	{

        [WebMethod]
        public static string GetCupom(string prefixo)
        {
            Double valor_cupom = 0;
            
            using (MySqlConnection conn = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**"))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select VALOR,TIPO,COD_DISCIPLINA,FLAG_ESCOLAPUBLICA,FLAG_EXALUNO,VALIDADE from CUPOM_DESCONTO where CUPOM = @Texto";
                    cmd.Parameters.AddWithValue("@Texto", prefixo);
                    cmd.Connection = conn;
                    conn.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                          valor_cupom = Convert.ToDouble(sdr["VALOR"]);
                        }
                    }
                    conn.Close();
                }
            }
            if (valor_cupom > 0)
            {
                return "Parabéns!!! Seu cupom vale R$ "+valor_cupom.ToString("C");
            }
            else
                return "Cupom inválido!";   

        }
        protected void Page_Load(object sender, EventArgs e)
		{

		}
	}
}