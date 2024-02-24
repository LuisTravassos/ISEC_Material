package id.ficha4;

import java.io.IOException;
import java.util.Scanner;
import org.jdom2.Document;

public class Ficha4 {

    public static void main(String[] args) throws IOException {
        Frame app = new Frame();
        app.setVisible(true);
        
        /*String isbn="9789892314044";
        Livro liv = Wrappers.criaLivro(isbn);
        Document doc = XMLJDomFunctions.lerDocumentoXML("livro.xml");
        
        //doc = ModeloXML.adicionaLivro(liv, doc);
        doc = ModeloXML.alteraPrecoLivro("9789722533492", 25.00, "wook", doc);
        
        if(doc != null){
            XMLJDomFunctions.escreverDocumentoParaFicheiro(doc, "livro.xml");
        }

        System.out.println("\nINFORMAÇÃO DO LIVRO");
        System.out.println("\tISBN: " + liv.getIsbn());
        System.out.println("\tTITULO: " + liv.getTitulo());
        System.out.println("\tAUTOR: " + liv.getAutor());
        System.out.println("\tCAPA: " + liv.getCapa());
        System.out.println("\tEDITOR: " + liv.getEditora());
        System.out.println("\tPAGINAS: " + liv.getPaginas());
        System.out.println("\tPRECO1: " + liv.getPreco());
        //System.out.println("\tPRECO2: " + liv.getPreco2());

        //  double link = Wrappers.obtem_preco2("9789897224607");
        //   System.out.println(link); */
    }
}
