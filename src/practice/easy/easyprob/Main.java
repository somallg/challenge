package practice.easy.easyprob;

/**
 * Created by somallg on 5/1/14.
 */

import java.util.Stack;

public class Main {

    public static void main(String[] args) {
        StringBuilder res = new StringBuilder();
        int n[] = {137, 1315, 73, 136, 255, 1384, 16385};

        for (int i = 0; i < 7; ++i)
            res.append(n[i]).append("=").append(convert(n[i], "")).append("\n");

        System.out.print(res);
    }

    public static String convert(int n, String s) {
        if (n == 0)
            return "0";

        Stack<Integer> v = new Stack<Integer>();
        int bit = 0;
        while (n != 0) {
            if ((n & 1) != 0)
                v.push(bit);
            n >>= 1;
            ++bit;
        }

        for (int i : v) {
            if (i == 1)
                s = "2+" + s;
            else
                s = "2(" + convert(i, "") + ")+" + s;
        }

        s = s.substring(0, s.length() - 1);

        return s;
    }

}
