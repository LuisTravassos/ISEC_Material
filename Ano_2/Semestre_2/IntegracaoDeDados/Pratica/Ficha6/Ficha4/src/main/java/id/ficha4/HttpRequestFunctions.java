/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ficha4;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


/**
 *
 * @author abs
 */
public class HttpRequestFunctions {

    public static void httpRequest1(String link, String pesquisa, String outFile) throws IOException {
        URL url;

        if (!pesquisa.isEmpty()) {
            //Criar URL com palavra de pesquisa
            //System.out.println(link + URLEncoder.encode(pesquisa,"UTF-8").replace("+", "_"));
            url = new URL(link + URLEncoder.encode(pesquisa, "UTF-8").replace("+", "_")); //alterar replace se necessário
        } else {
            //Criar URL simples, sem palavra de pesquisa
            //  System.out.println(link);
            url = new URL(link);
        }
        //System.out.println(url);
        URLConnection ligacao = url.openConnection();

        //Ver User-Agent actual de um determinado browser : http://whatsmyuseragent.com
        //ligacao.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16");
        ligacao.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16X11; Linux x86_64) Gecko/20110319 Firefox/3.6.16 Chrome/79.0.3945.88 Safari/537.36");
        BufferedReader in = new BufferedReader(new InputStreamReader(ligacao.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String linha;

        while ((linha = in.readLine()) != null) {
            sb.append(linha)
                    .append(System.getProperty("line.separator"));
        }
        //Escrever num ficheiro
        BufferedWriter out = new BufferedWriter(new FileWriter(outFile));
        out.write(sb.toString());

        out.close();
        in.close();
    }
    
    
     public static void httpRequest1a(String link, String pesquisa, String outFile) throws IOException {
        URL url;

        if (!pesquisa.isEmpty()) {
            //Criar URL com palavra de pesquisa
            System.out.println(link + URLEncoder.encode(pesquisa,"UTF-8"));
            url = new URL(link + URLEncoder.encode(pesquisa, "UTF-8")); //alterar replace se necessário
        } else {
            //Criar URL simples, sem palavra de pesquisa
            //  System.out.println(link);
            url = new URL(link);
        }
        //System.out.println(url);
        URLConnection ligacao = url.openConnection();

        //Ver User-Agent actual de um determinado browser : http://whatsmyuseragent.com
        //ligacao.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16) Gecko/20110319 Firefox/3.6.16");
        ligacao.setRequestProperty("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.16X11; Linux x86_64) Gecko/20110319 Firefox/3.6.16 Chrome/79.0.3945.88 Safari/537.36");
        BufferedReader in = new BufferedReader(new InputStreamReader(ligacao.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String linha;

        while ((linha = in.readLine()) != null) {
            sb.append(linha)
                    .append(System.getProperty("line.separator"));
        }
        //Escrever num ficheiro
        BufferedWriter out = new BufferedWriter(new FileWriter(outFile));
        out.write(sb.toString());

        out.close();
        in.close();

        //System.out.println("Erro no URL / ligação");
        // Logger.getLogger(HttpRequestFunctions.class.getName()).log(Level.SEVERE, null, ex);
        // catch (IOException ex) {
//	    System.out.println("Erro na escrita do ficheiro");
        //   Logger.getLogger(HttpRequestFunctions.class.getName()).log(Level.SEVERE, null, ex);
        //} 
    }
}
