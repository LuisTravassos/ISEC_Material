/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package id.ficha4;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author anabela
 */
public class Wrappers {

    public static String obtem_titulo(String isbn) throws IOException {
        HttpRequestFunctions.httpRequest1("https://www.bertrand.pt/pesquisa/", isbn, "livro.txt");
        String er = "data-product-name=\"([^\"]+)\"";
        Pattern p = Pattern.compile(er);
        Matcher m;
        Scanner ler = new Scanner(new FileInputStream("livro.txt"));
        while (ler.hasNextLine()) {
            String linha = ler.nextLine();
            m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return m.group(1);

            }

        }
        ler.close();
        return null;
    }

    public static String obtem_autor(String isbn) throws FileNotFoundException, IOException {
        HttpRequestFunctions.httpRequest1("https://www.bertrand.pt/pesquisa/", isbn, "livro.txt");
        String er = "<a href=\"/autor/[a-zA-Z0-9-/]+\">([^<]+)</a>";
        Scanner ler = new Scanner(new FileInputStream("livro.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return m.group(1);
            }

        }
        ler.close();
        return null;

    }

    public static double obtem_preco(String isbn) throws FileNotFoundException, IOException {
        HttpRequestFunctions.httpRequest1("https://www.bertrand.pt/pesquisa/", isbn, "livro.txt");
        //String er = "data-price=\"([0-9\\.]+)\"";
        String er = "<span class=\"active-price\">([0-9,]+)€</span>";
        Scanner ler = new Scanner(new FileInputStream("livro.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return Double.parseDouble(m.group(1).replace(",", "."));
            }

        }
        ler.close();
        return -1;

    }

    public static String obtem_link(String isbn) throws IOException {
        HttpRequestFunctions.httpRequest1("https://www.bertrand.pt/pesquisa/", isbn, "livro.txt");
        String er = "<a class=\"title-lnk track\" href=\"([^\"]+)\">";
        Scanner ler = new Scanner(new FileInputStream("livro.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return "https://www.bertrand.pt" + m.group(1);
            }

        }
        ler.close();
        return null;
    }

    public static String obtem_capa(String isbn) throws IOException {
        String link = obtem_link(isbn);
        HttpRequestFunctions.httpRequest1(link, "", "livro2.txt");
        String er = "<meta property=\"og:image\" content=\"([^\"]+)\" />";
        Scanner ler = new Scanner(new FileInputStream("livro2.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return m.group(1);
            }

        }
        ler.close();
        return null;

    }

    public static String obtem_editora(String isbn) throws IOException {
        String link = obtem_link(isbn);
        HttpRequestFunctions.httpRequest1(link, "", "livro2.txt");
        String er1 = "Editor:\\s*<span class=\"info\">([^<]+)</span>";

        Scanner ler = new Scanner(new FileInputStream("livro2.txt"));
        Pattern p1 = Pattern.compile(er1);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p1.matcher(linha);
            if (m.find()) {
                ler.close();
                return m.group(1);
            }
        }

        ler.close();
        return null;
    }

    public static String obtem_editora2(String isbn) throws IOException {
        String link = obtem_link(isbn);
        HttpRequestFunctions.httpRequest1(link, "", "livro2.txt");
        String er1 = "Editor:";
        String er2 = "<span class='text'>([^<]+)</span>";
        Scanner ler = new Scanner(new FileInputStream("livro2.txt"));
        Pattern p1 = Pattern.compile(er1);
        Pattern p2 = Pattern.compile(er2);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p1.matcher(linha);
            if (m.find()) {
                linha = ler.nextLine();
                Matcher m2 = p2.matcher(linha);
                if (m2.find()) {
                    ler.close();
                    return m2.group(1);
                }
            }

        }
        ler.close();
        return null;
    }

    public static int obtem_paginas(String isbn) throws IOException {
        String link = obtem_link(isbn);
        HttpRequestFunctions.httpRequest1(link, "", "livro2.txt");
        String er = "Páginas: <span  class=\"info\">([0-9]+)</span";
        Scanner ler = new Scanner(new FileInputStream("livro2.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return Integer.parseInt(m.group(1));
            }

        }
        ler.close();
        return -1;

    }

    public static double obtem_preco2(String isbn) throws FileNotFoundException, IOException {
        HttpRequestFunctions.httpRequest1("https://www.wook.pt/pesquisa/", isbn, "wook.txt");
        String er = "<span class=\"price-rpl\">([0-9,]+)€</span>";
        Scanner ler = new Scanner(new FileInputStream("wook.txt"));
        Pattern p = Pattern.compile(er);
        String linha;
        while (ler.hasNextLine()) {
            linha = ler.nextLine();
            Matcher m = p.matcher(linha);
            if (m.find()) {
                ler.close();
                return Double.parseDouble(m.group(1).replace(",", "."));
            }

        }
        ler.close();
        return -1;

    }

    public static Livro criaLivro(String isbn) throws IOException {
        String titulo = Wrappers.obtem_titulo(isbn);
        String autor = Wrappers.obtem_autor(isbn);
        double preco = Wrappers.obtem_preco(isbn);
        String capa = Wrappers.obtem_capa(isbn);
        String editor = Wrappers.obtem_editora(isbn);
        int pag = Wrappers.obtem_paginas(isbn);
        //double preco2 = Wrappers.obtem_preco2(isbn);
        Livro x = new Livro(isbn, titulo, autor,capa, editor, pag, preco, 9.9);
        return x;
    }

}
