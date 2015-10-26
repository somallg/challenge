package practice.easy.lapin;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            String s = br.readLine();
            int[] a = new int[27];
            for (int i = 0; i < s.length(); ++i) {
                if ((i == s.length() / 2) && (s.length() % 2 == 1))
                    continue;
                if (i < s.length() / 2)
                    ++a[s.charAt(i) - 'a'];
                else
                    --a[s.charAt(i) - 'a'];
            }

            int i;
            for (i = 0; i < s.length() / 2 && a[s.charAt(i) - 'a'] == 0; ++i) ;
            res.append(i < s.length() / 2 ? "NO" : "YES").append("\n");
        }

        System.out.print(res);
    }
}
