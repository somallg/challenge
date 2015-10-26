package practice.easy.cielrcpt;

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
            int P = Integer.parseInt(br.readLine());
            res.append(cielrcpt(P)).append("\n");
        }

        System.out.print(res);
    }

    public static int countBit(int n) {
        int count = 0;
        for (; n != 0; n &= n - 1)
            ++count;

        return count;
    }

    public static int cielrcpt(int n) {
        if (n < 4096)
            return countBit(n);

        return n / 2048 * countBit(2048) + countBit(n % 2048);
    }
}