package practice.easy.rowcolop;

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
        StringTokenizer st = new StringTokenizer(br.readLine());

        int N = Integer.parseInt(st.nextToken());
        int Q = Integer.parseInt(st.nextToken());
        int[] rows = new int[N + 1];
        int[] cols = new int[N + 1];
        Arrays.fill(rows, 0);
        Arrays.fill(cols, 0);

        for (int i = 0; i < Q; ++i) {
            st = new StringTokenizer(br.readLine());
            String op = st.nextToken();
            int r = Integer.parseInt(st.nextToken());
            int c = Integer.parseInt(st.nextToken());

            if (op.equals("RowAdd"))
                rows[r] += c;
            else if (op.equals("ColAdd"))
                cols[r] += c;
        }

        res.append(max(rows) + max(cols)).append("\n");
        System.out.print(res);
    }

    public static int max(int[] a) {
        int m = 0;
        for (int i : a)
            m = Math.max(m, i);

        return m;
    }
}
