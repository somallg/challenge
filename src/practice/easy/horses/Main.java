package practice.easy.horses;

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
            int N = Integer.parseInt(br.readLine());
            StringTokenizer st = new StringTokenizer(br.readLine());
            int[] A = new int[N];
            for (int i = 0; i < N; ++i)
                A[i] = Integer.parseInt(st.nextToken());

            Arrays.sort(A);
            int min = Integer.MAX_VALUE;
            for (int i = 1; i < N; ++i)
                min = Math.min(min, A[i] - A[i - 1]);

            res.append(min).append("\n");
        }

        System.out.print(res);
    }
}
