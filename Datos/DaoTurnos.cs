using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Datos
{
    public class DaoTurnos
    {
        AccesoDatos datos = new AccesoDatos();

        //PARA CARGAR LOS MEDICOS POR DIA Y HORA ELEGIDA EN ASIGNACIONTURNOS
        public List<Medico> ListarMedicosDisponibles(string idEspecialidad, DateTime fecha, TimeSpan hora)
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.openConexion();

                int diaSql = (int)fecha.DayOfWeek;
                int diaSemana = (diaSql == 0) ? 7 : diaSql;

                string consulta = @"SELECT M.Nro_Legajo_M, M.Nombre_M, M.Apellido_M FROM MEDICOS M INNER JOIN HORARIO_MEDICOS HM ON HM.Nro_Legajo_HM = M.Nro_Legajo_M WHERE M.Id_Especialidad_M = @idEspecialidad 
        AND HM.Id_Dia_HM = @diaSemana AND @hora >= HM.HorarioInicio_HM AND @hora < HM.HorarioFinal_HM AND M.Estado_M = 1 AND NOT EXISTS ( SELECT 1 FROM TURNOS T WHERE T.Nro_Legajo_T = M.Nro_Legajo_M 
            AND T.Fecha_T = @fecha AND T.Hora_T = @hora ) ORDER BY M.Apellido_M, M.Nombre_M;";

                datos.setearConsulta(consulta);
                datos.setearParametro("@idEspecialidad", idEspecialidad);
                datos.setearParametro("@fecha", fecha);
                datos.setearParametro("@hora", hora);
                datos.setearParametro("@diaSemana", diaSemana.ToString());

                datos.ejecutarLectura();

                int contador = 0;
                while (datos.Lector.Read())
                {
                    contador++;
                    Medico aux = new Medico();
                    aux.setLegajo(datos.Lector["Nro_Legajo_M"].ToString());
                    aux.setNombre(datos.Lector["Nombre_M"].ToString());
                    aux.setApellido(datos.Lector["Apellido_M"].ToString());
                    lista.Add(aux);

                }

                return lista;
            }
            catch (Exception ex)
            {
             throw;
            }
            finally
            {
                datos.closeConexion();
            }
        }

        //PARA CARGAR TURNO A LA BD
            public bool AgregarTurno(Turno turno)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.openConexion();

                string consulta = @"INSERT INTO TURNOS 
                           (Id_Turno, Nro_Legajo_T, Dni_Paciente_T, Fecha_T, Hora_T, Asistencia_T, Observaciones, Estado) 
                           VALUES 
                           (@IdTurno, @Legajo, @Dni, @Fecha, @Hora, @Asistencia, @Observaciones, @Estado)";

                datos.setearConsulta(consulta);
                datos.setearParametro("@IdTurno", turno.ID);
                datos.setearParametro("@Legajo", turno.Legajo);
                datos.setearParametro("@Dni", turno.DNI);
                datos.setearParametro("@Fecha", turno.Fecha);
                datos.setearParametro("@Hora", TimeSpan.Parse(turno.Hora));
                datos.setearParametro("@Asistencia", turno.Asistencia);
                datos.setearParametro("@Observaciones", turno.Observaciones);
                datos.setearParametro("@Estado", turno.Estado);

                int filasAfectadas = datos.ejecutarAccion();
                return filasAfectadas == 1;
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


        //OARA OBTENER PROXIMO ID DE TURNO

        public string ObtenerProximoIdTurno()
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.openConexion();

                string consulta = "SELECT ISNULL(MAX(CAST(SUBSTRING(Id_Turno, 2, 6) AS INT)), 0) + 1 FROM TURNOS";

                datos.setearConsulta(consulta);
                int proximoId = datos.ejecutarAccionScalar();

                return "T" + proximoId.ToString().PadLeft(6, '0');
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


        public List<Turno> getTurnosPorMedico(Medico medico)
        {
            List<Turno> lista = new List<Turno>();
            try
            {
                datos.openConexion();
                datos.setearConsulta("SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE T.Nro_Legajo_T = @id");
                datos.setearParametro("id", medico.getLegajo());
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.ID = (string)datos.Lector["Id_Turno"];
                    turno.DNI = (string)datos.Lector["Dni_Paciente_T"];
                    turno.Nombre = (string)datos.Lector["Nombre_P"];
                    turno.Apellido = (string)datos.Lector["Apellido_P"];
                    turno.Sexo = (string)datos.Lector["Sexo_P"];
                    turno.FechaNacimiento = (DateTime)datos.Lector["Fecha_Nacimiento_P"];
                    turno.Provincia = (string)datos.Lector["Descripcion_P"];
                    turno.Fecha = (DateTime)datos.Lector["Fecha_T"];
                    turno.Hora = ((TimeSpan)datos.Lector["Hora_T"]).ToString();
                    turno.Asistencia = (string)datos.Lector["Asistencia_T"];
                    turno.Observaciones = (string)datos.Lector["Observaciones"];

                    lista.Add(turno);
                }
                return lista;
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
        public List<Turno> FiltrarTurno(string filtro, string filtro2, string id)
        {
            List<Turno> lista = new List<Turno>();
            string consulta = null;
            try
            {
                if (filtro == "Sexo")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE P.Sexo_P = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                else if (filtro == "Provincia")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE PR.Descripcion_P = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                else if (filtro == "Asistencia")
                {
                    consulta = "SELECT T.Id_Turno, T.Dni_Paciente_T, P.Nombre_P, P.Apellido_P, P.Sexo_P, P.Fecha_Nacimiento_P, PR.Descripcion_P, T.Fecha_T, T.Hora_T, T.Asistencia_T, T.Observaciones FROM TURNOS T INNER JOIN PACIENTES P ON T.Dni_Paciente_T = P.Dni_Paciente INNER JOIN LOCALIDADES L ON P.Id_Localidad_P = L.Id_Localidad INNER JOIN PROVINCIAS PR ON L.Id_Provincia_L = PR.Id_Provincia WHERE Asistencia_T = @filtro2 AND T.Nro_Legajo_T = @id";
                }
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("filtro2", filtro2);
                datos.setearParametro("id", id);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Turno turno = new Turno();
                    turno.ID = (string)datos.Lector["Id_Turno"];
                    turno.DNI = (string)datos.Lector["Dni_Paciente_T"];
                    turno.Nombre = (string)datos.Lector["Nombre_P"];
                    turno.Apellido = (string)datos.Lector["Apellido_P"];
                    turno.Sexo = (string)datos.Lector["Sexo_P"];
                    turno.FechaNacimiento = (DateTime)datos.Lector["Fecha_Nacimiento_P"];
                    turno.Provincia = (string)datos.Lector["Descripcion_P"];
                    turno.Fecha = (DateTime)datos.Lector["Fecha_T"];
                    turno.Hora = ((TimeSpan)datos.Lector["Hora_T"]).ToString();
                    turno.Asistencia = (string)datos.Lector["Asistencia_T"];
                    turno.Observaciones = (string)datos.Lector["Observaciones"];

                    lista.Add(turno);
                }
                return lista;
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

        public DataTable TablaInforme(string fecha1, string fecha2)
        {
            DataTable dt = new DataTable();
            string consulta = "SELECT COUNT(*) AS Total, " +
                "SUM(CASE WHEN Asistencia_T = 'Asistio' THEN 1 ELSE 0 END) AS Asistencias, " +
                "SUM(CASE WHEN Asistencia_T = 'No asistio' THEN 1 ELSE 0 END) AS Inasistencias, " +
                "SUM(CASE WHEN Asistencia_T = 'A confirmar' THEN 1 ELSE 0 END) AS Pendientes " +
                "FROM TURNOS";

            if (fecha1.Length > 0) { consulta += " WHERE Fecha_T >= @fechaMenor"; }
            if (fecha1.Length > 0 && fecha2.Length > 0) { consulta += " AND Fecha_T <= @fechaMayor"; }
            else if (fecha2.Length > 0) { consulta += " WHERE Fecha_T <= @fechaMayor"; }

            try
            {
                datos.openConexion();
                datos.setearConsulta(consulta);

                if (fecha1.Length > 0) { datos.setearParametro("@fechaMenor", fecha1); }
                if (fecha2.Length > 0) { datos.setearParametro("@fechaMayor", fecha2); }
                datos.ejecutarLectura();
                dt.Load(datos.Lector);
            }
            catch (Exception ex) { throw ex; }
            finally { datos.closeConexion(); }

            return dt;
        }

        public DataTable TraerTodosLosTurnos(string legajo)
        {
            DataTable tabla = new DataTable();
            try
            {
                string consulta = "SELECT Id_Turno,Nro_Legajo_T,Dni_Paciente_T,Fecha_T,Hora_T,Asistencia_T,Observaciones FROM TURNOS WHERE Nro_Legajo_T = @numeroLegajo";
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("@numeroLegajo", legajo);
                datos.ejecutarLectura();
                tabla.Load(datos.Lector);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return tabla;
        }
        public DataTable TraerTurnosPorDNI(string legajo, string DNI)
        {
            DataTable tabla = new DataTable();
            try
            {
                string consulta = "SELECT Id_Turno,Nro_Legajo_T,Dni_Paciente_T,Fecha_T,Hora_T,Asistencia_T,Observaciones FROM TURNOS WHERE Nro_Legajo_T = @numeroLegajo AND Dni_Paciente_T = @DNI";
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("@numeroLegajo", legajo);
                datos.setearParametro("@DNI", DNI);
                datos.ejecutarLectura();
                tabla.Load(datos.Lector);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return tabla;
        }

        public DataTable TraerTurnosPorFecha(string legajo, string fecha)
        {
            DataTable tabla = new DataTable();
            try
            {
                string consulta = "SELECT Id_Turno,Nro_Legajo_T,Dni_Paciente_T,Fecha_T,Hora_T,Asistencia_T,Observaciones FROM TURNOS WHERE Nro_Legajo_T = @numeroLegajo AND Fecha_T = @fecha";
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("@numeroLegajo", legajo);
                datos.setearParametro("@fecha", fecha);
                datos.ejecutarLectura();
                tabla.Load(datos.Lector);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return tabla;
        }

        public int ModificarAsistencia(string idTurno, string asistencia,string observaciones)
        {
            int filasAfectadas;
            try
            {
                string consulta = "UPDATE TURNOS SET Asistencia_T = @asistencia , Observaciones = @observaciones where Id_Turno = @turno";
                datos.openConexion();
                datos.setearConsulta(consulta);
                datos.setearParametro("@asistencia", asistencia);
                datos.setearParametro("@observaciones", observaciones);
                datos.setearParametro("@turno", idTurno);
                filasAfectadas = datos.ejecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.closeConexion();
            }
            return filasAfectadas;
        }
    }
}
