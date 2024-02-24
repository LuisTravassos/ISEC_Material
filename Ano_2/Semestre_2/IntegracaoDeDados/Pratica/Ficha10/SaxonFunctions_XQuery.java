/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ficha8;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.stream.StreamResult;
import net.sf.saxon.Configuration;
import net.sf.saxon.query.DynamicQueryContext;
import net.sf.saxon.query.StaticQueryContext;
import net.sf.saxon.query.XQueryExpression;
import net.sf.saxon.trans.XPathException;

/**
 *
 * @author abs
 */
public class SaxonFunctions_XQuery {

    public static void xQueryToText(String outputFile, String queryFile) throws XPathException, IOException{
        Configuration config = new Configuration();
        StaticQueryContext sqc = new StaticQueryContext(config);
        XQueryExpression exp = sqc.compileQuery(new FileReader(queryFile));
        DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
        
        Properties props = new Properties();
        props.setProperty(OutputKeys.METHOD, "text");
        exp.run(dynamicContext, new StreamResult(new File(outputFile)), props);
    }
    
    public static void xQueryToHtml(String outputFile, String queryFile) throws XPathException, IOException{
        Configuration config = new Configuration();
        StaticQueryContext sqc = new StaticQueryContext(config);
        XQueryExpression exp = sqc.compileQuery(new FileReader(queryFile));
        DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
       
        Properties props = new Properties();
        props.setProperty(OutputKeys.METHOD, "html");   
        exp.run(dynamicContext, new StreamResult(new File(outputFile)), props);
    }
    
    public static void xQueryToXml(String outputFile, String queryFile) throws XPathException, IOException{
        Configuration config = new Configuration();
        StaticQueryContext sqc = new StaticQueryContext(config);
        XQueryExpression exp = sqc.compileQuery(new FileReader(queryFile));
        DynamicQueryContext dynamicContext = new DynamicQueryContext(config);
       
        Properties props = new Properties();
        props.setProperty(OutputKeys.METHOD, "xml");
        exp.run(dynamicContext, new StreamResult(new File(outputFile)), props);
    }
    
}
