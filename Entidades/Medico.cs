using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Medico : Persona
    {
        //Atributos
        private string _Legajo;
        private Especialidad _Especialidad;
        private bool _Estado;
        private string _Usuario;
        private string _Contrasenia;
        //Constructor
        public Medico() { }

        public Medico(String user, string password)
        {
            _Usuario = user;
            _Contrasenia = password;
        }

        public Medico(string legajo, Especialidad especialidad, bool estado, string usuario, string contrasenia,
            //parametros de Persona
            string dni, string nombre, string apellido, string sexo,
            string nacionalidad, DateTime fechaNacimiento, string direccion,
            Provincia provincia, Localidad localidad, string correoElectronico, string telefono)
            : base(dni, nombre, apellido, sexo, nacionalidad, fechaNacimiento, direccion, provincia,
                  localidad, correoElectronico, telefono)
        {
            _Legajo = legajo;
            _Especialidad = especialidad;
            _Estado = estado;
            _Usuario = usuario;
            _Contrasenia= contrasenia;
        }

        //Getters y Setters
        public string getLegajo()
        {
            return _Legajo;
        }
        public void setLegajo(string legajo)
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

        public string getUsuario()
        {
            return _Usuario;
        }
        public void setUsuario(string user)
        {
            _Usuario = user;
        }

        public string getContrasenia()
        {
            return _Contrasenia;
        }
        public void setContrasenia(string contra)
        {
            _Contrasenia= contra;
        }
    }
}
