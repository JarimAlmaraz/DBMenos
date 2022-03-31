using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ML
{
    public class Pagos
    {
        public int IdPago { get; set; }
        public ML.Clientes Clientes { get; set; }
        public double Monto { get; set; }
        public DateTime FechaPago { get; set; }
        public List<object> PagosList { get; set; }
    }
}
