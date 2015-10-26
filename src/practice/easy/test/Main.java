package practice.easy.test;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int n;
        StringBuilder res = new StringBuilder();
        while ((n = Integer.parseInt(br.readLine())) != 42) {
            res.append(n).append("\n");
        }
        System.out.print(res);
    }
}
