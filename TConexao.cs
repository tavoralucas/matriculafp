using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;

namespace esmeraldino
{
    static class TConexao
    {
        public static MySql.Data.MySqlClient.MySqlConnection ConnUL = new MySql.Data.MySqlClient.MySqlConnection();

        public static int Tempo;

		public static String DBConexao = "server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000";

        public static void Connect()
        {

            string dbf = "server=esmeraldino.mysql.uhserver.com;uid=esmeraldino;pwd=*tel2000;database=esmeraldino";


            if (ConnUL.State == ConnectionState.Open)
            {
                ConnUL.Close();
            }
            
            
            if (ConnUL.State != ConnectionState.Open)
            {
                ConnUL.ConnectionString = dbf;
                if (ConnUL.State != ConnectionState.Open)

                    ConnUL.Open();
                
            }


        }

        public static MySqlConnection NewConnect()
        {
            string dbf = "server=esmeraldino.mysql.uhserver.com;User Id=esmeraldino;database=esmeraldino; password=*tel2000";
                
            MySqlConnection NewConn = new MySqlConnection(dbf);


             //NewConn.ConnectionString = dbf;
             return NewConn;
        }

        public static Decimal NotaProva(int ID_PROVA, int ID_ALUNO)
        {
            MySqlConnection nnconn = TConexao.NewConnect();
            nnconn.Open();
            MySqlCommand sqlAlternativa = new MySqlCommand();
            sqlAlternativa.Connection = nnconn;
            sqlAlternativa.CommandText = "Select * from alternativa where ID_PROVA=" + ID_PROVA.ToString();
            MySqlDataReader dados = sqlAlternativa.ExecuteReader();
            MySqlConnection newConn;
            newConn = TConexao.NewConnect();
            newConn.Open();
            MySqlCommand sqlAluno = new MySqlCommand();
            sqlAluno.Connection = newConn;
            int vAcerto;
            vAcerto = 0;
            bool Acertou;

            while (dados.Read())
            {

                Acertou = true;

                sqlAluno.CommandText = "Select * from AlternativaAluno where ID_PROVA=" + ID_PROVA.ToString() +
                    " AND ID_ALUNO=" + ID_ALUNO.ToString() +
                    " AND ID_QUESTAO=" + dados["ID_QUESTAO"].ToString();
                MySqlDataReader xdados = sqlAluno.ExecuteReader();

                xdados.Read();
                if (xdados.HasRows)
                {
                    if (xdados["FLAG_A"].ToString() != dados["FLAG_A"].ToString())
                    {
                        Acertou = false;
                    }

                    if (xdados["FLAG_B"].ToString() != dados["FLAG_B"].ToString())
                    {
                        Acertou = false;
                    }

                    if (xdados["FLAG_C"].ToString() != dados["FLAG_C"].ToString())
                    {
                        Acertou = false;
                    }
                    if (xdados["FLAG_D"].ToString() != dados["FLAG_D"].ToString())
                    {
                        Acertou = false;
                    }

                    if (xdados["FLAG_E"].ToString() != dados["FLAG_E"].ToString())
                    {
                        Acertou = false;
                    }

                    if (Acertou)
                    {
                        vAcerto += 1;
                    }
                }
                xdados.Close();

            }

            MySqlConnection newConn1;
            newConn1 = TConexao.NewConnect();
            newConn1.Open();
            MySqlCommand sqlProva = new MySqlCommand();
            sqlProva.Connection = newConn1;
            sqlProva.CommandText = "Select Valor_questao from provas " +
                " where ID=" + ID_PROVA.ToString();
            MySqlDataReader vdados = sqlProva.ExecuteReader();
            vdados.Read();
            if (vdados.HasRows)
            {
                return vAcerto * Convert.ToDecimal(vdados["Valor_questao"]);
            }
            else
                return 0;




        }





    }
}