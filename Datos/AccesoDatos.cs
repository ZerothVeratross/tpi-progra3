using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class AccesoDatos
    {
        private string cadenaConexion = @"Data Source=localhost\sqlexpress;Initial Catalog=Clinica_Medica;Integrated Security=True;Encrypt=False";



        public AccesoDatos()
        {
        }

        public SqlConnection CrearConexion()
        {
            SqlConnection con = new SqlConnection(cadenaConexion);
            try
            {
                con.Open();
                return con;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private SqlDataAdapter CrearAdaptador(string consulta, SqlConnection con)
        {
            SqlDataAdapter adp;
            try
            {
                adp = new SqlDataAdapter(consulta, con);
                return adp;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable CrearTabla(string nombreTabla, string consulta)
        {
            DataSet ds = new DataSet();
            SqlConnection con = CrearConexion();
            SqlDataAdapter adp = CrearAdaptador(consulta, con);
            if (con == null)
            {
                return null;
            }
            adp.Fill(ds, nombreTabla);
            con.Close();
            return ds.Tables[nombreTabla];
        }

        public void PrepararConsulta(SqlCommand cmd, string consulta)
        {
            cmd.Parameters.Clear();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = consulta;
        }

        public void PrepararParametro(SqlCommand cmd, string nombre, object valor)
        {
            cmd.Parameters.AddWithValue(nombre, valor);
        }

        public int EjecutarModificacion(SqlCommand cmd)
        {
            int filasAfectadas = 0;
            if (cmd != null)
            {
                filasAfectadas = cmd.ExecuteNonQuery();
                cmd.Connection.Close();
            }
            return filasAfectadas;
        }

        public SqlDataReader EjecutarLectura(SqlCommand cmd)
        {
            SqlDataReader rd = null;
            if (cmd != null)
            {
                cmd.Connection = CrearConexion();
                rd = cmd.ExecuteReader();
            }
            return rd;
        }

        public void CerrarConexion(SqlConnection con)
        {
            con.Close();
        }

        public void CerrarConexion(SqlConnection con, SqlDataReader rd)
        {
            con.Close();
            rd.Close();
        }

        public bool Existe(SqlCommand cmd)
        {
            bool estado = false;
            SqlDataReader rd = EjecutarLectura(cmd);
            if (rd != null && rd.Read())
            {
                estado = true;
            }
            return estado;
        }

        public int ObtenerMaximo(string nombreCampo, string nombreTabla)
        {
            int max = 0;
            SqlConnection con = CrearConexion();
            SqlCommand cmd = new SqlCommand("SELECT MAX(" + nombreCampo + ") FROM " + nombreTabla, con);
            SqlDataReader rd = EjecutarLectura(cmd);
            if (rd != null && rd.Read())
            {
                max = Convert.ToInt32(rd[0].ToString());
                CerrarConexion(con, rd);

            }
            return max;
        }

        public int EjecutarProcedimientoAlmacenado(SqlCommand Comando, String NombreSP)
        {
            int FilasCambiadas;
            SqlConnection Conexion = CrearConexion();
            SqlCommand cmd = new SqlCommand();
            cmd = Comando;
            cmd.Connection = Conexion;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = NombreSP;
            FilasCambiadas = cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }
    }
}
