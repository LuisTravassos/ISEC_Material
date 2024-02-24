package com.mycompany.ficha3;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Wrapper {
    
    static ArrayList procura_nomes(String procura)throws IOException{
        ArrayList lista = new ArrayList();
        
        Scanner ler = new Scanner(Files.newInputStream(Path.of("pessoas.html")));
        String er = "<tr>\\s*<td\\s*>[0-9]+</td><td\\s*>([a-zA-Z\\s]*" + procura + "[a-zA-Z\\s]*)</td>";
        Pattern p = Pattern.compile(er);
        Matcher m;
        String linha;
        
        while(ler.hasNextLine()){
            linha = ler.nextLine();
            m = p.matcher(linha);
            if(m.find()){
                lista.add(m.group(1));
            }
        }
        ler.close();
        return lista;
    }
    
}
