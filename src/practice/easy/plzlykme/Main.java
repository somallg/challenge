package practice.easy.plzlykme;

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
            Long L = Long.parseLong(st.nextToken());
            Long D = Long.parseLong(st.nextToken());
            Long S = Long.parseLong(st.nextToken());
            Long C = Long.parseLong(st.nextToken());

            double life = S * Math.pow(1 + C, D - 1);
            res.append(life - L >= 0 ? "ALIVE AND KICKING" : "DEAD AND ROTTING").append("\n");
        }

        System.out.print(res);
    }
}

