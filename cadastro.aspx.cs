using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Simulado
{
	public partial class cadastro : System.Web.UI.Page
	{
        [WebMethod]  
        public static string[] GetEscolas(string prefixo)
        {
            List<string> escolas = new List<string>();
            using (MySqlConnection conn = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**"))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select ESCOLA, ID from ESCOLA where ESCOLA like @Texto";
                    cmd.Parameters.AddWithValue("@Texto", '%'+prefixo+'%');
                    cmd.Connection = conn;
                    conn.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            escolas.Add(string.Format("{0}-{1}", sdr["ESCOLA"], sdr["ID"]));
                        }
                    }
                    conn.Close();
                }
            }
            return escolas.ToArray();
        }

        [WebMethod]
        public static string[] GetCursos(string prefixo)
        {
            List<string> cursos = new List<string>();
            using (MySqlConnection conn = new MySqlConnection("server=matriculasfp.mysql.uhserver.com;User Id=matriculasfp;database=matriculasfp; password=c2007s**"))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "select DESCRICAO, CODIGO from CURSOS where DESCRICAO like @Texto";
                    cmd.Parameters.AddWithValue("@Texto", '%'+prefixo+'%');
                    cmd.Connection = conn;
                    conn.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            cursos.Add(string.Format("{0}-{1}", sdr["DESCRICAO"], sdr["CODIGO"]));
                        }
                    }
                    conn.Close();
                }
            }
            return cursos.ToArray();
        }

        protected void Page_Load(object sender, EventArgs e)
		{

		}
	}
}