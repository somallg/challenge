package practice.easy.hello;

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
            double D = Double.parseDouble(st.nextToken());
            double U = Double.parseDouble(st.nextToken());
            double N = Double.parseDouble(st.nextToken());
            double C = D * U;
            int ans = 0;
            for (int i = 1; i <= N; ++i) {
                String[] p = br.readLine().split(" ");
                double Mi = Double.parseDouble(p[0]);
                double Ri = Double.parseDouble(p[1]);
                double Ci = Double.parseDouble(p[2]);

                double Ei = Ci / Mi + Ri * U;

                if (Ei - C < 0) {
                    C = Ei;
                    ans = i;
                }
            }
            res.append(ans).append("\n");
        }
        System.out.print(res);
    }
}
