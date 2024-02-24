/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ficha4;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


/**
 *
 * @author abs
 */

public class XMLJDomFunctions{
    /*Le um ficheiro XML do disco*/
    public static Document lerDocumentoXML(String caminhoFicheiro) {
        try {        
            File file = new File(caminhoFicheiro);
            InputStreamReader stream = new InputStreamReader(new FileInputStream(file), "utf-8");
            Reader reader = new BufferedReader(stream);
            SAXBuilder builder = new SAXBuilder();
            Document anotherDocument = builder.build(reader);
            return anotherDocument; 
        } catch (JDOMException | IOException ex) {
            System.out.println("Ficheiro XML nao existe");
            return null;
        }
    }
    
    public static void escreverDocumentoParaFicheiro(Document doc, String caminhoFicheiro) {
        OutputStreamWriter writer = null;
        try {
            //Define o formato de saida
            //O caracter de indentacao pode ser diferente (e.g. \t)
            Format outputFormat = Format.getPrettyFormat();
            outputFormat.setIndent("     ");
            outputFormat.setEncoding("utf-8"); // 
            //Prepara o XMLOutputter
            XMLOutputter outputter = new XMLOutputter(outputFormat);            
            writer = new OutputStreamWriter(new FileOutputStream(caminhoFicheiro), "utf-8");
            outputter.output(doc, writer);
            writer.close();     
        } catch (IOException ex) {
            Logger.getLogger(XMLJDomFunctions.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                writer.close();
            } catch (IOException ex) {
                Logger.getLogger(XMLJDomFunctions.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    /*Coloca o conteudo de um documento numa String*/
    public static String escreverDocumentoString(Document doc) {
            //Define o formato de saida

            Format outputFormat = Format.getPrettyFormat();
            outputFormat.setIndent("     ");

            //Escreve o XML para o ecra, ou seja, System.out
            XMLOutputter outputter = new XMLOutputter(outputFormat);
            String txt = outputter.outputString(doc);
            return txt;
    }   
}
