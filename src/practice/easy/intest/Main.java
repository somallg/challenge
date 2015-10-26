package practice.easy.intest;

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
        int n = Integer.parseInt(st.nextToken());
        int k = Integer.parseInt(st.nextToken());
        int res = 0;
        for (int i = 0; i < n; ++i) {
            int t = Integer.parseInt(br.readLine());
            if (t % k == 0)
                ++res;
        }
        System.out.println(res);

    }
}

