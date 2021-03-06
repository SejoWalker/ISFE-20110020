<%-- 
    Document   : Registro
    Created on : 23/01/2012, 03:09:10 PM
    Author     : kawatoto
--%>

<%@page import="org.w3c.dom.Document"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="dao.*" %>
<%
    String valor = (String) request.getParameter("valor");
%>
<!DOCTYPE html>
<html>
    <head>
        <title> ISFE - Registro </title>
        <link rel="stylesheet" type="text/css" href="estilo/style.css" />
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.8.17.custom.min.js"></script>
        <script type="text/javascript" src="js/jquery.MultiFile.js"></script>
        <script type="text/javascript" src="js/jquery.menu.js"></script>
        <script src="/ISFE-20110020/js/jquery.maskedinput.js"></script>
        <!--Este script es para la validacion de los formularios-->
        <script src="js/jquery.validate.js"></script>
         <script src="js/ui/jquery.ui.dialog.js"></script>
        <script src="js/jquery.perfil.js"></script>


        <script type="text/javascript">
            $(document).ready(function(){
                
                if("<%=valor%>" == "Registro"){
                    $("#mensajeConfirmarRegistro").text("Tu Registro se ha completado!");
                    $("#ConfirmarRegistro").dialog("open");
                }
                                       
                $("#formulario_registro").validate({
                    rules: {
                        passwordUsuario:{
                            required: true,
                            minlength: 8
                        },
                        rePasswordUsuario: {
                            required: true,
                            minlength: 8,
                            equalTo: "#passwordUsuario"
                        }
                            
                    },
                    messages:{
                        passwordUsuario:{
                            required: "Ingresa una contaseña de acceso",
                            minlength: "Ingresa más de 8 caracteres"
                        },
                        rePasswordUsuario: {
                            required: "Confirma tu contraseña de acceso",
                            minlength: "Ingresa más de 8 caracteres",
                            equalTo: "Las contraseñas deben ser iguales"
                        }
                            
                    }
                });
            });
            
            function GuardarArchivo(){
                document.upform.submit();
            }
            
        </script>

    </head>
    <!--Dialogo de Confirmar Registro-->
    <div id="ConfirmarRegistro" title="ISFE- Registro de Usuario">
        <p class="validateTips">
          <img src="images/confirmar.jpg" />
          &nbsp;  
          <label class="texto" id="mensajeConfirmarRegistro"></label>
        </p>
    </div>
    <!--Termina el dialogo de Confirmacion de Registro-->
    <!--Dialogo de Confirmar Datos-->
    <div id="ConfirmarDatos" title="ISFE- Registro de Usuario">
        <p class="validateTips">
            <label>
                <img src="images/important.gif" />
                &nbsp;  
                Verifica que tus datos este correctos:
            </label>
        </p>
        <form>
            <center><table class="table1">
                    <tbody>
                        <tr>
                            <th scope="row">Razón Social</th>
                            <td id="confirmarRazonSocial"><span class="check"></span></td>

                            <th scope="row">RFC</th>
                            <td id="confirmarRFC"><span class="check"></span></td>
                        </tr>
                        <tr>
                            <th scope="row">Teléfono</th>
                            <td id="confirmarTelefono"><span class="check"></span></td>

                            <th scope="row">Mail</th>
                            <td id="confirmarMail"><span class="check"></span></td>
                        </tr>
                        <tr>
                            <th scope="row">Dirección</th>
                            <td id="confirmarDireccion"><span class="check"></span></td>

                            <th scope="row">Referencia</th>
                            <td id="confirmarReferencia"><span class="check"></span></td>

                        </tr>
                        <tr>
                            <th scope="row">Colonia</th>
                            <td id="confirmarColonia"><span class="check"></span></td>

                            <th scope="row">Municipio</th>
                            <td id="confirmarMunicipio"><span class="check"></span></td>

                        </tr>
                        <tr>
                            <th scope="row">Estado</th>
                            <td id="confirmarEstado"><span class="check"></span></td>

                            <th id="CUPRConfirmacion" style="display: none" scope="row">CURP</th>
                            <td id="confirmarCURP" style="display: none"><span class="check"></span></td>

                        </tr>
                    </tbody>
                </table></center>
        </form>
    </div>
    <!--Termina el dialogo de Confirmar Datos-->
    <center>
        <div class="principal">
            <div class="header">
                <div class="logo"><a href="index.jsp" ><img src="images/logo1.png" alt="ISFE" height="164"/></a></div>
            </div>
            <div class="contenido_principal">
                <!-- Comienza Menu --> 
                <div class="menu">
                    <ul>
                        <li><a href="Uso.jsp"><img src="images/icons/valida_ico.png" alt=""/>¿C&oacute;mo usar ISFE?</a></li>
                        <li><a href="contacto.jsp"><img src="images/icons/contacto_ico.png" alt=""/>Contacto</a></li>
                        <li><a href="registro.jsp"><img src="images/icons/registro_ico.png" alt=""/> Registro</a></li>
                        <li><a href="index.jsp"><img src="images/icons/ingreso_ico.png" alt=""/> Ingreso</a></li>
                    </ul>
                </div>
                <!-- Termina Menu -->  
                <br><br>
                <div class="titulo_pagina">Registro</div>
                <center>
                    <!--Comienza el formulario-->	

                    <div id="tabs">
                        <ul>
                            <li><a href="#tabs-1">Datos de Usuario</a></li>
                            <li><a id="FIELCSDUsuario" href="#tabs-2">Cargar FIEL y CSD</a></li>
                        </ul>
                        <div id="tabs-1">
                            <font color="red">Los campos marcados con (*) son obligatorios</font><br><br>
                            <form action="" id="formulario_registro" method="post">

                                <table border="0">
                                    <tbody>
                                        <tr>
                                            <td rowspan="21"><img src="images/formularios/add_user.png"/></td>
                                            <td>Tipo de Contribuyente*:</td> 
                                            <td>

                                                <input type="radio"  class="required" id="personaMoral" name="contribuyenteUsuario" value="Moral" onclick="Contribuyente(this.value)">Persona Moral
                                                &nbsp; &nbsp; 
                                                <input type="radio"  id="personaFisica" name="contribuyenteUsuario" value="Fisica" onclick="Contribuyente(this.value)">Persona Fisica

                                            </td>
                                        </tr>
                                        <tr style="display:none" id="NombreUser">
                                            <td>Nombre*:</td>
                                            <td><input type="text" maxlength="60" id="nombreUsuario" name="nombre" class="required" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr style="display:none" id="PaternoUser">
                                            <td>Apellido Paterno*:</td>
                                            <td><input type="text" maxlength="60" id="APaternoUsuario" name="apPaterno" class="required" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr style="display:none" id="MaternoUser">
                                            <td>Apellido Materno*:</td>
                                            <td><input type="text" maxlength="60" id="AMaternoUsuario" name="apMaterno" class="required" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr style="display:none" id="CURPUser">
                                            <td>CURP:</td>
                                            <td><input type="text" minlength="9" id="CURPUsuario" name="curp" class="required" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr style="display:none" id="RazonUser">
                                            <td>Razón Social*:</td>
                                            <td><input type="text" maxlength="180" id="RazonUsuario"  name="razonsocial" class="required" size="25" style="text-transform:uppercase" /></td>

                                        </tr>
                                        <tr>
                                            <td>RFC*:</td>
                                            <td><input type="text" class="required" minlength="9" onblur="validarRFC()" id="UsuarioRFC" name="ClienteRFC" size="25" style="text-transform:uppercase"/>
                                                <label id="ErrorRFCUsuario"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tel&eacute;fono*:</td>
                                            <td><input type="text" id="UsuarioTelefono" class="required" name="telefono" maxlength="16" size="25" onkeyup="OnlyNumber(this.value,this)" /></td>
                                        </tr>
                                        <tr>
                                            <td>Calle*:</td>
                                            <td><input type="text" id="UsuarioCalle" class="required" name="calle" maxlength="60" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr>
                                            <td>Num. Exterior*:</td>
                                            <td><input type="text" id="UsuarioExterior" class="required digits" name="numexterior" maxlength="5" size="25" onkeyup="OnlyNumber(this.value,this)" /></td>
                                        </tr>
                                        <tr>
                                            <td>Num. Interior:</td>
                                            <td><input type="text" id="UsuarioInterior" name="numinterior" style="text-transform:uppercase" maxlength="5" size="25" /></td>
                                        </tr>
                                        <tr>
                                            <td>Código Postal*:</td>
                                            <td><input type="text" id="codigoPostal" class="required" name="codigoPostal" size="25" maxlength="5" onblur="BuscarCPRegistro()" onkeyup="OnlyNumber(this.value,this)"  />
                                                <label id="ErrorCodigoPostalUsuario"></label>
                                            </td>                                           
                                        </tr>
                                        <tr>
                                            <td>Estado*:</td>
                                            <td><input type="text" id="estado" name="estado" readonly="readonly" size="25" ></td> 
                                        </tr>
                                        <tr>
                                            <td>Delegaci&oacute;n/Municipio*:</td>
                                            <td>
                                                <select id="municipio" name="municipio" >

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Colonia/Localidad*:</td>
                                            <td>
                                                <select id="localidad" name="localidad" >

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Referencia*:</td>
                                            <td><input type="text" id="referenciaUsuario" class="required" name="referencia" maxlength="25" size="25" style="text-transform:uppercase" /></td>
                                        </tr>
                                        <tr>
                                            <td>E-mail*:</td>
                                            <td><input type="text" id="emailUsuario" class="required email" name="email" maxlength="45" value="" size="25" /></td>
                                        </tr>
                                        <tr>
                                            <td>Contrase&ntilde;a*:</td>
                                            <td><input type="password" id="passwordUsuario" name="passwordUsuario" size="25"  maxlength="20" /></td>
                                        </tr>
                                        <tr>
                                            <td>Repita Contrase&ntilde;a*:</td>
                                            <td><input type="password" id="rePasswordUsuario" name="rePasswordUsuario" size="25"  maxlength="20" /></td>
                                        </tr>
                                        <tr align="center">
                                            <td colspan="2"><input type="reset" width="50" value="Cancelar" name="cancelar" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false"/> <input  id="siguienteRegistro"type="submit" width="50" value="Siguiente" name="siguiente" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                        <div id="tabs-2">
                            <label> Selecciona los archivos de FIEL y CSD a subir </label>
                            <br><br>
                            <form method="post" action="SubirArchivo" name="upform" enctype="multipart/form-data">
                                <div style="display: none" ><input type="text" name="idUsuario" id="idUsuarioArchivos" /></div>
                                <table width="60%" >
                                    <tr rowspan="2">
                                        <td  width="40%" >
                                            Archivo .KEY de la FIEL
                                            <input type="file" name="fileupload" id="archivoREQ" onclick="LimpiarError()" />
                                            <input type="hidden" name="mucho" value="upload"/>
                                            <label id="ErrorArchivoREQ"></label>     
                                        </td>
                                        
                                        <td width="40%">
                                            Clave Privada de FIEL<input type="password" id="llavePrivada" name="llavePrivada" />
                                        </td>
                                    </tr>
                                </table>
                                <br/><br/>
                                <table width="60%">
                                    <tr>

                                        <td width="40%">
                                            Archivo .CER del CSD
                                            <input type="file" name="uploadfile" id="archivoCER" onclick="LimpiarError()"/>
                                            <input type="hidden" name="todo" value="upload"/>
                                            <label id="ErrorArchivoCER"></label>
                                        </td>
                                    </tr>
                                </table>
                                <br/>
                                <label id="ErrorSubirArchivos"></label>
                                <br/>
                                <div align="right">
                                    <input type="hidden" name="registro" value="registro"/>
                                    <input type="button" onclick="SubirKEY()" value="&nbsp; &nbsp; Subir Archivos &nbsp; &nbsp;" name="subirCSD" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false"/>
                                </div>
                            </form>
                            <script type="text/javascript">
                                                                                         
                                $(function(){
                                    $("#archivoREQ").MultiFile({
                                        accept:'key', max:1, STRING: {
                                            remove:'X',
                                            selected:'Selecionado: $file',
                                            denied:'REQ/Archivo de extención $ext invalido!',
                                            duplicate:'Archivo ya selecionado:\n$file!'

                                        }
                                    });
                                    
                                    $("#archivoCER").MultiFile({
                                        accept:'cer', max:1, STRING: {
                                            remove:'X',
                                            selected:'Selecionado: $file',
                                            denied:'CER/Archivo de extención $ext invalido!',
                                            duplicate:'Archivo ya selecionado:\n$file!'

                                        }
                                    });
                                });
                                
                            </script>
                        </div>
                    </div>
                    <br><br>
                </center>
            </div>
            <div class="footer">
                <br><br>
                Derechos reservados ISFE <br>
                HTML5 | CSS 2.0 | JavaScript | Apache Tomcat | J2EE 
                <br>
                <a href="http://twitter.com/" ><img src="images/twitter.png" alt="http://twitter.com" width="25" height="25"></a>
                <a href="http://www.facebook.com/" ><img src="images/Facebook.png" alt="http://www.facebook.com" width="25" height="25"></a>
                <br>
                Este sitio se visualiza mejor con Google Chrome
            </div>
        </div>
    </center>
</body>
</html>