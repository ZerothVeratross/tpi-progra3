using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Paciente : Persona
    {
        //Atributos 
        private bool _Estado;

        ///Constructores
        public Paciente() { }

        //getter y setter

        public bool getEstado()
        {
            return _Estado;
        }

        public bool setEstado(bool estado)
        {
            return _Estado = estado;
        }
        

    }
}
