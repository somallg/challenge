package practice.easy.fctrl;

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
            int n = Integer.parseInt(br.readLine());
            res.append(countZero(n)).append("\n");
        }
        System.out.print(res);
    }

    private static int countZero(int n) {
        int res = 0;

        while (n != 0) {
            res += n / 5;
            n /= 5;
        }

        return res;
    }
}
