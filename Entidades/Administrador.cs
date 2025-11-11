using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Administrador
    {
        //atributos
        private string _IdAdmin;
        private string _Usuario;
        private string _Contrasenia;

        //constructores
        public Administrador() { }

        public Administrador(string usuario, string contrasenia)
        {
            _Usuario = usuario;
            _Contrasenia = contrasenia;
        }
        public Administrador(string id, string usuario, string contrasenia)
        {
            _IdAdmin = id;
            _Usuario = usuario;
            _Contrasenia = contrasenia;
        }
        //getters y setters

        public string getIdAdmin()
        {
            return _IdAdmin;
        }
        public void setIdAdmin(string idAdmin)
        {
            _IdAdmin = idAdmin;
        }

        public string getUsuario()
        {
            return _Usuario;
        }
        public void getUsuario(string usuario)
        {
            _Usuario = usuario;
        }

        public string getContrasenia()
        {
            return _Contrasenia;
        }
        public void setContrasenia(string contrasenia)
        {
            _Contrasenia = contrasenia;
        }
    }
}
