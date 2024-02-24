package id.ficha4;

import java.util.List;
import org.jdom2.Attribute;
import org.jdom2.Document;
import org.jdom2.Element;

public class ModeloXML {

    public static Document adicionaLivro(Livro liv, Document doc){
        Element raiz;
        if (doc == null) {
            raiz = new Element("catalogo"); //cria <catalogo>...</catalogo>
            doc = new Document(raiz);
        }
        else {
            raiz = doc.getRootElement();
        }
        
        Element livro = new Element("livro");
        Attribute isbn = new Attribute("isbn", liv.getIsbn());
        livro.setAttribute(isbn);
        
        Attribute pag = new Attribute("paginas", Integer.toString(liv.getPaginas()));
        livro.setAttribute(pag);
        
        Element filho = new Element("titulo").addContent(liv.getTitulo());
        livro.addContent(filho);
        
        filho = new Element("autor").addContent(liv.getAutor());
        livro.addContent(filho);
        
        filho = new Element("capa").addContent(liv.getCapa());
        livro.addContent(filho);
        
        filho = new Element("editora").addContent(liv.getEditora());
        livro.addContent(filho);
        
        filho = new Element("preco").addContent(Double.toString(liv.getPreco()));
        livro.addContent(filho);
        Attribute loja = new Attribute("store", "bertrand");
        filho.setAttribute(loja);
        
        filho = new Element("preco").addContent(Double.toString(liv.getPreco()));
        livro.addContent(filho);
        loja = new Attribute("store", "wook");
        filho.setAttribute(loja);
        
        raiz.addContent(livro);
        return doc;
    }
    
    public static Document removeLivroAutor (String procura, Document doc){
        
        Element raiz;
        if (doc == null) {
            System.out.println("Nao existe o DOC");
            return doc;
        }
        else {
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
    
    public static Document removeLivroISBN (String isbn, Document doc){
        
        Element raiz;
        if (doc == null) {
            System.out.println("Nao existe o DOC");
            return doc;
        }
        else {
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
            System.out.println("ISBN " + isbn + " não foi encontrado");
            return null;    
        }
        
        return doc;
        
    }
    
    public static Document alteraPrecoLivro (String isbn, double novoPreco, String loja, Document doc){
        
        Element raiz;
        if (doc == null) {
            System.out.println("Nao existe o DOC");
            return doc;
        }
        else {
            raiz = doc.getRootElement();
        }
        
        List todosLivros = raiz.getChildren("livro");
        
        boolean found = false;
        for (int i = 0; i < todosLivros.size(); i++) {
            Element livro = (Element) todosLivros.get(i); //obtem livro i da Lista
            
            if (livro.getAttributeValue("isbn").equals(isbn)) {
                String titulo = livro.getChildText("titulo");
                List precos = livro.getChildren("preco");
                
                for(int j = 0; j < precos.size(); j++){
                    Element p = (Element) precos.get(j);
                    
                    if(p.getAttributeValue("store").equals(loja)){
                        System.out.println("Livro: " + titulo + "\nPreço: " + p.getValue());
                        p.setText(String.valueOf(novoPreco));
                    }
                }
                
                System.out.println("Livro removido com sucesso!");
                found = true;
            }
        }

        if (!found) {
            System.out.println("ISBN " + isbn + " não foi encontrado");
            return null;    
        }
        
        return doc;
        
    }
    
    
}
