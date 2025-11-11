using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico
    {
        //Atributos
        private int _Legajo;
        private Especialidad _Especialidad;
        private bool _Estado;

        //Constructor
        public Medico() { }

        //Getters y Setters
        public int getLegajo()
        {
            return _Legajo;
        }
        public void setLegajo(int legajo)
        {
            _Legajo = legajo;
        }

        public Especialidad getEspecialidad() 
        {
            return _Especialidad;
        }
        public void setEspecialidad(Especialidad especialidad)
        {
            _Especialidad = especialidad;
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
