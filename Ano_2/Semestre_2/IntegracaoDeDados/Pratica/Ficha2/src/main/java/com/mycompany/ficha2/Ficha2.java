package com.mycompany.ficha2;
import java.awt.Dimension;
import java.io.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Ficha2 {
    static double calcula_MediaIdade(String genero) {
        Scanner input = null;
        String linha;
        String []campos;
        String nome, local, genero1, idade;
        double resultado=0, total=0;
        
        try {
            input = new Scanner(new FileInputStream("alunos.txt"));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ficha2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        while ((input.hasNextLine())) {
            linha = input.nextLine(); //lê linha a linha
            campos = linha.split(";");
            nome = campos[0];
            local = campos[1];
            genero1 = campos[2];
            idade = campos[3];

            if (genero.equals("M") && genero1.equals("M")){
                resultado+=Integer.parseInt(idade);
                total++;

            }else if(genero.equals("F") && genero1.equals("F")){
                resultado+=Integer.parseInt(idade);
                total++;

            }
        }

        input.close ();
        resultado = resultado/total;
        
        return resultado;
    }
    
    static void separa_ficheiro(String nomeF) throws IOException {
        String linha;
        String[] campos;
        String nome, local, genero, idade;
        Scanner input = null;
        BufferedWriter homens = null, mulheres = null;
        
        try {
            input = new Scanner(new FileInputStream(nomeF));
            mulheres = new BufferedWriter(new FileWriter("mulheres.txt"));
            homens = new BufferedWriter(new FileWriter("homens.txt"));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ficha2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        while ((input.hasNextLine())) {
            linha = input.nextLine(); //lê linha a linha
            campos = linha.split(";");
            nome = campos[0];
            local = campos[1];
            genero = campos[2];
            idade = campos[3];

        
            if (genero.equals("M")) {
                homens.write(linha);
                homens.write("\n");
            } else if (genero.equals("F")) {
                mulheres.write(linha);
                mulheres.write("\n");
            }
        }
        mulheres.close();
        homens.close();
        input.close();
    }
    
    static String ler_ficheiro(String nomeF){
        String linha;
        StringBuilder texto = new StringBuilder(); //permite concatenar várias String
        Scanner input = null;
        
        try {
            input = new Scanner(new FileInputStream(nomeF));
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Ficha2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        while ((input.hasNextLine())) {
            
            linha = input.nextLine(); //lê linha a linha
            texto.append(linha).append("\n");
        }
        input.close();
        return texto.toString(); //converter StringBuilder para String
    }

    public static void main(String[] args) {
        Frame app = new Frame();
        app.setVisible(true);
        app.setResizable(false);
        app.setPreferredSize(new Dimension(500, 500));
    }
}
