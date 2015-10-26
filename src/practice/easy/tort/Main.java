package practice.easy.tort;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String[] s = br.readLine().split(" ");
        int T = Integer.parseInt(s[0]);
        String M = s[1];
        StringBuilder res = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            String l = br.readLine();
            for (int i = 0; i < l.length(); ++i) {
                char c = l.charAt(i);
                if (c == '_')
                    res.append(' ');
                else if (c == '.' || c == ',' || c == '!' || c == '?')
                    res.append(c);
                else if (Character.isUpperCase(c))
                    res.append(Character.toUpperCase(M.charAt(c - 'A')));
                else
                    res.append(M.charAt(c - 'a'));
            }
            res.append("\n");
        }
        System.out.print(res);
    }
}

