package practice.easy.mchairs;

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
        StringBuilder s = new StringBuilder();
        long MOD = 1000000007L;
        for (int t = 0; t < T; ++t) {
            long N = Long.parseLong(br.readLine());
            long res = 1L;
            long base = 2L;
            while (N > 0) {
                if (N % 2 == 1)
                    res = (res * base) % MOD;
                N >>= 1;
                base = (base * base) % MOD;
            }
            s.append(res - 1 + "\n");
        }
        System.out.print(s);
    }
}
