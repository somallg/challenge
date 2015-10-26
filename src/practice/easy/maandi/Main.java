package practice.easy.maandi;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder res = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            int N = Integer.parseInt(br.readLine());
            int count = 0;
            for (int i = 1; i * i < N; ++i) {
                if (N % i == 0) {
                    if (isOverlucky(i))
                        ++count;
                    int l = N / i;
                    if (l != i && isOverlucky(l))
                        ++count;
                }
            }
            res.append(count + "\n");
        }
        System.out.print(res);
    }

    public static boolean isOverlucky(int n) {
        while (n != 0) {
            int r = n % 10;
            if (r == 7 || r == 4)
                return true;
            n /= 10;
        }
        return false;
    }
}
