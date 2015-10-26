package practice.easy.onp;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            String s = br.readLine();
            Stack v = new Stack();

            for (int i = 0; i < s.length(); ++i) {
                char c = s.charAt(i);
                if ('a' <= c && c <= 'z')
                    res.append(c);
                else if (c == ')')
                    res.append(v.pop());
                else if (c != '(')
                    v.push(c);
            }
            res.append("\n");
        }

        System.out.print(res);
    }
}
