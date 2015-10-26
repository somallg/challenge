package practice.easy.name2;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder res = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            String[] s = br.readLine().split(" ");
            res.append(isSub(s[0], s[1]) || isSub(s[1], s[0]) ? "YES" : "NO");
            res.append("\n");
        }
        System.out.print(res);
    }

    public static boolean isSub(String a, String b) {
        int i = 0, j = 0;

        for (i = 0; i < a.length(); ++i) {
            for (; j < b.length() && a.charAt(i) != b.charAt(j); ++j) ;
            if (j == b.length())
                return false;
            ++j;
        }

        return true;
    }
}
