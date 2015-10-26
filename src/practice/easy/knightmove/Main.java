package practice.easy.knightmove;

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
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            String s = br.readLine();
            res.append(isCorrectMove(s)).append("\n");
        }

        System.out.print(res);
    }

    public static boolean isValidMove(char[] a) {
        return (a.length == 2) && ('a' <= a[0] && a[0] <= 'h') && ('1' <= a[1] && a[1] <= '8');
    }

    public static String isCorrectMove(String s) {
        if (s.length() != 5 || s.charAt(2) != '-')
            return "Error";

        StringTokenizer st = new StringTokenizer(s, "-");

        char[] a = st.nextToken().toCharArray();
        char[] b = st.nextToken().toCharArray();

        if (!isValidMove(a) || !isValidMove(b))
            return "Error";

        if (Math.abs(a[0] - b[0]) == 1 && Math.abs(a[1] - b[1]) == 2
                || Math.abs(a[0] - b[0]) == 2 && Math.abs(a[1] - b[1]) == 1)
            return "Yes";

        return "No";
    }
}
