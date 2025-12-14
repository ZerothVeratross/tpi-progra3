using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoPaciente
    {
        AccesoDatos datos = new AccesoDatos();

        //AGREGAR PACIENTE

        public bool ExistePaciente(string dni)
        {
            bool existe = false;
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT * FROM PACIENTES WHERE Dni_Paciente = @dni");
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    existe = true;
                }
                return existe;
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
                    paciente.setFechaNacimiento(Convert.ToDateTime(datos.Lector["Fecha_Nacimiento_P"]));
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
                string consultaSQL = "UPDATE PACIENTES SET Nombre_P = @nombre, Apellido_P = @apellido, Sexo_P = @sexo, Nacionalidad_P = @nacionalidad, " +
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

        /// ESTE METODO TIENE SOLO COMO DIFERENCIA DEL DE ARRIBA ES QUE TRAE EL PACIENTE SIN IMPORTAR SU ESTADO PARA QUE ESE DNI NO SE PUEDA UTILIZAR EN MODIFICAR MEDICO
        public Paciente BuscarPacientePorDNI(string dni)
        {
            Paciente paciente = null;
            try
            {
                datos.openConexion();
                string consultaSQL = "SELECT P.Dni_Paciente, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Nacionalidad_P, P.Fecha_Nacimiento_P, Direccion_P, P.Correo_Electronico_P, P.Telefono_P, P.Id_Localidad_P, L.Id_Provincia_L FROM PACIENTES AS P " +
                "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad WHERE P.Dni_Paciente = @dni";
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
                    paciente.setFechaNacimiento(Convert.ToDateTime(datos.Lector["Fecha_Nacimiento_P"]));
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

        //DAR BAJA PACIENTE
        public bool BajaPaciente(Paciente paciente)
        {
            try
            {
                datos.openConexion();
                string consultaSQL = "UPDATE PACIENTES SET Estado_P = 0 WHERE Dni_Paciente=@dni";
                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", paciente.getDni());

                int filasAfectadas = datos.ejecutarAccion();
                if (filasAfectadas == 1)
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
        public DataTable getPacienteDarBaja(string dni)
        {
            try
            {
                datos.openConexion();
                datos.setearAdaptador("SELECT Dni_Paciente AS DNI, Nombre_P AS Nombre, Apellido_P AS Apellido, CASE WHEN Estado_P = 1 THEN 'Activo' ELSE 'No Activo' END AS Estado " +
                "FROM PACIENTES WHERE Dni_Paciente = '" + dni + "'");

                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //LISTADO PACIENTE 

        public DataTable ObtenerTodosPacientes()
        {
            try
            {
                datos.openConexion();
                datos.setearAdaptador("SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 1");
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable FiltrarPaciente(string idProvincia, string idLocalidad)
        {
            try
            {
                string consultaSQL = "SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                                "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                                "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 1";

                if (!string.IsNullOrEmpty(idProvincia) && idProvincia != "0")
                {
                    consultaSQL += " AND PR.Id_Provincia = @idProvincia";
                }
                if (!string.IsNullOrEmpty(idLocalidad) && idLocalidad != "0")
                {
                    consultaSQL += " AND L.Id_Localidad = @idLocalidad";
                }
                datos.openConexion();
                datos.setearAdaptador(consultaSQL);

                if (idProvincia != "0")
                {
                    datos.setearParametroAdaptador("@idProvincia", idProvincia.Trim());
                }
                if (idLocalidad != "0")
                {
                    datos.setearParametroAdaptador("@idLocalidad", idLocalidad.Trim());
                }
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable BusquedaPacientes(string busqueda)
        {
            try
            {
                string consultaSQL = "SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                                "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                                "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 1 AND (" +
                                "P.Dni_Paciente LIKE @texto OR P.Nombre_P LIKE @texto OR P.Apellido_P LIKE @texto OR P.Sexo_P LIKE @texto)";
                datos.openConexion();
                datos.setearAdaptador(consultaSQL);
                datos.setearParametroAdaptador("@texto", "%" + busqueda + "%");
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //REACTIVAR PACIENTE
        public DataTable ObtenerTablaPacientesInactivos()
        {
            try
            {
                string consultaSQL = "SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, " +
                    "P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, " +
                    "PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], " +
                    "P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                    "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                    "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 0";
                datos.openConexion();
                datos.setearAdaptador(consultaSQL);
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable BuscarPacienteInactivo(string buscaInactivo)
        {
            try
            {
                string consultaSQL = "SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, " +
                    "P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, " +
                    "PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], " +
                    "P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                    "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                    "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 0 AND (P.Dni_Paciente LIKE @texto " +
                    "OR P.Nombre_P LIKE @texto OR P.Apellido_P LIKE @texto)";
                datos.openConexion();
                datos.setearAdaptador(consultaSQL);
                datos.setearParametroAdaptador("@texto", "%" + buscaInactivo + "%");
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataTable FiltrarPacienteInactivo(string idProvincia, string idLocalidad)
        {
            try
            {
                string consultaSQL = "SELECT P.Dni_Paciente AS DNI, P.Nombre_P AS Nombre, P.Apellido_P AS Apellido, P.Sexo_P AS Sexo, " +
                    "P.Fecha_Nacimiento_P AS [Fecha de Nacimiento], P.Nacionalidad_P AS Nacionalidad, L.Descripcion_L AS Localidad, " +
                    "PR.Descripcion_P AS Provincia, P.Direccion_P AS Direccion, P.Correo_Electronico_P AS [Correo Electronico], " +
                    "P.Telefono_P AS Telefono FROM PACIENTES AS P " +
                    "INNER JOIN LOCALIDADES AS L ON P.Id_Localidad_P = L.Id_Localidad " +
                     "INNER JOIN PROVINCIAS AS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Estado_P = 0";

                if (!string.IsNullOrEmpty(idProvincia) && idProvincia != "0")
                {
                    consultaSQL += " AND PR.Id_Provincia = @idProvincia";
                }
                if (!string.IsNullOrEmpty(idLocalidad) && idLocalidad != "0")
                {
                    consultaSQL += " AND L.Id_Localidad = @idLocalidad";
                }
                datos.openConexion();
                datos.setearAdaptador(consultaSQL);

                if (idProvincia != "0")
                {
                    datos.setearParametroAdaptador("@idProvincia", idProvincia.Trim());
                }
                if (idLocalidad != "0")
                {
                    datos.setearParametroAdaptador("@idLocalidad", idLocalidad.Trim());
                }
                return datos.ejecutarTabla("PACIENTES");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool ReactivarPaciente(string DNISeleccionado)
        {
            try
            {
                datos.openConexion();
                string consultaSQL = "UPDATE PACIENTES SET Estado_P = 1 WHERE Dni_Paciente=@dni";
                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", DNISeleccionado);

                int filasAfectadas = datos.ejecutarAccion();
                if (filasAfectadas == 1)
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
        
        public bool getEstadoPaciente(string dni)
        {
            bool estadoP = true;
            try
            {
                datos.openConexion();
                string consultaSQL = "SELECT P.Estado_P FROM PACIENTES AS P WHERE P.Dni_Paciente = @dni";
                datos.setearConsulta(consultaSQL);
                datos.setearParametro("@dni", dni);
                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    estadoP = (Convert.ToBoolean(datos.Lector["Estado_P"]));     
                }
                return estadoP;
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
