using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Pagos
    {
        public static ML.Result GetById(int IdCliente)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.JAlmarazDBMenosEntities context = new DL.JAlmarazDBMenosEntities())
                {
                    var query = context.PagosGetByIdCliente(IdCliente).ToList();

                    result.Objects = new List<object>();

                    if (query != null)
                    {
                        foreach (var obj in query)
                        {
                            ML.Pagos pagos = new ML.Pagos();
                            pagos.IdPago = obj.IdPago;
                            pagos.Monto = obj.Monto.Value;
                            pagos.FechaPago = obj.Fecha_Pago.Value;

                            pagos.Clientes = new ML.Clientes();
                            pagos.Clientes.IdCliente = obj.IdCliente;
                            pagos.Clientes.Nombre = obj.Nombre;
                            pagos.Clientes.Telefono = obj.Telefono.Value;
                            pagos.Clientes.UltimoPago = obj.Fecha_Pago.Value;

                            result.Objects.Add(pagos);

                        }
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "Ocurrió un error al obtener los registros en la tabla Municipio";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
                result.Ex = ex;
            }

            return result;
        }

        public static ML.Result Add(ML.Pagos pagos)
        {
            ML.Result result = new ML.Result();

            try
            {
                using (DL.JAlmarazDBMenosEntities context = new DL.JAlmarazDBMenosEntities())
                {
                    var query = context.PagoAdd(pagos.Clientes.IdCliente, pagos.Monto);

                    if (query >= 1)
                    {
                        result.Correct = true;
                    }
                    else
                    {
                        result.Correct = false;
                        result.ErrorMessage = "No se insertó el registro";
                    }
                    result.Correct = true;
                }
            }
            catch (Exception ex)
            {
                result.Correct = false;
                result.ErrorMessage = ex.Message;
            }
            return result;
        }
    }
}
