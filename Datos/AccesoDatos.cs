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
        public AccesoDatos()
        {
        }
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataAdapter adaptador;
        private SqlDataReader lector;
        public SqlDataReader Lector
        {
            get { return lector; }
        }

        //abrir conexion
        public void openConexion()
        {
            conexion = new SqlConnection("server=localhost\\SQLEXPRESS; database=Clinica_Medica; integrated security=true;Encrypt=False");
            comando = new SqlCommand();
        }

        //setear consulta 
        public void setearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        //setear procedimiento almacenado
        public void setearProcedimiento(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }

        //ejecutar lectura
        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //setear parametro
        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        //ejecutar accion
        public int ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                int filaAfectadas;
                conexion.Open();
                return filaAfectadas = comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //ejecutar accion scalar
        public int ejecutarAccionScalar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                return int.Parse(comando.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //setear adaptador
        public void setearAdaptador(string consulta)
        {
            adaptador = new SqlDataAdapter();
            adaptador.SelectCommand = new SqlCommand(consulta, conexion);

        }

        //setear parametro adaptador
        public void setearParametroAdaptador(string nombre, object valor)
        {
            adaptador.SelectCommand.Parameters.AddWithValue(nombre, valor);
        }

        //ejecutar tabla
        public DataTable ejecutarTabla(string nombreTabla)
        {
            DataTable tabla = new DataTable(nombreTabla);

            try
            {
                conexion.Open();
                adaptador.Fill(tabla);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
            return tabla;
        }

        //cerrar conexion
        public void closeConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }
    }
}
