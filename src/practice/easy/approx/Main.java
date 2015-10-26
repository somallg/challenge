package practice.easy.approx;

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
            int K = Integer.parseInt(br.readLine());
            if (K == 0)
                res.append(3).append("\n");
            else
                res.append(3).append(".").append(digits(K)).append("\n");
        }
        System.out.print(res);
    }

    public static String digits(int K) {
        int A = 103993;
        int B = 33102;
        StringBuilder res = new StringBuilder();
        int mod = A % B;
        for (int i = 0; i < K; ++i) {
            mod = (mod << 3) + (mod << 1);
            res.append(mod / B);
            mod = mod % B;
        }
        return new String(res);
    }
}
