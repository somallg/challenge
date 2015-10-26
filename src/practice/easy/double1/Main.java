package practice.easy.double1;

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

        StringBuilder s = new StringBuilder();
        for (int t = 0; t < T; ++t) {
            int n = Integer.parseInt(br.readLine());
            s.append((n & 1) == 1 ? n - 1 : n).append("\n");
        }
        System.out.print(s);
    }
}
