package practice.easy.marcha1;

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
            int M = Integer.parseInt(st.nextToken());

            int[] bankNote = new int[N];
            for (int i = 0; i < N; ++i)
                bankNote[i] = Integer.parseInt(br.readLine());

            res.append(checkBank(bankNote, N, M)).append("\n");
        }

        System.out.print(res);
    }

    public static String checkBank(int[] b, int size, int amount) {
        int sum;
        int n = 1 << size;

        for (int i = 1; i < n; ++i) {
            sum = 0;
            for (int j = 0; j < size; ++j) {
                if ((i & (1 << j)) != 0)
                    sum += b[j];
            }

            if (sum == amount)
                return "Yes";
        }

        return "No";
    }
}
