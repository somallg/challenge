package practice.easy.attic;

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
            String P = br.readLine();
            res.append(countDay(P)).append("\n");
        }

        System.out.print(res);
    }

    public static int countDay(String P) {
        int count = 0, jump = 0, len = 0;

        for (int i = 0; i < P.length(); ++i) {
            int c = P.charAt(i);

            if (c == '.')
                ++len;
            else {
                if (jump < len) {
                    ++count;
                    jump = len;
                }

                len = 0;
            }
        }

        return count;
    }
}
