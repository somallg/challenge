package practice.easy.rightri;

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
        int count = 0;

        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int x1 = Integer.parseInt(st.nextToken());
            int y1 = Integer.parseInt(st.nextToken());
            int x2 = Integer.parseInt(st.nextToken());
            int y2 = Integer.parseInt(st.nextToken());
            int x3 = Integer.parseInt(st.nextToken());
            int y3 = Integer.parseInt(st.nextToken());

            int a = distance(x1 - x2, y1 - y2);
            int b = distance(x1 - x3, y1 - y3);
            int c = distance(x2 - x3, y2 - y3);

            if (isRightTriangle(a, b, c))
                ++count;
        }
        res.append(count).append("\n");
        System.out.print(res);
    }

    public static boolean isRightTriangle(int a, int b, int c) {
        return 2 * max(a, b, c) == a + b + c;
    }

    public static int distance(int x, int y) {
        return x * x + y * y;
    }

    public static int max(int a, int b, int c) {
        return Math.max(Math.max(a, b), Math.max(a, c));
    }
}
