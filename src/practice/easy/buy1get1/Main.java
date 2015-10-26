package practice.easy.buy1get1;

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
            String s = br.readLine();
            int[] a = new int[128];
            for (int i = 0; i < s.length(); ++i)
                ++a[s.charAt(i)];

            int count = 0;
            for (int i = 'A'; i <= 'z'; ++i)
                count += Math.ceil(a[i] / 2.);
            res.append(count).append("\n");
        }

        System.out.print(res);
    }
}
