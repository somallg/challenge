package practice.easy.holes;

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
            String s = br.readLine();
            res.append(countHoles(s)).append("\n");
        }
        System.out.print(res);
    }

    public static int countHoles(String s) {
        int count = 0;
        for (int i = 0; i < s.length(); ++i) {
            switch (s.charAt(i)) {
                case 'A':
                case 'D':
                case 'O':
                case 'P':
                case 'Q':
                case 'R':
                    ++count;
                    break;
                case 'B':
                    count += 2;
                    break;
                default:
                    break;
            }
        }

        return count;
    }
}
