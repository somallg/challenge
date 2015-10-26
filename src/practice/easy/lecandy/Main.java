package practice.easy.lecandy;

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
            int C = Integer.parseInt(st.nextToken());

            int i = 0;
            st = new StringTokenizer(br.readLine());
            for (i = 0; i < N; ++i) {
                int Ai = Integer.parseInt(st.nextToken());
                C -= Ai;
                if (C < 0)
                    break;
            }

            res.append(i < N ? "No" : "Yes").append("\n");
        }

        System.out.print(res);
    }
}
