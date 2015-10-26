package practice.easy.cooling;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            int N = Integer.parseInt(br.readLine());

            int[] pies = new int[N];
            StringTokenizer st = new StringTokenizer(br.readLine());
            for (int i = 0; i < N; ++i)
                pies[i] = Integer.parseInt(st.nextToken());

            int[] racks = new int[N];
            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < N; ++i)
                racks[i] = Integer.parseInt(st.nextToken());

            Arrays.sort(pies);
            Arrays.sort(racks);

            int i = 0, j = 0, count = 0;

            while (i < N && j < N) {
                if (pies[i] > racks[j])
                    ++j;
                else {
                    ++count;
                    ++i;
                    ++j;
                }
            }

            res.append(count).append("\n");
        }

        System.out.print(res);
    }
}
