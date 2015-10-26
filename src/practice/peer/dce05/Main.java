package practice.peer.dce05;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());


        for (int t = 0; t < T; ++t) {
            int n = Integer.parseInt(br.readLine());
            res.append(1 << (int) (Math.log(n) / Math.log(2))).append("\n");
        }

        System.out.print(res);
    }
}

