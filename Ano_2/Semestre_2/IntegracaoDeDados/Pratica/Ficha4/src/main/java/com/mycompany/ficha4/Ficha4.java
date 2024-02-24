package com.mycompany.ficha4;

import java.io.IOException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Ficha4{
    
    String isbn, titulo, autor;
    Double preco;

    public Ficha4(String isbn, String titulo, String autor, Double preco) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.preco = preco;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public Double getPreco() {
        return preco;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }
    
    public static void main(String[] args) {
        try {
            Scanner palavra = new Scanner(System.in);
            String word;
            System.out.println("Palavra a procurar: ");
            word = palavra.nextLine();
            
            String res = Wrapper.obtem_titulo(word);
            System.out.println(res);
           
        } catch (IOException ex) {
            Logger.getLogger(Ficha4.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}