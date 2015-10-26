package practice.easy.error;

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
            res.append(s.contains("010") || s.contains("101") ? "Good" : "Bad").append("\n");
        }
        System.out.print(res);
    }
}
