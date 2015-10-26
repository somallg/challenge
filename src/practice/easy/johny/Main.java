package practice.easy.johny;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        StringBuilder res = new StringBuilder();

        for (int t = 0; t < T; ++t) {
            int N = Integer.parseInt(br.readLine());

            StringTokenizer st = new StringTokenizer(br.readLine());
            int[] A = new int[N];
            for (int i = 0; i < N; ++i)
                A[i] = Integer.parseInt(st.nextToken());

            int K = Integer.parseInt(br.readLine());

            int count = 1;
            for (int i = 0; i < N; ++i) {
                if (A[i] < A[K - 1])
                    ++count;
            }
            res.append(count).append("\n");
        }
        System.out.print(res);
    }
}
