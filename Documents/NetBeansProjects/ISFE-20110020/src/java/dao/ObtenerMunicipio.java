package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet que se encarga de manejar la obtención del estado del contribuyente 
 * en la base de datos.
 * @author Trabajo Terminal 20110020 Implementación del Servicio de Facturación Electrónica acorde a la reforma de enero de 2011
 */public class ObtenerMunicipio extends HttpServlet {

    /**
     * Método encargado de obtener el municipio de la dirección física del 
     * contribuyente a la base de datos
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException si ocurren errores del Servlet
     * @throws IOException Si ocurren errores de entrada y/o salida de datos
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try 
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            Sql s = new Sql();
            String sql = "SELECT m.idMunicipio, m.nombreMunicipio FROM  municipio m, localidad l WHERE l.codigoPostal="+request.getParameter("codigoPostal") +" AND l.idMunicipio = m.idMunicipio GROUP BY(m.idMunicipio)";
            ResultSet rs = s.consulta(sql);
            while(rs.next())
            {
              out.println("<option value=\""+rs.getInt("idMunicipio")+"\">"+rs.getString("nombreMunicipio")+"</option>");
            }
            
        }       catch (InstantiationException ex) {
                Logger.getLogger(ObtenerEstado.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(ObtenerEstado.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(ObtenerEstado.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
