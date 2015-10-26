package practice.easy.fctrl2;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder res = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            int n = Integer.parseInt(br.readLine());
            res.append(fact(n)).append("\n");
        }
        System.out.print(res);
    }

    private static BigInteger fact(int n) {
        BigInteger res = BigInteger.ONE;
        for (int i = 2; i <= n; ++i)
            res = res.multiply(BigInteger.valueOf(i));

        return res;
    }
}
