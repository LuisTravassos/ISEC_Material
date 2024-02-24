package com.mycompany.ficha5;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Scanner;
import java.util.regex.Pattern;
import java.util.regex.Matcher;


public class Wrapper{
    
    public static String obtem_titulo(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        Scanner ler;
        ler = new Scanner(Files.newInputStream(Path.of("bertrand.html")));
        String er = "data-product-name=\"([^\"]+)\"";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while(ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            if(m.find()){
                ler.close();
                return m.group(1);
            }
        }
        
        
        return "boas";
    }
    
    public static String obtem_autor(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        String resultado = null;
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("bertrand.html")));
        String er = "<p>de\\s<a\\shref=\"[^\"]+\">([^<]+)</a>";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while(ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            if(m.find()){
                ler.close();
                return m.group(1);
            }
        }
        
        return resultado;
    }
    
    public static double obtem_preco(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        Double resultado = 0.0;
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("bertrand.html")));
        String er = "<span\\sclass=\"active-price\">([^,]+),([^€]+)€</span>";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while(ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            if(m.find()){
                ler.close();
                return Double.parseDouble(m.group(1)+ "." + m.group(2));
            }
        }
        
        return resultado;
    }
    
    public static String obtem_link(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        String resultado = null;
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("bertrand.html")));
        String er = "<a\\sclass=\"track\"\\shref=\"([^\"]+)\">";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while (ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            
            if(m.find()){
                ler.close();
                return "https://www.bertrand.pt" + m.group(1);
            }
        }
        
        
        return resultado;
    }
    
    public static String obtem_capa(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        String resultado = null;
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("bertrand.html")));
        String er = "<source\\smedia=\"[^\"]+\"[^\"]+\"[^\"]+\"[^\"]+\"([^\"]+)\"";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while (ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            
            if(m.find()){
                ler.close();
                return m.group(1);
            }
        }
        
        
        return resultado;
    }
}
