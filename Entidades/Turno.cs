using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        //Atributos
        public string _IdTurno;
        public string _LegajoMedico;
        public string _DniPaciente;
        public DateTime _Fecha;
        public string _Hora;
        public string _Asistencia; //Asistio, no asistio, cancelo, reprogramo
        public string _Observaciones;
        public bool _Estado;

        //Constructores
        public Turno() { }

        public Turno(string idTurno, string legajoMedico, string dniPaciente, DateTime fecha, string hora, string asistencia, string observaciones, bool estado)
        {
            _IdTurno = idTurno;
            _LegajoMedico = legajoMedico;
            _DniPaciente = dniPaciente;
            _Fecha = fecha;
            _Hora = hora;
            _Asistencia = asistencia;
            _Observaciones = observaciones;
            _Estado = estado;
        }

        //getters y setters

        public string getIdTurno()
        {
            return _IdTurno;
        }
        public void setIdTurno(string idTurno)
        {
            _IdTurno = idTurno;
        }

        public string getLegajoMedico()
        {
            return _LegajoMedico;
        }
        public void setLegajoMedico(string legajoMedico)
        {
            _LegajoMedico = legajoMedico;
        }

        public string getDniPaciente()
        {
            return _DniPaciente;
        }
        public void setDniPaciente(string dniPaciente)
        {
            _DniPaciente = dniPaciente;
        }

        public DateTime getFecha()
        {
            return _Fecha;
        }
        public void setFecha(DateTime fecha)
        {
            _Fecha= fecha;
        }

        public string getHora()
        {
            return _Hora;
        }
        public void setHora(string hora)
        {
            _Hora = hora;
        }
        
        public string getAsistencia()
        {
            return _Asistencia;
        }
        public void setAsistencia(string asistencia)
        {
            _Asistencia = asistencia;
        }

        public string getObservaciones()
        {
            return _Observaciones;
        }
        public void setObservaciones(string observaciones) 
        {
            _Observaciones = observaciones;
        }

        public bool getEstado()
        {
            return _Estado;
        }
        public void setEstado(bool estado)
        {
            _Estado = estado;
        }
    }
}
