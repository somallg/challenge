package practice.easy.sumtrian;

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
            int[][] a = new int[100][100];
            int n = Integer.parseInt(br.readLine());

            for (int i = 0; i < n; ++i) {
                StringTokenizer st = new StringTokenizer(br.readLine());
                for (int j = 0; j <= i; ++j)
                    a[i][j] = Integer.parseInt(st.nextToken());
            }

            for (int i = n - 2; i >= 0; --i)
                for (int j = i; j >= 0; --j)
                    a[i][j] = a[i + 1][j] > a[i + 1][j + 1]
                            ? a[i][j] + a[i + 1][j] : a[i][j] + a[i + 1][j + 1];

            res.append(a[0][0]).append("\n");
        }

        System.out.print(res);
    }
}

