package com.mycompany.ficha4;

import com.mycompany.ficha4.HttpRequestFunctions;
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
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("pessoas.html")));
        String er = "<tr>\\s*<td\\s*>[0-9]+</td><td\\s*>([a-zA-Z\\s]*" + isbn + "[a-zA-Z\\s]*)</td>";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        
        return resultado;
    }
    
    public static double obtem_preco(String isbn) throws IOException{
        String link = "https://www.bertrand.pt/pesquisa/";
        HttpRequestFunctions.httpRequest1(link, isbn, "bertrand.html");
        
        Double resultado = null;
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("pessoas.html")));
        String er = "<tr>\\s*<td\\s*>[0-9]+</td><td\\s*>([a-zA-Z\\s]*" + isbn + "[a-zA-Z\\s]*)</td>";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        
        return resultado;
    }
    
}