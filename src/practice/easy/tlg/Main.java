package practice.easy.tlg;

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

        int m = 0, diff = 0, p;
        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int s1 = Integer.parseInt(st.nextToken());
            int s2 = Integer.parseInt(st.nextToken());
            diff += s1 - s2;
            if (Math.abs(diff) > Math.abs(m))
                m = diff;
        }

        p = m > 0 ? 1 : 2;
        res.append(p).append(" ").append(Math.abs(m)).append("\n");
        System.out.print(res);
    }
}

