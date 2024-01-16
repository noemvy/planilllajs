<%@ page language="java" %>
  <%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <% request.setCharacterEncoding("utf-8"); %>
      <!DOCTYPE html>
      <html lang="en">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Planilla</title>
        <script src="jquery3-4.min.js" type="text/javascript"></script>
        <script src="funciones.js"></script>
        <style>
          .encabezado {
            text-align: center;
            padding: 30px;
            padding-left: 10px;
            margin-bottom: 5px;

          }

          .encabezado h1 {
            font-family: Verdana, Geneva, Tahoma, sans-serif;
            color: #0e0d0d;
          }
          body {
            background-color: #5DADE2;
            font-family: Verdana, Geneva, Tahoma, sans-serif;
          }

          h1,
          h2 {
            text-align: center;
          }

          form {
            width: 90%;
            margin: 0 auto;
            padding: 20px;
            background-color: #D6EAF8;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          }

          table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
          }

          table,
          th,
          td {
            border: 1px solid #110303;
          }

          th,
          td {
            padding: 10px;
            text-align: left;
          }

          

          input[type="text"],
          select {
            width: calc(100% - 20px);
            padding: 8px;
            margin: 5px 0;
          }

          button[type="button"] {
            padding: 10px 50px;
            background-color: #4CAF50;
            color: rgb(21, 19, 19);
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 15px;
          }

          button[type="button"]:hover {
            background-color: #45a049;
          }
        </style>
      </head>

      <body>
        <form name="formulario" id="formulario">
          <div class="encabezado">
          <h1>Planilla de Trabajadores</h1>
          <h2>Ingrese los datos del empleado</h2>
          </div>
          <table>
            <tr>
              <td class="ancho" style="width: 250px;">
                <table>
              </td>
            <tr style="padding-right: 200px;">
              <td>
                <label>Cédula:</label>
              </td>
              <td>
                <select class=" primerCampo" name="provincias" id="provincias">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8" selected>8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                </select>
              </td>
              <td style="padding-left: 50px;">
                <label> Tomo: </label>
              </td>
              <td>
                <input type="text" name="tomo" id="tomo" onkeydown="return soloNumerosSH(event)"
                  oninput="limitarLongitud(this, 4);validarNumero(this);">
              </td>
              <td style="padding-left: 50px;">
                <label>Asiento:</label>
              </td>
              <td>
                <input  type="text" name="asiento" id="asiento" onkeydown="return soloNumerosSH(event)"
                  oninput="limitarLongitud(this, 5);validarNumero(this);">
              </td>
            </tr>
          </table>
          </td>
          </tr>
          <tr>
            <td>
              <table>
                <tr>
                  <td>
                    <label>Nombre:</label>
                  </td>

                  <td >
                    <input  type="text" name="primerNombre" id="primerNombre"
                      placeholder="Ingresa tu nombre" onkeydown="return soloLetras(event)" onblur="validarNombre()">
                  </td>
                  <td>
                    <input style="width: 115px;" type="text" name="segundoNombre" id="segundoNombre"
                      placeholder="Segundo nombre" onkeydown="return soloLetras(event)">
                  </td>
                  <td style="padding-left: 10px;">
                    <input type="text" name="primerApellido" id="primerApellido"
                      placeholder="Ingresa tu primer apellido" onkeydown="return soloLetras(event)"
                      onblur="validarApellido()">
                  </td>
                  <td style="padding-left: 10px;">
                    <input style="width: 175px;" type="text" name="segundoApellido" id="segundoApellido"
                      placeholder="Ingresa tu segundo apellido" onkeydown="return soloLetras(event)">
                  </td>
                </tr>
              </table>
              <table>
                <tr>
                  <td>
                    <label>Usa apellido de casado /a</label>
                  </td>
                  <td>
                    <select name="casado" id="casado">
                      <option value="1">Si</option>
                      <option value="2" selected>No</option>
                    </select>
                  </td>
                  <td> <input type="text" name="apellidoCasado" id="apellidoCasado" placeholder="Apellido casado /a"
                      onkeydown="return soloLetras(event)">
                  </td>
                </tr>
              </table>
              <table>
                <td>
                  <label>Estado Civil</label>
                </td>
                <td>
                  <select name="estado" id="estado">
                    <option value="1" selected>Soltero(a)</option>
                    <option value="2">Casado(a)</option>
                    <option value="3">Viudo(a)</option>
                    <option value="4">Divorciado(a)</option>
                  </select>
                </td>
          </tr>
          </table>
          </td>

          <br>

          <table>
            <tr>
              <td>
                <label>Horas Trabajadas:</label>
              </td>
              <td> <input type="text" name="hTrabajadas" id="hTrabajadas" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)" oninput="validarDecimal(this)"></td>
              <td>
                <label style="padding-left: 15px;">Salario Por Horas:</label>
              </td>
              <td> <input type="text" name="sHoras" id="sHoras" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)" oninput="salarioBruto(); return validarDecimal(this);">
              </td>

              <td>
                <label style="padding-left: 15px; color:rgb(212, 21, 165)">Salario Bruto:</label>
              </td>
              <td>
                <input type="text" id="sBruto" style="text-align: right;" disabled>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td>
                <input type="text" name="xtrasD" id="xtrasD" style="text-align: right;"
                  oninput="salarioBruto();return limitarDecimales('xtrasD');verificarExtras();validarDecimal(this)">
              </td>
              <td>
                <select name="sDiurno" id="selectDiurno" onchange="salarioBruto()">
                  <option value="1" selected>Extra Diurno</option>
                  <option value="2">Extra Diurno: Mas de 3 horas</option>
                </select>
              </td>
            </tr>
            <td>
              <input type="text" name="xtrasN" id="xtrasN" style="text-align: right;"
                onkeydown="return soloNumerosSH(event)"
                oninput="salarioBruto();return limitarDecimales('xtrasN');validarDecimal(this);verificarExtras()">
            </td>
            <td>
              <select name="sNocturno" id="selectNocturno" onchange="salarioBruto()">
                <option value="1" selected>Extra Nocturno</option>
                <option value="2">Extra Nocturno: Más de 3 horas</option>
              </select>
            </td>
            </tr>
            <tr>
              <td>
                <input type="text" name="xtrasM" id="xtrasM" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)"
                  oninput="salarioBruto();return limitarDecimales('xtrasM');validarDecimal(this);verificarExtras()">
              </td>
              <td>
                <select name="sMixta" id="selectMixta" onchange="salarioBruto()">
                  <option value="1" selected>Mixtas Diurna - Nocturno</option>
                  <option value="2">Mixtas Diurna - Nocturno: Más de 3 horas</option>
                  <option value="3">Mixtas Nocturno - Diurna</option>
                  <option value="4">Mixtas Nocturno - Diurna: Más de 3 horas</option>
                </select>
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td>
                <label for="trabajoFiesta">¿Trabajas un día de Fiesta Nacional?</label>
                <select name="sFiesta" id="trabajoFiestaNacional"
                  onchange="habilitarFiestaNacional(); return salarioBruto()">
                  <option value="1">Si</option>
                  <option value="2" selected>No</option>
                </select>
              </td>
            </tr>
          </table>

          <td>
            <select id="selectFiesta" style="display:none" onchange="salarioBruto()">
              <option value="0" hidden>Eliga Una opción</option>
              <option value="1">Fiesta Nacional</option>
              <option value="2">Fiesta Nacional Diurna</option>
              <option value="3">Fiesta Nacional Diurna: Más de 3 horas</option>
              <option value="4">Fiesta Nacional Nocturno</option>
              <option value="5">Fiesta Nacional Nocturno: Más de 3 horas</option>
              <option value="6">Fiesta Nacional Mixta Diurna - Nocturno</option>
              <option value="7">Fiesta Nacional Mixta Nocturno - Diurno</option>
              <option value="8">Fiesta Nacional Mixta Diurna - Nocturna: Más de 3 horas</option>
              <option value="9">Fiesta Nacional Mixta Nocturna - Diurna: Más de 3 horas</option>
            </select>
          </td>
          </tr>


          <table>
            <tr>
              <td>
                <label>¿Trabajaste un Domingo?</label>
                <select name="sDomingo" id="trabajoDomingo" onchange="habilitarDomingo(); return salarioBruto()">
                  <option value="1">Si</option>
                  <option value="2" selected>No</option>
                </select>
              </td>
            </tr>
          </table>
          <td>
            <select id="selectDomingo" style="display:none;" oninput="salarioBruto()">
              <option value="0" hidden>Eliga una opción</option>
              <option value="1">Domingo Semanal </option>
              <option value="2">Domingo Diurno </option>
              <option value="3">Domingo Diurno: Más de 3 horas</option>
              <option value="4">Domingo Nocturno</option>
              <option value="5">Domingo Nocturno: Más de 3 horas</option>
              <option value="6">Domingo Mixto Diurno - Nocturno</option>
              <option value="7">Domingo Mixto Diurno - Nocturno: Más de 3 horas</option>
              <option value="8">Domingo Mixto Nocturno - Diurno</option>
              <option value="9">Domingo Mixto Nocturno - Diurno: Más de 3 horas</option>
            </select>
          </td>
          </tr>
          </table>

          <table>
            <tr>
              <td>
                <label>Seguro Social:</label>
              </td>
              <td> <input type="text" name="sSeguro" id="sSeguro" style="text-align: right;"
                  oninput="seguroDescuento()"></td>
              <td>
                <label style="padding-left: 15px;">Seguro Educativo:</label>
              </td>
              <td> <input type="text" name="educa" id="educa" style="text-align: right;" oninput="eduDescuento()">
              </td>
              <td>
                <label style="padding-left: 15px;">Impuesto Sobre la Renta:</label>
              </td>
              <td> <input type="text" name="renta" id="renta" style="text-align: right;" oninput="impuestoRenta()">
              </td>
            </tr>
          </table>
          <br>
          <table>
            <tr>
              <td>
                <label>Otros Descuentos 1:</label>
              <td> <input type="text" name="desc1" id="otro_descuento1" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)" oninput="totalDeducciones(); return validarDecimal(this)">
              </td>
              </td>
              <td>
                <label>Otros Descuentos 2:</label>
              </td>
              <td> <input type="text" name="desc2" id="otro_descuento2" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)" oninput="totalDeducciones(); return validarDecimal(this)">
              </td>
              <td>
                <label>Otros Descuentos 3:</label>
              </td>
              <td> <input type="text" name="desc3" id="otro_descuento3" style="text-align: right;"
                  onkeydown="return soloNumerosSH(event)" oninput="totalDeducciones(); return validarDecimal(this)">
              </td>
            </tr>
          </table>
          <br>
          <table>
            <td>
              <label style="color:blue">Total Deducciones:</label>
            </td>
            <td> <input type="text" id="tDeducciones" style="text-align: right;" oninput="totalDeducciones()" disabled>
            </td>
            <td>
              <label style="color: green;">Salario Neto:</label>
            </td>
            <td> <input type="text" id="sNeto" style="text-align: right;" oninput="salarioNeto()" disabled></td>

          </table>
          <button type="button" id="guardarBtn" onclick="verificarExtras(); enviarFormulario();">
            <span style="display: inline-block; text-align: center;">Enviar</span>
          </button>

        </form>
        </div>
        <script>
          function verificarExtras() {
            var horasExtrasDiurnas = parseFloat(document.getElementById("xtrasD").value) || 0;
            var horasExtrasNocturnas = parseFloat(document.getElementById("xtrasN").value) || 0;
            var horasExtrasMixtas = parseFloat(document.getElementById("xtrasM").value) || 0;

            var totalHorasExtras = horasExtrasDiurnas + horasExtrasNocturnas + horasExtrasMixtas;

            if (totalHorasExtras > 15) {
              alert("El total de horas extras no puede exceder las 15 horas");
              return false; // Esto evita que se envíe el formulario
            }
            return true; // Se puede enviar el formulario si no se supera el límite
          }

          function enviarFormulario() {
            var validacionExtras = verificarExtras(); // Llamada a verificarExtras()

            if (validacionExtras) {
              // Realizar otras operaciones o enviar el formulario si la validación es exitosa
              // Ejemplo:
              $.ajax({
                type: "POST",
                url: "grabar.jsp",
                data: $("form").serialize(),
                success: function () {
                  document.getElementById("formulario").reset();
                  alert("REGISTRO GRABADO");
                }
              });
            } else {
              // No se cumplieron las validaciones, se puede tomar alguna acción adicional o mostrar un mensaje de error.
              alert("Las horas extras exceden el límite.");
            }
          }

        </script>
      </body>

      </html>