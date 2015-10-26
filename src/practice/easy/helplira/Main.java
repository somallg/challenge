package practice.easy.helplira;

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
        int N = Integer.parseInt(br.readLine());

        double aMin = Double.POSITIVE_INFINITY, aMax = 0;
        int iMin = 0, iMax = 0;
        for (int t = 0; t < N; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int[] x = new int[6];
            for (int i = 0; i < 6; ++i)
                x[i] = Integer.parseInt(st.nextToken());

            double a = area(x);

            if (a <= aMin) {
                aMin = a;
                iMin = t + 1;
            }
            if (aMax <= a) {
                aMax = a;
                iMax = t + 1;
            }
        }

        res.append(iMin).append(" ").append(iMax).append("\n");
        System.out.print(res);
    }

    public static double area(int[] x) {
        double a = distance(x[0] - x[2], x[1] - x[3]);
        double b = distance(x[0] - x[4], x[1] - x[5]);
        double c = distance(x[2] - x[4], x[3] - x[5]);
        double S = (a + b + c) / 2;

        return Math.sqrt(S * (S - a) * (S - b) * (S - c));
    }

    public static double distance(int d1, int d2) {
        return Math.sqrt(d1 * d1 + d2 * d2);
    }
}
