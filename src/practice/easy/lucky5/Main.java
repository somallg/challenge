package practice.easy.lucky5;

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
            String N = br.readLine();
            res.append(countOP(N)).append("\n");
        }

        System.out.print(res);
    }

    public static int countOP(String N) {
        int count = 0;

        for (int i = 0; i < N.length(); ++i) {
            int c = N.charAt(i);

            if (c != '4' && c != '7')
                ++count;
        }

        return count;
    }
}
