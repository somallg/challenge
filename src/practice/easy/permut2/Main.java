package practice.easy.permut2;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int N;
        while ((N = Integer.parseInt(br.readLine())) != 0) {
            int[] a = new int[N];
            StringTokenizer st = new StringTokenizer(br.readLine());
            for (int i = 0; i < N; ++i)
                a[i] = Integer.parseInt(st.nextToken());

            int i;
            for (i = 0; i < N && i + 1 == a[a[i] - 1]; ++i) ;
            res.append(i < N ? "not ambiguous" : "ambiguous").append("\n");
        }

        System.out.print(res);
    }
}
