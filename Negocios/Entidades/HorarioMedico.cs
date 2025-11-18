using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class HorarioMedico
    {
        private string _LegajoMedico;
        private string _IdDia;
        private string _HoraInicio;
        private string _HoraFin;

        public HorarioMedico() { }
        public HorarioMedico(string legajoMedico, string idDia, string horaInicio, string horaFin)
        {
            _LegajoMedico = legajoMedico;
            _IdDia = idDia;
            _HoraInicio = horaInicio;
            _HoraFin = horaFin;
        }

        public string getLegajo()
        {
            return _LegajoMedico;
        }
        public void setLegajo(string legajo)
        {
            _LegajoMedico = legajo;
        }

        public string getIdDia()
        {
            return _IdDia;
        }
        public void setIdDia(string idDia)
        {
            _IdDia = idDia;
        }

        public string getHoraInicio()
        {
            return _HoraInicio;
        }
        public void setHoraInicio(string horaInicio)
        {
            _HoraInicio= horaInicio;
        }

        public string getHoraFin()
        {
            return _HoraFin;
        }
        public void setHoraFin(string horaFin)
        {
            _HoraFin = horaFin;
        }
    }
}
