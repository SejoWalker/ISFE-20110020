<%-- 
    Document   : contacto
    Created on : 29/03/2012, 10:39:01 PM
    Author     : kawatoto
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
            <title>ISFE - Contacto</title>
            <link rel="stylesheet" type="text/css" href="estilo/style.css" />
            <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
            <script type="text/javascript" src="js/jquery-ui-1.8.17.custom.min.js"></script>
            <script src="js/ui/jquery.menu.js"></script>
            <script src="js/ui/jquery.ui.widget.js"></script>
             
            
           
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
		<div class="titulo_pagina">Inicio</div>
		<center>                   
                    <div id="fb-root"></div>
                        <script>(function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/es_LA/all.js#xfbml=1";
                        fjs.parentNode.insertBefore(js, fjs);
                        }(document, 'script', 'facebook-jssdk'));
                        </script>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>
                                    <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
                                    <script>
                                    new TWTR.Widget({
                                    version: 2,
                                    type: 'profile',
                                    rpp: 4,
                                    interval: 30000,
                                    width: 292,
                                    height: 500,
                                    theme: {
                                        shell: {
                                        background: '#333333',
                                        color: '#ffffff'
                                        },
                                        tweets: {
                                        background: '#c2c7cc',
                                        color: '#ffffff',
                                        links: '#0c1b47'
                                        }
                                    },
                                    features: {
                                        scrollbar: false,
                                        loop: false,
                                        live: true,
                                        behavior: 'all'
                                    }
                                    }).render().setUser('ISFEtt20110020').start();
                                    </script>
                                </td>
                                <td align="center">
                                    <img src="images/email.png" />
                                    <h3>¿Dudas? ¿Comentarios? ¿Sugerencias?<br>
                                        Ponte en contacto con nosotros<br>
                                        al siguiente e-mail:<br><br>
                                        isfe@isfesoft.com<br><br><br>
                                        o al siguiente tel&eacute;fono:<br><br>
                                        (55) 552-35-040
                                    </h3>
                                </td>
                                <td>
                                    <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FISFE20110020&amp;width=292&amp;height=590&amp;colorscheme=light&amp;show_faces=true&amp;border_color&amp;stream=true&amp;header=true" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:590px;" allowTransparency="true"></iframe>
                                </td>
                            </tr>
                        </tbody>
                    </table>                
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
