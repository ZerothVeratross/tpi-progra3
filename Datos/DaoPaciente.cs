using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente
    {
        AccesoDatos datos = new AccesoDatos();

        //AGREGAR PACIENTE
        public DataTable getTablaPacientes()
        {
            DataTable tabla = datos.CrearTabla("PACIENTES", "Select * FROM PACIENTES");
            return tabla;
        }

        public bool ExistePaciente(string dni)
        {
            SqlConnection conexion = null;
            string consultaSQL = "SELECT * FROM PACIENTES WHERE Dni_Paciente = @dni";
            try
            {
                conexion = datos.CrearConexion();
                SqlCommand command = new SqlCommand(consultaSQL, conexion);
                command.Parameters.AddWithValue("@dni", dni);

                bool existe = datos.Existe(command);
                //datos.CerrarConexion(conexion);
                return existe;
            }
            catch (Exception ex)
            {
                //datos.CerrarConexion(conexion);
                throw ex;
            }
            finally
            {
                datos.CerrarConexion(conexion);
            }

        }

        public int AgregarPaciente(Paciente paciente)
        {
            try
            {
                datos.openConexion();

                string consultaSQL = "INSERT INTO PACIENTES (Dni_Paciente, Nombre_P, Apellido_P, Sexo_P, " +
                                    "Fecha_Nacimiento_P, Nacionalidad_P, Id_Localidad_P, Direccion_P, " +
                                    "Correo_Electronico_P, Telefono_P, Estado_P) " +
                                    "VALUES (@dni, @nombre, @apellido, @sexo, @fechaNacimiento, @nacionalidad, " +
                                    "@idLocalidad, @direccion, @correo, @telefono, 1)";

                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", paciente.getDni());
                datos.setearParametro("@nombre", paciente.getNombre());
                datos.setearParametro("@apellido", paciente.getApellido());
                datos.setearParametro("@sexo", paciente.getSexo());
                datos.setearParametro("@fechaNacimiento", paciente.getFechaNacimiento());
                datos.setearParametro("@nacionalidad", paciente.getNacionalidad());
                datos.setearParametro("@idLocalidad", paciente.getLocalidad().getIdLocalidad());
                datos.setearParametro("@direccion", paciente.getDireccion());
                datos.setearParametro("@correo", paciente.getCorreoElectronico());
                datos.setearParametro("@telefono", paciente.getTelefono());

                int filasAfectadas = datos.ejecutarAccion();
                //datos.closeConexion();

                return filasAfectadas;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
        }

        //MODIFICAR PACIENTE

        public Paciente GetPacientePorDNI(string dni)
        {
            Paciente paciente = null;
            try
            {
                datos.openConexion();
                string consultaSQL = "SELECT P.Dni_Paciente, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Nacionalidad_P, P.Fecha_Nacimiento_P, Direccion_P, P.Correo_Electronico_P, P.Telefono_P, P.Id_Localidad_P, L.Id_Provincia_L FROM PACIENTES AS P " +
                "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad WHERE P.Dni_Paciente = @dni AND P.Estado_P = 1";
                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    paciente = new Paciente();
                    paciente.setDni(datos.Lector["Dni_Paciente"].ToString());
                    paciente.setNombre(datos.Lector["Nombre_P"].ToString());
                    paciente.setApellido(datos.Lector["Apellido_P"].ToString());
                    paciente.setSexo(datos.Lector["Sexo_P"].ToString());
                    paciente.setNacionalidad(datos.Lector["Nacionalidad_P"].ToString());
                    if (!Convert.IsDBNull(datos.Lector["Fecha_Nacimiento_P"]))
                    {
                        paciente.setFechaNacimiento(Convert.ToDateTime(datos.Lector["Fecha_Nacimiento_P"]));
                    }
                    paciente.setDireccion(datos.Lector["Direccion_P"].ToString());
                    paciente.setCorreoElectronico(datos.Lector["Correo_Electronico_P"].ToString());
                    paciente.setTelefono(datos.Lector["Telefono_P"].ToString());

                    Localidad localidad = new Localidad();
                    localidad.setIdLocalidad(datos.Lector["Id_Localidad_P"].ToString());
                    paciente.setLocalidad(localidad);

                    Provincia provincia = new Provincia();
                    provincia.setIdProvincia(datos.Lector["Id_Provincia_L"].ToString());
                    paciente.setProvincia(provincia);

                }
                return paciente;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
        }

        public bool ModificarPaciente(Paciente paciente)
        {
            try
            {
                datos.openConexion();
                string consultaSQL = @"UPDATE PACIENTES SET Nombre_P = @nombre, Apellido_P = @apellido, Sexo_P = @sexo, Nacionalidad_P = @nacionalidad, " +
                    "Fecha_Nacimiento_P = @fecha, Direccion_P = @direccion, Correo_Electronico_P = @correo, Telefono_P = @telefono, Id_Localidad_P = @IdLocalidad " +
                    "WHERE Dni_Paciente = @dni AND Estado_P = 1";
                datos.setearConsulta(consultaSQL);

                datos.setearParametro("@nombre", paciente.getNombre());
                datos.setearParametro("@apellido", paciente.getApellido());
                datos.setearParametro("@sexo", paciente.getSexo());
                datos.setearParametro("@nacionalidad", paciente.getNacionalidad());
                datos.setearParametro("@fecha", paciente.getFechaNacimiento());
                datos.setearParametro("@direccion", paciente.getDireccion());
                datos.setearParametro("@correo", paciente.getCorreoElectronico());
                datos.setearParametro("@telefono", paciente.getTelefono());
                datos.setearParametro("@IdLocalidad", paciente.getLocalidad().getIdLocalidad());
                datos.setearParametro("@dni", paciente.getDni());

                int filasAfectadas = datos.ejecutarAccion();

                if (filasAfectadas > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
        }
    }
}
