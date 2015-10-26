package practice.easy.hs08test;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(br.readLine());
        int x = Integer.parseInt(st.nextToken());
        float y = Float.parseFloat(st.nextToken());
        double res;
        if ((x % 5 != 0) || (y - x < 0.5))
            res = y;
        else
            res = y - x - 0.5;

        System.out.printf("%.2f", res);
    }
}
