package practice.easy.tsort;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());
        int[] N = new int[T];
        for (int t = 0; t < T; ++t) {
            N[t] = Integer.parseInt(br.readLine());
        }

        Arrays.sort(N);

        StringBuilder s = new StringBuilder();
        for (int t = 0; t < T; ++t)
            s.append(N[t]).append("\n");
        System.out.print(s);
    }
}

