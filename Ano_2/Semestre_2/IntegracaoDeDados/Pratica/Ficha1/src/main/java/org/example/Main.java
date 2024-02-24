package org.example;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {

    static void minhafunc3(String nomefich) throws IOException {
        Scanner ler = new Scanner(Files.newInputStream(Path.of(nomefich)));
        BufferedWriter escreverM = new BufferedWriter(new FileWriter("homens.txt"));
        BufferedWriter escreverF = new BufferedWriter(new FileWriter("mulheres.txt"));

        String linha;
        String []campos;

        String nome, local, genero, idade, result;
        float somaF=0, somaM=0, totalF=0, totalM=0;

        while ((ler.hasNextLine())) {
            linha = ler.nextLine(); //lê linha a linha
            campos = linha.split(";");
            nome = campos[0];
            local = campos[1];
            genero = campos[2];
            idade = campos[3];

            if (genero.equals("M")){
                escreverM.write(nome);
                somaM+=Integer.parseInt(idade);
                totalM++;

            }else if(genero.equals("F")){
                escreverF.write(nome);
                somaF+=Integer.parseInt(idade);
                totalF++;

            }

        }
        result = String.valueOf(somaM/totalM);
        escreverM.write(result);
        result = String.valueOf(somaF/totalF);
        escreverF.write(result);

        escreverM.close();
        escreverF.close();
        ler.close();
    }

    static void minhafunc2 (int num){
        Scanner dados2 = new Scanner(System.in);

        ArrayList<Aluno> turma = new ArrayList();
        Aluno a;
        String nome, local, genero;
        int idade;

        float somaF=0, somaM=0, totalF=0, totalM=0;

        for (int i = 0; i<num ; i++){
            System.out.println("Introduza o nome, local, genero e idade:");
            nome = dados2.nextLine();
            local = dados2.nextLine();
            genero = dados2.nextLine();
            idade = dados2.nextInt();

            if(genero.equals("feminino")){
                somaF += idade;
                totalF++;
            } else if (genero.equals("masculino")) {
                somaM += idade;
                totalM++;
            }

            a = new Aluno(nome, local, genero, idade);
            a.imprime();
            turma.add(a);
            dados2.nextLine();
        }
        System.out.println("A média da idade das raparigas é: " + somaF/totalF + "\nA média da idade dos rapazes é: " + somaM/totalM);
    }

    static void minhafunc1(){
        Scanner dados = new Scanner(System.in);

        System.out.println("Introduza o seu nome: ");
        String nome = dados.nextLine();
        //ou em alternativa: String nome = new String("Joana Melo");

        System.out.println("Introduza a sua idade: ");
        int idade = dados.nextInt();

        System.out.println("Olá Mundo");
        System.out.println("O meu nome é " + nome + " e tenho " + idade + " anos.");
        //ou System.out.printf("O meu nome é %s e tenho %d anos. %n", nome, idade);
    }

    public static void main(String[] args){
        //minhafunc1();
        //minhafunc2(3);
        try {
            minhafunc3("alunos.txt");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
