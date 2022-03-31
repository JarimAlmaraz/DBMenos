using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PL.Controllers
{
    public class PagosController : Controller
    {
        [HttpGet]
        public ActionResult GetByIdCliente(int IdCliente)
        {
            ML.Result result = BL.Pagos.GetById(IdCliente);

            ML.Pagos pagos = new ML.Pagos();
            pagos.Clientes = new ML.Clientes();
            pagos.Clientes.IdCliente = IdCliente;
            if (result.Correct)
            {
                pagos.PagosList = result.Objects;
            }
            else
            {

            }
            return View(pagos);
        }

        [HttpGet]
        public ActionResult Form(int IdCliente)
        {
            ML.Pagos pago = new ML.Pagos();

            pago.Clientes = new ML.Clientes();

            pago.Clientes.IdCliente = IdCliente;

            return View(pago);
        }

        [HttpPost]
        public ActionResult Form(ML.Pagos pagos)
        {
            ML.Result result = new ML.Result();

            if (pagos.Clientes.IdCliente != 0)
            {
                result = BL.Pagos.Add(pagos);

                if (result.Correct)
                {
                    ViewBag.IdCliente = pagos.Clientes.IdCliente;
                    ViewBag.Mensaje = "El Pago se ha registrado correctamente";
                }
                else
                {
                    ViewBag.IdCliente = pagos.Clientes.IdCliente;
                    ViewBag.Mensaje = "El Pago no se ha registrado correctamente " + result.ErrorMessage;
                }
            }

            return PartialView("ModalPV");
        }

	}
}