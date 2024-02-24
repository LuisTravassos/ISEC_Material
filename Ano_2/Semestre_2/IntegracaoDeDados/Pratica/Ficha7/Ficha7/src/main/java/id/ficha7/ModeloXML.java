/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package id.ficha7;

import java.util.List;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;

/**
 *
 * @author anabela
 */
public class ModeloXML {
    public static Document adicionaLivro(Livro liv, Document doc) {
        Element raiz;
        if (doc == null) {
            raiz = new Element("catalogo"); //cria <catalogo>...</catalogo>
            doc = new Document(raiz);
        } else {
            raiz = doc.getRootElement();
        }
        Element pai = new Element("livro");
        Attribute a = new Attribute("isbn", liv.getIsbn());
        pai.setAttribute(a);
        a = new Attribute("paginas", Integer.toString(liv.getPaginas()));
        pai.setAttribute(a);

        Element x = new Element("titulo").addContent(liv.getTitulo());
        pai.addContent(x);

        x = new Element("autor").addContent(liv.getAutor());
        pai.addContent(x);

        x = new Element("capa").addContent(liv.getCapa());
        pai.addContent(x);

        x = new Element("editora").addContent(liv.getEditora());
        pai.addContent(x);

        x = new Element("preco").addContent(Double.toString(liv.getPreco()));
        a = new Attribute("store", "bertrand");
        x.setAttribute(a);
        pai.addContent(x);

        x = new Element("preco").addContent(Double.toString(liv.getPreco2()));
        a = new Attribute("store", "wook");
        x.setAttribute(a);
        pai.addContent(x);

        raiz.addContent(pai);
        return doc;
    }

    public static Document removeLivroAutor(String procura, Document doc) {
        Element raiz;
        if (doc == null) {
            System.out.println("Ficheiro nao existe - nao dá para remover informação");
            return null;
        } else {
            raiz = doc.getRootElement();
        }
        List todosLivros = raiz.getChildren("livro");
        boolean found = false;
        for (int i = 0; i < todosLivros.size(); i++) {
            Element livro = (Element) todosLivros.get(i); //obtem livro i da Lista 
            if (livro.getChild("autor").getText().contains(procura)) {
                livro.getParent().removeContent(livro);
                System.out.println("Livro removido com sucesso!");
                found = true;
            }
        }
        if (!found) {
            System.out.println("Autor " + procura + " não foi encontrado");
            return null;
        }
        return doc;
    }

    public static Document removeLivroISBN(String isbn, Document doc) {
        Element raiz;
        if (doc == null) {
            System.out.println("Ficheiro nao existe - nao dá para remover informação");
            return null;
        } else {
            raiz = doc.getRootElement();
        }
        List todosLivros = raiz.getChildren("livro");
        boolean found = false;
        for (int i = 0; i < todosLivros.size(); i++) {
            Element livro = (Element) todosLivros.get(i); //obtem livro i da Lista 
            if (livro.getAttributeValue("isbn").equals(isbn)) {
                livro.getParent().removeContent(livro);
                System.out.println("Livro removido com sucesso!");
                found = true;
            }

        }
        if (!found) {
            System.out.println("Autor " + isbn + " não foi encontrado");
            return null;
        }
        return doc;
    }

    public static Document alteraPrecoLivro(String isbn, double novoPreco, String loja, Document doc) {
        Element raiz;
        if (doc == null) {
            System.out.println("Ficheiro nao existe - nao dá para alterar informação");
            return null;
        } else {
            raiz = doc.getRootElement();
        }
        List todosLivros = raiz.getChildren("livro");
        boolean found = false;
        for (int i = 0; i < todosLivros.size(); i++) {
            Element livro = (Element) todosLivros.get(i); //obtem livro i da Lista 
            if (livro.getAttributeValue("isbn").equals(isbn)) {
                String titulo = livro.getChildText("titulo");
                System.out.println("Titulo " + titulo);
                //obtem os dois preços: bertrand e wook    
                List precos = livro.getChildren("preco");
                for (int j = 0; j <precos.size(); j++) {
                    Element p = (Element) precos.get(j); //obtem preço j da Lista 
                    if (p.getAttributeValue("store").equals(loja)) { //loja indicada
                        System.out.println("Preço " + p.getValue());
                        p.setText(String.valueOf(novoPreco));
                    }
                }
                System.out.println("Preço alterado com sucesso!");
                found = true;
            }
        }
        if (!found) {
            System.out.println("Livro " + isbn + " não foi encontrado");
            return null;
        }
        return doc;
    }
    
    
}
