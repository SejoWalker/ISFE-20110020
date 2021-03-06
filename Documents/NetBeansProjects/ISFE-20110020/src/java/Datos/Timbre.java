/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.Date;
import org.jdom.Content;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;

/**
 * Clase que se encarga de generar el timbrado del CFDI
 * @author Trabajo Terminal 20110020 Implementación del Servicio de Facturación Electrónica acorde a la reforma de enero de 2011
 */
public class Timbre{
    private Document timbre;
    private final static String version = "1.0";
    private final static Namespace xsi = Namespace.getNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance");
    private final static Namespace tfd = Namespace.getNamespace("tfd", "http://www.sat.gob.mx/TimbreFiscalDigital");
    private final static String schemaLocation = "http://www.sat.gob.mx/TimbreFiscalDigital TimbreFiscalDigital.xsd";
    /**
     * Constructor vacío
     */
    public Timbre(){
        timbre = new Document();
        Element t = new Element("TimbreFiscalDigital", tfd);
        t.addNamespaceDeclaration(tfd);
        t.setAttribute("schemaLocation", schemaLocation, xsi).setAttribute("version", version);
        timbre.setRootElement(t);
    }
    /**
     * Método que se encarga de generar el XML con el timbre fiscal digital
     * ovtenido a partir del sello generado por el PAC (ISFE)
     * @param f instancia de la factura que se va a generar
     * @param isfe instancia del ISFE como PAC que certifica la factura
     * @return 
     */
    public Document agregarTimbre(Factura f,ISFE isfe){
        timbre.getRootElement().setAttribute("selloCFD", f.getCadenaCSD());
        timbre.getRootElement().setAttribute("FechaTimbrado", XML.formatearFecha(f.getFecha()));
        timbre.getRootElement().setAttribute("UUID", f.getFolio().getUUID()+"");
        timbre.getRootElement().setAttribute("noCertificadoSAT", isfe.getCSD().getNoCertificado());
        return timbre;
    }
    /**
     * Genera el elemento con el sello del PAC (autorizado por el SAT)
     * @param selloSAT del PAC 
     * @return elemento con el sello
     */
    public Element agregarSello(String selloSAT){
        return timbre.getRootElement().setAttribute("selloSAT", selloSAT);
    }
    /**
     * Obtiene el timbre fiscal digital del xml
     * @return timbre del xml
     */
    public Content obtenerTimbre(){
        return timbre.getRootElement().detach();
    }
}
