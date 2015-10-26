package practice.easy.directi;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            int N = Integer.parseInt(br.readLine());
            Stack<String> d = new Stack<String>();
            Stack<String> x = new Stack<String>();
            for (int i = 0; i < N; ++i) {
                String s = br.readLine();
                int p = s.indexOf(' ');
                String di = s.substring(0, p);
                String xi = s.substring(p + 1);

                if (di.equals("Begin"))
                    x.push(xi);
                else if (di.equals("Right")) {
                    d.push("Left");
                    x.push(xi);
                } else {
                    d.push("Right");
                    x.push(xi);
                }
            }
            d.push("Begin");

            while (!d.isEmpty())
                res.append(d.pop()).append(" ").append(x.pop()).append("\n");
            res.append("\n");
        }

        System.out.print(res);
    }
}
