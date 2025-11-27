using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Persona
    {
        //Atributos
        private string _Dni;
        private string _Nombre;
        private string _Apellido;
        private string _Sexo;
        private string _Nacionalidad;
        private DateTime _FechaNacimiento;
        private string _Direccion;
        private Provincia _ProvinciaPersona;
        private Localidad _LocalidadPersona;
        private string _CorreoElectronico;
        private string _Telefono;

        //Constructores
        public Persona()
        {

        }

        public Persona(string dni, string nombre, string apellido, string sexo, string nacionalidad, DateTime fechaNacimiento, string direccion, Provincia provincia, Localidad localidad, string correoElectronico, string telefono)
        {
            _Dni = dni;
            _Nombre = nombre;
            _Apellido = apellido;
            _Sexo = sexo;
            _Nacionalidad = nacionalidad;
            _FechaNacimiento = fechaNacimiento;
            _Direccion = direccion;
            _ProvinciaPersona = provincia;
            _LocalidadPersona = localidad;
            _CorreoElectronico = correoElectronico;
            _Telefono = telefono;
        }

        //Setters y getters

        public string getDni() 
        { 
            return _Dni;
        }
        public void setDni(string dni)
        {
            _Dni = dni; 
        }

        public string getNombre() 
        {
            return _Nombre;
        }
        public void setNombre(string nombre)
        {
            _Nombre = nombre;
        }

        public string getApellido()
        {
            return _Apellido;
        }
        public void setApellido(string apellido) 
        {
            _Apellido = apellido;
        }

        public string getSexo() 
        {
            return _Sexo;
        }
        public void setSexo(string sexo)
        {
            _Sexo = sexo;
        }

        public string getNacionalidad()
        {
            return _Nacionalidad;
        }
        public void setNacionalidad(string nacionalidad)
        {
            _Nacionalidad = nacionalidad;
        }

        public DateTime getFechaNacimiento() 
        { 
            return _FechaNacimiento;
        }
        public void setFechaNacimiento(DateTime fechaNacimiento)
        {
            _FechaNacimiento = fechaNacimiento;
        }

        public string getDireccion() 
        {
            return _Direccion;
        }

        public void setDireccion(string direccion)
        {
            _Direccion = direccion;
        }

        public Provincia getProvincia()
        {
            return _ProvinciaPersona;
        }
        public void setProvincia(Provincia provincia)
        {
            _ProvinciaPersona = provincia;
        }
        public Localidad getLocalidad()
        {
            return _LocalidadPersona;
        }
        public void setLocalidad(Localidad localidad)
        {
            _LocalidadPersona = localidad;
        }

        public string getCorreoElectronico()
        {
            return _CorreoElectronico;
        }

        public void setCorreoElectronico(string correoElectronico)
        {
            _CorreoElectronico = correoElectronico;
        }

        public string getTelefono()
        {
            return _Telefono;
        }
        public void setTelefono(string telefono)
        {
            _Telefono = telefono;
        }

        public string NombreCompleto
        {
            get { return $"{getApellido().Trim()} {getNombre().Trim()}"; }
        }
    }
}
