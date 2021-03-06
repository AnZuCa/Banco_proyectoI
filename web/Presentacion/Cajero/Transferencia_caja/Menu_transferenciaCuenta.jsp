<%-- 
    Document   : Menu_depositoCuenta
    Created on : 20/03/2020, 03:52:39 PM
    Author     : andre
--%>

<%@page import="java.util.Map"%>
<%@page import="banca.Presentacion.Cajero.Transferencia_caja.Model"%>
<%@page import="banca.Logic.Cuenta"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Model model = (Model) request.getAttribute("model");
    Cuenta cuenta = null;
    if(model!=null)
    {   cuenta = model.getCurrent();}
    
%>
<%
    Map<String,String> errores=null;
if(model!=null)
 errores = (Map<String,String>) request.getAttribute("errores"); 
%>
<!DOCTYPE html>
<html>
    <head>
  <%@ include file="/Presentacion/link.jsp" %>
        <title>Retiro-Cliente</title>
    </head>
    <body>
        <%@ include file="/Presentacion/Encabezado.jsp" %>
        <% if (cuenta==null){%>
        <form  action="/Banco_proyectoI/Presentacion/Cajero/Transferencia/showcuenta" method="POST">
              <p>Numero cuenta:</p><input  type="text" name="txtNumero" placeholder="<%=this.placeholder("txtNumero", errores, "Numero") %>">
               <input  type="Submit" name="Enviar" value="Enviar">    
        </form>
        <%}%>
         <%if(cuenta!=null){%>
           <form class="form_inicio" action="/Banco_proyectoI/Presentacion/Cajero/Transferencia/verificacion" method="POST">
              <p>Numero cuenta:</p><input  type="text" name="Buttoncuenta" value="<%=cuenta.getNumero()%>" readonly>
               <p>Cedula propietario:</p><input  type="text" name="txtCedula" value="<%=cuenta.getPersona().getCedula() %>" readonly>
               <p>Nombre propietario:</p><input  type="text" name="txtNombre" value="<%=cuenta.getPersona().getNombre() %>" readonly>
                <p>Moneda de cuenta:</p><input  type="text" name="txtMoneda" value="<%=cuenta.getMoneda() %>" readonly>
                <p>Numero cuenta a transferir:</p><input  type="text" name="txtCuentafavorita" placeholder="<%=this.placeholder("txtCuentafavorita", errores, "Cuenta a transferir") %>">
               <p>Monto:</p><input  type="text" name="txtMonto" placeholder="<%=this.placeholder("txtMonto", errores, "Monto a transferir") %>">
            <p>Descripcion:</p><input  type="text" name="txtDescripcion" placeholder="Descripcion"> <br> <br>
               <center><input  type="Submit" name="Enviar" value="Enviar">  </center>  
         </form>
         <%}%><%@ 
         include file="/Presentacion/Footer.jsp" %>
    </body>
</html>
<%!
   private String placeholder(String campo, Map<String,String> errores,String mensaje){
      if ( (errores!=null) && (errores.get(campo)!=null) )
        return errores.get(campo);
      else
        return mensaje;
    }
%>