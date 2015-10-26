package practice.easy.nocoding;

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
            res.append(countCode(s) <= s.length() * 11 ? "YES" : "NO").append("\n");
        }

        System.out.print(res);
    }

    public static int countCode(String s) {
        int count = 2;

        for (int i = 1; i < s.length(); ++i) {
            int lastChar = s.charAt(i - 1) - 'a';
            int currentChar = s.charAt(i) - 'a';

            count += currentChar >= lastChar ?
                    currentChar - lastChar : 26 - lastChar + currentChar;
            ++count;
        }

        return count;
    }
}
