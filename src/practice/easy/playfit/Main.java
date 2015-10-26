package practice.easy.playfit;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.IOException;

public class Main {

    public static byte[] buffer = new byte[65536];
    public static int off = 0;
    public static int bufferSize = 0;

    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        int T = readInt();

        for (int t = 0; t < T; ++t) {
            int N = readInt();
            int max = 0;
            int min = Integer.MAX_VALUE;
            for (int i = 0; i < N; ++i) {
                int G = readInt();
                max = Math.max(max, G - min);
                min = Math.min(min, G);
            }

            res.append(max == 0 ? "UNFIT" : max).append("\n");
        }

        System.out.print(res);
    }

    public static int readInt() throws IOException {
        int n = 0;
        if (off == bufferSize) {
            off = 0;
            bufferSize = System.in.read(buffer);
        }

        for (; off < bufferSize; ++off) {
            if ('0' <= buffer[off] && buffer[off] <= '9')
                n = (n << 3) + (n << 1) + buffer[off] - '0';
            else {
                ++off;
                break;
            }
            if (off == bufferSize - 1) {
                off = -1;
                bufferSize = System.in.read(buffer);
            }
        }

        return n;
    }
}
