package practice.easy.maxdiff;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int N = Integer.parseInt(st.nextToken());
            int K = Integer.parseInt(st.nextToken());

            int[] w = new int[N];
            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < N; ++i)
                w[i] = Integer.parseInt(st.nextToken());

            Arrays.sort(w);

            K = Math.min(K, N - K);
            long S = 0, S1 = 0;
            for (int i = 0; i < N; ++i) {
                S += w[i];
                if (i < K)
                    S1 += w[i];
            }

            res.append(Math.abs(S1 - (S - S1))).append("\n");
        }

        System.out.print(res);
    }
}
