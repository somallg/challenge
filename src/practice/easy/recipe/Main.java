package practice.easy.recipe;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int N = Integer.parseInt(st.nextToken());
            int[] A = new int[N];
            for (int i = 0; i < N; ++i)
                A[i] = Integer.parseInt(st.nextToken());

            int gcd = gcd(A);
            for (int i = 0; i < N - 1; ++i)
                res.append(A[i] / gcd).append(" ");
            res.append(A[N - 1] / gcd).append("\n");
        }

        System.out.print(res);
    }

    public static int gcd(int a, int b) {
        while (b != 0) {
            int t = b;
            b = a % b;
            a = t;
        }

        return a;
    }

    public static int gcd(int[] a) {
        int n = a[0];

        for (int i = 1; i < a.length; ++i)
            n = gcd(n, a[i]);

        return n;
    }
}
