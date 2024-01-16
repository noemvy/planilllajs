
function soloNumerosHT(event) {
    var code = event.keyCode;

    if (code >= 48 && code <= 57 || code == 8) { // 0-9 y Retroceso
        return true;
    } else {
        return false;
    }
}

function soloNumerosSH(event) {
    var code = event.keyCode;

    if (code >= 48 && code <= 57 || code == 8 || code == 190 || code == 37 || code == 38 || code == 39) { // 0-9 y Retroceso
        return true;
    } else {
        return false;
    }
}

function soloDecimal(evento) {
    var code = (evento.which) ? evento.wich : evento.keyCode;

    if (code == 8) {
        return true;
    } else if (code == 46 || code >= 48 && code <= 57) {
        return true
    } else {
        return false;
    }
}

function validarDecimal(input) {
    const texto = input.value;
    const puntosIngresados = texto.split('.').length - 1;

    if (puntosIngresados > 1) {
        input.value = texto.slice(0, -1);
    }

    const partesDespuesDelPunto = texto.split('.');
    if (partesDespuesDelPunto.length === 2 & partesDespuesDelPunto[1].length > 2) {
        input.value = partesDespuesDelPunto[0] + '.' + partesDespuesDelPunto[1].slice(0, 2);
    }
}

function limitarLongitud(input, maxLength) {
    if (input.value.length > maxLength) {
        input.value = input.value.slice(0, maxLength);
    }
}

function soloLetras(evento) {
    var code = (evento.which) ? evento.which : evento.keyCode;

    if (code == 8 || code == 32) { // Retroceso y espacio
        return true;
    } else if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122) || (code == 37 || code == 38 || code == 39)) { // Letras a-z y A-Z
        return true;
    } else if (code == 186) {
        return false;
    } else {
        return false;
    }
}

function validarNombre() {
    var long = document.getElementById("primerNombre").value.length;

    if (long <= 1) {
        document.getElementById("primerNombre").focus();
    }
}

function validarApellido() {
    var long = document.getElementById("primerApellido").value.length;

    if (long <= 1) {
        document.getElementById("primerApellido").focus();
    }
}

function validarNumero(input) {
    var valor = input.value;

    valor = valor.replace(/[^0-9]/g, '');

    input.value = valor;
}

function limitarDecimales(inputId) {  //FUNCION SOLO PERMITE HASTA EL 59
    const numeroInput = document.getElementById(inputId);
    let numero = numeroInput.value;
    const partes = numero.split(".");
    if (partes.length === 2) {
        const parteDecimal = partes[1];
        if (parteDecimal > 59) {
            partes[1] = "59"; // Limita la parte decimal a 59 si es mayor
            numero = partes.join(".");
        }
    }
    numeroInput.value = numero;
}

function habilitarCampos() { //esta funcion los habilita ascendentemente
    const provincias = document.getElementById("provincias");
    const tomo = document.getElementById("tomo");
    const asiento = document.getElementById("asiento");
    const primerNombre = document.getElementById("primerNombre");
    const segundoNombre = document.getElementById("segundoNombre");
    const primerApellido = document.getElementById("primerApellido");
    const segundoApellido = document.getElementById("segundoApellido");
    const apellidCasado = document.getElementById("apellidoCasado");
    const casado = document.getElementById("casado");

    if (provincias.value > 0) {
        tomo.disabled = false;
    } else {
        tomo.disabled = true;
    }

    if (tomo.value.length > 0) {
        asiento.disabled = false;
    } else {
        asiento.disabled = true;
    }

    if (asiento.value.length > 0) {
        primerNombre.disabled = false;
        segundoNombre.disabled = false;
        primerApellido.disabled = false;
    } else {
        primerNombre.disabled = true;
        segundoNombre.disabled = true;
        primerApellido.disabled = true;
    }

    if (primerApellido.value.length > 1) {
        segundoApellido.disabled = false;
    } else {
        segundoApellido.disabled = true;
    }

    if (casado.value == "si") {
        apellidoCasado.value = "de ";
    } else {
        apellidoCasado.value = "";
    }
}

// FUNCIONES PARA HORAS XTRAS, DIAS FESTIVOS, DOMINGOS
function calcularSalarioBase() {
    var hTrabajadas = parseFloat(document.getElementById("hTrabajadas").value) || 0;
    var sHoras = parseFloat(document.getElementById("sHoras").value) || 0;
    return hTrabajadas * sHoras;
}

//HORAS DIURNAS 
function calcularExtraDiurna() {
    var elementosSelect = document.getElementById("selectDiurno");
    var seleccionado = elementosSelect.options[elementosSelect.selectedIndex].value;

    var xtraD = parseFloat(document.getElementById("xtrasD").value) || 0;
    var salarioPorHora = parseFloat(document.getElementById("sHoras").value) || 0;
    var salarioHorasExtrasDiurnas = 0;

    switch (seleccionado) {
        case "1":
            salarioHorasExtrasDiurnas = (salarioPorHora * 1.25) * xtraD;
            break;
        case "2":
            salarioHorasExtrasDiurnas = (salarioPorHora * 1.25 * 1.75) * xtraD;
            break;
        default:
            break;
    }

    return salarioHorasExtrasDiurnas;
}

//HORAS NOCTURNAS

function calcularExtraNocturna() {
    var elementosSelect = document.getElementById("selectNocturno");
    var seleccionado = elementosSelect.options[elementosSelect.selectedIndex].value;

    var xtraN = parseFloat(document.getElementById("xtrasN").value) || 0;
    var salarioPorHora = parseFloat(document.getElementById("sHoras").value) || 0;
    var salarioHorasExtrasNocturnas = 0;

    switch (seleccionado) {
        case "1":
            salarioHorasExtrasNocturnas = (salarioPorHora * 1.50) * xtraN;
            break;
        case "2":
            salarioHorasExtrasNocturnas = (salarioPorHora * 1.50 * 1.75) * xtraN;
            break;
        default:
            break;
    }

    return salarioHorasExtrasNocturnas;
}

//HORAS MISTAXAS (DIURNAS - NOCTURAS)
function calcularExtraMixta() {
    var elementosSelect = document.getElementById("selectMixta");
    var seleccionado = elementosSelect.options[elementosSelect.selectedIndex].value;

    var xtraM = parseFloat(document.getElementById("xtrasM").value) || 0;
    var salarioPorHora = parseFloat(document.getElementById("sHoras").value) || 0;
    var salarioHorasExtrasMixtas = 0;

    switch (seleccionado) {
        case "1":
            salarioHorasExtrasMixtas = (salarioPorHora * 1.50) * xtraM;
            break;
        case "2":
            salarioHorasExtrasMixtas = (salarioPorHora * 1.50 * 1.75) * xtraM;
            break;
        case "3":
            salarioHorasExtrasMixtas = (salarioPorHora * 1.75) * xtraM;
            break;
        case "4":
            salarioHorasExtrasMixtas = (salarioPorHora * 1.75 * 1.75) * xtraM;
            break;
        default:
            break;
    }

    return salarioHorasExtrasMixtas;
}

//HABILITAR EL SELECT DE FIESTA NACIONAL
function habilitarFiestaNacional() {
    var trabajoFiestaNacional = document.getElementById("trabajoFiestaNacional");
    var fiestaNacionalOptions = document.getElementById("selectFiesta");

    if (trabajoFiestaNacional.value === "1") {
        fiestaNacionalOptions.style.display = "block";
    } else {
        fiestaNacionalOptions.style.display = "none";
        document.getElementById("selectFiesta").value = "0";
        return;

    }

}

//FIESTA NACIONAL
function calcularFiestaNacional() {
    var elementosSelect = document.getElementById("selectFiesta");
    var seleccionado = elementosSelect.options[elementosSelect.selectedIndex].value;

    var hTrabajadas = parseFloat(document.getElementById("hTrabajadas").value) || 0;
    var salarioFiesta = 0;


    switch (seleccionado) {
        case "1":
            salarioFiesta = hTrabajadas * 2.50; // Fiesta Nacional
            break;
        case "2":
            salarioFiesta = hTrabajadas * 2.50 * 1.25; // Fiesta Nacional Diurna
            break;
        case "3":
            salarioFiesta = hTrabajadas * 2.50 * 1.25 * 1.75; // Fiesta Nacional Diurna exceso de 3 horas
            break;
        case "4":
            salarioFiesta = hTrabajadas * 2.50 * 1.50; // Fiesta Nacional Nocturna
            break;
        case "5":
            salarioFiesta = hTrabajadas * 2.50 * 1.50 * 1.75; // Fiesta Nacional Nocturna exceso de 3 horas
            break;
        case "6":
            salarioFiesta = hTrabajadas * 2.50 * 1.50; // Fiesta Nacional Mixta Diurna - Nocturna
            break;
        case "7":
            salarioFiesta = hTrabajadas * 2.50 * 1.75; // Fiesta Nacional Mixta Nocturna - Diurna
            break;
        case "8":
            salarioFiesta = hTrabajadas * 2.50 * 1.50 * 1.75; // Fiesta Nacional Mixta Diurna - Nocturna exceso de 3 horas
            break;
        case "9":
            salarioFiesta = hTrabajadas * 2.50 * 1.75 * 1.75; // Fiesta Nacional Mixta Nocturna - Diurna exceso de 3 horas
            break;
    }
    return salarioFiesta;
}

//HABILITA EL SELECT DE DOMINGOS 
function habilitarDomingo() {
    var trabajoDomingo = document.getElementById("trabajoDomingo");
    var domingoOptions = document.getElementById("selectDomingo");

    if (trabajoDomingo.value === "1") {
        domingoOptions.style.display = "block";
    } else {
        domingoOptions.style.display = "none";
        document.getElementById("selectDomingo").value = "0";
        return;
    }
}

//DOMINGOS 
function calcularDomingo() {
    var elementosSelect = document.getElementById("selectDomingo");
    var seleccionado = elementosSelect.options[elementosSelect.selectedIndex].value;

    var hTrabajadas = parseFloat(document.getElementById("hTrabajadas").value) || 0;
    var salarioDomingo = 0;


    switch (seleccionado) {
        case "1":
            salarioDomingo = hTrabajadas * 1.50; // Domingo Semanal
            break;
        case "2":
            salarioDomingo = hTrabajadas * 1.50 * 1.25; // Domingo Semanal Diurno
            break;
        case "3":
            salarioDomingo = hTrabajadas * 1.50 * 1.25 * 1.75; // Domingo Diurno exceso 3 horas
            break;
        case "4":
            salarioDomingo = hTrabajadas * 1.50 * 1.50; //  Domingo Nocturno
            break;
        case "5":
            salarioDomingo = hTrabajadas * 1.50 * 1.50 * 1.75; // Domingo Nocturno exceso de 3 horas
            break;
        case "6":
            salarioDomingo = hTrabajadas * 1.50 * 1.50; // Domingo Mixto Diurno - Nocturno
            break;
        case "7":
            salarioDomingo = hTrabajadas * 1.50 * 1.50 * 1.75; // Domingo Mixto Diurno - Nocturno exceso de 3 horas
            break;
        case "8":
            salarioDomingo = hTrabajadas * 1.50 * 1.75; // Domingo Mixto Nocturno - Diurno
            break;
        case "9":
            salarioDomingo = hTrabajadas * 1.50 * 1.75 * 1.75; // Domingo Mixto Nocturno - Diurno exceso de 3 horas 
            break;
    }
    return salarioDomingo;
}

//SALARIO BRUTO TOTAL
function salarioBruto() {
    var salarioBase = calcularSalarioBase();
    var salarioConHorasExtrasDiurnas = calcularExtraDiurna();
    var salarioConHorasExtrasNocturnas = calcularExtraNocturna();
    var salarioConHorasExtrasMixtas = calcularExtraMixta();
    var salarioFiesta = calcularFiestaNacional();
    var salarioDomingo = calcularDomingo();

    var salarioTotal = (salarioBase + salarioConHorasExtrasDiurnas + salarioConHorasExtrasNocturnas + salarioConHorasExtrasMixtas + salarioFiesta + salarioDomingo);
    actualizarSalarioBruto(salarioTotal);
    seguroDescuento(salarioTotal);
    eduDescuento(salarioTotal);
    impuestoRenta(salarioTotal);
    console.log("diurna: "+salarioConHorasExtrasDiurnas);
}

function actualizarSalarioBruto(salarioBruto) {
    document.getElementById("sBruto").value = salarioBruto.toFixed(2);

}

//IMPUESTO SOBRE LA RENTA
function impuestoRenta(salarioBruto) {

    var anual = (salarioBruto * 12).toFixed(2);

    if (anual < 11000) {
        var impuesto = "0.00";

    } else if (anual >= 11000) {
        impuesto = (((anual - 11000) * 0.15) / 12).toFixed(2);
    } else if (anual >= 50000) {
        impuesto = (((anual - 50000) * 0.25) / 12).toFixed(2);
    }

    document.getElementById("renta").value = impuesto;
    totalDeducciones();
}
//DESCUENTO SEGURO SOCIAL
function seguroDescuento(salarioBruto) {

    var seguro = (salarioBruto * 0.0975).toFixed(2);

    document.getElementById("sSeguro").value = seguro;
    totalDeducciones();
}


//DESCUENTO SEGURO EDUCATIVO
function eduDescuento(salarioBruto) {

    var educativo = (salarioBruto * 0.0125).toFixed(2);

    document.getElementById("educa").value = educativo;
    totalDeducciones();
}

function otrosDescuentos() {
    var descuento1 = parseFloat(document.getElementById("otro_descuento1").value) || 0;
    var descuento2 = parseFloat(document.getElementById("otro_descuento2").value) || 0;
    var descuento3 = parseFloat(document.getElementById("otro_descuento3").value) || 0;

    var tOtrasDeducciones = (descuento1 + descuento2 + descuento3);

    totalDeducciones(tOtrasDeducciones);

}

//TOTAL DEDUCCIONES
function totalDeducciones() {
    var sSeguro = parseFloat(document.getElementById("sSeguro").value) || 0;
    var educa = parseFloat(document.getElementById("educa").value) || 0;
    var renta = parseFloat(document.getElementById("renta").value) || 0;
    //
    var descuento1 = parseFloat(document.getElementById("otro_descuento1").value) || 0;
    var descuento2 = parseFloat(document.getElementById("otro_descuento2").value) || 0;
    var descuento3 = parseFloat(document.getElementById("otro_descuento3").value) || 0;
    var tOtrasDeducciones = (descuento1 + descuento2 + descuento3);

    var deducciones = (sSeguro + educa + renta + tOtrasDeducciones).toFixed(2);

    if (document.getElementById("sBruto").value == 0) {
        document.getElementById("tDeducciones").value = "0.00";
    } else {
        document.getElementById("tDeducciones").value = deducciones;
    }

    salarioNeto();
}

//SALARIO NETO
function salarioNeto() {
    var sBruto = parseFloat(document.getElementById("sBruto").value) || 0;
    var deducciones = parseFloat(document.getElementById("tDeducciones").value) || 0;

    var salNeto = (sBruto - deducciones).toFixed(2);

    if (document.getElementById("sBruto").value == 0) {
        document.getElementById("sNeto").value = "0.00";

    } else {
        document.getElementById("sNeto").value = salNeto;
    }
}