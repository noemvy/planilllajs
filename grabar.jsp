<!-- en la directiva page observamos el import="java.sql.*"-->
<!-- esta es la analogia en java a importar paquetes y/o clases-->
<!-- en el paquete java.sql.* estan las clases necesarias-->
<!-- para la conexion a la bd mysql -->
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%
	/*conexion sera nuestra conexion a la bd*/
	Connection conexion=null;
	
	String mensaje="desconectado";
	String msg = "Hi";
	out.print("msg");
	
	/*parametros para la conexion*/
	String driver	= "com.mysql.jdbc.Driver";
	String url		= "jdbc:mysql://localhost:3306/d4";
	String usuario	= "d42023";
	String clave	= "ds4";
	/*procedimiento de la conexion*/
	try{
		Class.forName("com.mysql.jdbc.Driver");
		conexion = DriverManager.getConnection(url,usuario,clave);
		String pre 	= request.getParameter("provincias");
		String tom 	= request.getParameter("tomo");
		String asi 	= request.getParameter("asiento");
		String ced  = pre+"-"+tom+"-"+asi;
		String nom1 = request.getParameter("primerNombre");
		String nom2 = request.getParameter("segundoNombre");	
		String ape1 = request.getParameter("primerApellido");
		String ape2 = request.getParameter("segundoApellido");
		String esta = request.getParameter("estado");
		String ape3 = request.getParameter("apellidoCasado");
		String uaca = request.getParameter("casado");
		String htra = request.getParameter("hTrabajadas");
		String shor = request.getParameter("sHoras");
		String xtrasD = request.getParameter("xtrasD");
		String sDiurno = request.getParameter("sDiurno");
		String xtrasN = request.getParameter("xtrasN");
		String sNocturno = request.getParameter("sNocturno");
		String xtrasM = request.getParameter("xtrasM");
		String sMixta = request.getParameter("sMixta");
		String sFiesta = request.getParameter("sFiesta");
		String sDomingo = request.getParameter("sDomingo");
		String ssoc = request.getParameter("sSeguro");
		String sedu = request.getParameter("educa");
		String iren = request.getParameter("renta");
		String ded1 = request.getParameter("desc1");
		String ded2 = request.getParameter("desc2");
		String ded3 = request.getParameter("desc3");

        Statement st=conexion.createStatement();
        int i=st.executeUpdate("insert into generales(prefijo,tomo,asiento,cedula,nombre1,nombre2,apellido1,apellido2,estado_civil,apellido_casada,usa_apellido_casada,htrabajadas,shora,seguro_social,seguro_educativo,impuesto_renta,descuento1,descuento2,descuento3,ExtraD,TipoXtraD,ExtraN,TipoXtraN,ExtraM,TipoXtraM,TrabajoFeriado,TrabajoDomingo) values ('"+pre+"','"+tom+"','"+asi+"','"+ced+"','"+nom1+"','"+nom2+"','"+ape1+"','"+ape2+"','"+esta+"','"+ape3+"','"+uaca+"','"+htra+"','"+shor+"','"+ssoc+"','"+sedu+"','"+iren+"','"+ded1+"','"+ded2+"','"+ded3+"','"+xtrasD+"','"+sDiurno+"','"+xtrasN+"','"+sNocturno+"','"+xtrasM+"','"+sMixta+"','"+sFiesta+"','"+sDomingo+"')");		
		
		/*guardando la conexion en la session*/
		session.setAttribute("conexion",conexion);
		msg=ssoc;
		conexion.close();
	} 
	catch (Exception ex){
		mensaje=ex.toString(); 
	}
	
	if(conexion==null){
		mensaje="desconectado";
	}
%>