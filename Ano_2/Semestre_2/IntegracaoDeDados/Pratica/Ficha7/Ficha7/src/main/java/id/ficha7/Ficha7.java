/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */
package id.ficha7;

import java.io.IOException;
import java.util.logging.Logger;
import net.sf.saxon.s9api.SaxonApiException;
import net.sf.saxon.s9api.XdmValue;
import org.jdom2.Document;

/**
 *
 * @author anabela
 */
public class Ficha7 {

    public static void main(String[] args) throws IOException, SaxonApiException {
        //String isbn="9789897224607";
        String lista = "9789897846984,9789892348568,9789899039353,9789898857071,9789722055932,9780837178561,"
                + "9789897224607,9789722129220,9789722532877,9789892314044,9789722533492";
        String[] isbn = lista.split(",");
        
        String xp="//livro/preco[@store='bertrand' and . > 10]/../titulo";
        
        XdmValue res = XPathFunctions.executaXpath(xp, "livro.xml");
        
        String s = XPathFunctions.listaResultado(res);
        if (res==null)
            System.out.println("Ficheiro XML não existe");
        else if (res.size() == 0)
            System.out.println("Sem resultados");
        else
            System.out.println(s);
        
        //for (int i = 0; i < 10; i++) {
        //  Livro liv = Wrappers.criaLivro(isbn[i]);
        //  Document doc = XMLJDomFunctions.lerDocumentoXML("livro.xml");
        //Chama a função para adicionar o livro ao XML
        //   doc = ModeloXML.adicionaLivro(liv, doc);
        //grava o ficheiro XML em disco
        //   XMLJDomFunctions.escreverDocumentoParaFicheiro(doc, "livro.xml");
        /* System.out.println("INFORMAÇÃO DO LIVRO");
        System.out.println("\tISBN: " + liv.getIsbn());
        System.out.println("\tTITULO: " + liv.getTitulo());
        System.out.println("\tAUTOR: " + liv.getAutor());
        System.out.println("\tCAPA: " + liv.getCapa());
        System.out.println("\tEDITOR: " + liv.getEditora());
        System.out.println("\tPAGINAS: " + liv.getPaginas());
        System.out.println("\tPRECO1: " + liv.getPreco());
        System.out.println("\tPRECO2: " + liv.getPreco2());*/
        // }
        // String link = Wrappers.obtem_capa("9789897224607");
        //  System.out.println(link); */
        
        /* String isbn = "9789892348568";
        Livro liv = Wrappers.criaLivro(isbn);
        Document doc = XMLJDomFunctions.lerDocumentoXML("livro.xml");
        //Chama a função para adicionar o livro ao XML
        doc = ModeloXML.adicionaLivro(liv, doc);
        //grava o ficheiro XML em disco
        XMLJDomFunctions.escreverDocumentoParaFicheiro(doc, "livro.xml");*/
        //Inicializa Doc XML
        //Document doc = XMLJDomFunctions.lerDocumentoXML("livro.xml");
        //Chama a função para remover  livros ao XML
        //doc = ModeloXML.removeLivroAutor("Auster", doc);
        //grava o ficheiro XML em disco
        //if (doc != null) {
        //    XMLJDomFunctions.escreverDocumentoParaFicheiro(doc, "livro.xml");
        //}
        
        Frame app = new Frame();
        app.setVisible(true);
    }
}
