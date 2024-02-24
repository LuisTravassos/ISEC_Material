package com.mycompany.ficha3;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class Ficha3 {
    
    static void alineaA(){
        String telef= "919191919 929992221 91111111111 239494582 9199999999 967779999";
        
        //ER para validar nºs de tele
        String er="\\b9[1236][0-9]{7}\\b";
        Pattern p = Pattern.compile(er);
        Matcher m = p.matcher(telef);
        while(m.find()){
            System.out.println("Número: " + m.group() + "\n");
        }
    }
    
    static void alineaB(String fileIn, String fileOut) throws IOException{
        Scanner ler = new Scanner(Files.newInputStream(Path.of(fileIn))); 
        BufferedWriter escrever = new BufferedWriter(new FileWriter(fileOut));
        String linha;
        
        //ER para validar datas
        String er="\\b[0-3][0-9][-/][01][0-9][-/][0-9]{4}\\b";
        Pattern p = Pattern.compile(er);
        Matcher m;
        
        while((ler.hasNextLine())){
            linha = ler.nextLine(); //lê linha a linha
            m = p.matcher(linha);
            
            while(m.find()){
                escrever.write(m.group() + " - Data Válida\n");
            }
        }
        ler.close();
        escrever.close();
        
    }
    
    static void alineaC(String fileIn, String fileOut) throws IOException{
        Scanner ler = new Scanner(Files.newInputStream(Path.of(fileIn)));
        BufferedWriter escrever = new BufferedWriter(new FileWriter(fileOut));
        
        String linha, result = null;
        String er = "\\b[a-zA-Zéá]*(ch)[a-zA-Zéá]*\\b";
        
        Pattern p = Pattern.compile(er);
        Matcher m;
        int conta = 0;
        
        while((ler.hasNextLine())){
            linha = ler.nextLine(); //lê linha a linha
            m = p.matcher(linha);
            
            while(m.find()){
                conta++;
                result = linha.replace(m.group(1), "X");
            }
            escrever.write(result);
        }
        escrever.write("\nForam efetuadas "+ conta +" substituições");
        ler.close();
        escrever.close();
    }

    public static void main(String[] args) {
        try {
            //alineaA();
            //alineaB("datas.txt", "out.txt");
            //alineaC("ficheiro3.txt", "out2.txt");
            Scanner palavra = new Scanner(System.in);
            String word;
            System.out.println("Palavra a procurar: ");
            word = palavra.nextLine();
            ArrayList res = Wrapper.procura_nomes(word);
            System.out.println(res);
        } catch (IOException ex) {
            Logger.getLogger(Ficha3.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
