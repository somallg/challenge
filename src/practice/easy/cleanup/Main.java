package practice.easy.cleanup;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Stack;
import java.util.StringTokenizer;

public class Main {

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int N = Integer.parseInt(st.nextToken());
            int M = Integer.parseInt(st.nextToken());

            int[] jobs = new int[N + 1];
            for (int i = 1; i <= N; ++i)
                jobs[i] = i;

            Stack<Integer> chef = new Stack<Integer>();
            Stack<Integer> assistant = new Stack<Integer>();
            boolean isChef = true;

            st = new StringTokenizer(br.readLine());
            for (int i = 0; i < M; ++i) {
                int finished = Integer.parseInt(st.nextToken());
                jobs[finished] = 0;
            }

            for (int i = 1; i <= N; ++i) {
                if (jobs[i] != 0) {
                    if (isChef) {
                        chef.push(jobs[i]);
                        isChef = false;
                    } else {
                        assistant.push(jobs[i]);
                        isChef = true;
                    }
                }
            }

            addRes(chef, res);
            addRes(assistant, res);
        }

        System.out.print(res);
    }

    public static void addRes(Stack<Integer> s, StringBuilder res) {
        if (s.size() == 0)
            res.append("\n");
        else {
            for (int i = 0; i < s.size() - 1; ++i)
                res.append(s.get(i)).append(" ");
            res.append(s.get(s.size() - 1)).append("\n");
        }
    }
}