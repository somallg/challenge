/**
 * Created by somallg on 5/1/14.
 */

package practice.easy.caos1;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        StringBuilder res = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            String[] s = br.readLine().split(" ");
            int R = Integer.parseInt(s[0]);
            int C = Integer.parseInt(s[1]);
            String[] m = new String[R];
            for (int i = 0; i < R; ++i)
                m[i] = br.readLine().trim();
            int count = 0;
            for (int i = 0; i < R; ++i)
                for (int j = 0; j < C; ++j)
                    if (check(m, i, j, R, C))
                        ++count;
            res.append(count).append("\n");
        }
        System.out.print(res);
    }

    public static boolean check(String[] m, int i, int j, int R, int C) {
        if (m[i].charAt(j) != '^')
            return false;

        if (i - 2 < 0 || j - 2 < 0 || i + 2 > R - 1 || j + 2 > C - 1)
            return false;

        for (int x = -2; x <= 2; ++x)
            if (m[i + x].charAt(j) != '^' || m[i].charAt(j + x) != '^')
                return false;
        return true;
    }
}