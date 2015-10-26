package practice.easy.spcandy;

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
            StringTokenizer st = new StringTokenizer(br.readLine());
            Long N = Long.parseLong(st.nextToken());
            Long K = Long.parseLong(st.nextToken());

            if (K == 0)
                res.append("0 ").append(N).append("\n");
            else
                res.append(N / K).append(" ").append(N % K).append("\n");
        }

        System.out.print(res);
    }
}

