package practice.easy.poker;

/**
 * Created by somallg on 5/1/14.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {

    // Kinds of suits
    public final static int DIAMONDS = 0;
    public final static int CLUBS = 1;
    public final static int HEARTS = 2;
    public final static int SPADES = 3;

    // Kinds of ranks
    public final static int ACE = 0;
    public final static int DEUCE = 1;
    public final static int THREE = 2;
    public final static int FOUR = 3;
    public final static int FIVE = 4;
    public final static int SIX = 5;
    public final static int SEVEN = 6;
    public final static int EIGHT = 7;
    public final static int NINE = 8;
    public final static int TEN = 9;
    public final static int JACK = 10;
    public final static int QUEEN = 11;
    public final static int KING = 12;


    public static void main(String[] args) throws IOException {
        StringBuilder res = new StringBuilder();

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int T = Integer.parseInt(br.readLine());

        for (int t = 0; t < T; ++t) {
            StringTokenizer st = new StringTokenizer(br.readLine());
            int[] ranks = new int[13];
            int[] suits = new int[4];
            for (int i = 0; i < 5; ++i) {
                String hi = st.nextToken();
                toArray(hi, ranks, suits);
            }

            res.append(toString(ranks, suits)).append("\n");
        }

        System.out.print(res);
    }

    public static String toString(int[] ranks, int[] suits) {
        if (isRoyal(ranks) && isFlush(suits))
            return "royal flush";
        else if (isStraight(ranks) && isFlush(suits))
            return "straight flush";
        else if (isFourOfAKind(ranks))
            return "four of a kind";
        else if (isFullHouse(ranks))
            return "full house";
        else if (isFlush(suits))
            return "flush";
        else if (isStraight(ranks))
            return "straight";
        else if (isThreeOfAKind(ranks))
            return "three of a kind";
        else if (isTwoPairs(ranks))
            return "two pairs";
        else if (isPair(ranks))
            return "pair";

        return "high card";
    }

    public static void toArray(String h, int[] ranks, int[] suits) {
        switch (h.charAt(0)) {
            case '2':
                ++ranks[DEUCE];
                break;
            case '3':
                ++ranks[THREE];
                break;
            case '4':
                ++ranks[FOUR];
                break;
            case '5':
                ++ranks[FIVE];
                break;
            case '6':
                ++ranks[SIX];
                break;
            case '7':
                ++ranks[SEVEN];
                break;
            case '8':
                ++ranks[EIGHT];
                break;
            case '9':
                ++ranks[NINE];
                break;
            case 'T':
                ++ranks[TEN];
                break;
            case 'J':
                ++ranks[JACK];
                break;
            case 'Q':
                ++ranks[QUEEN];
                break;
            case 'K':
                ++ranks[KING];
                break;
            default:
                ++ranks[ACE];
                break;
        }

        switch (h.charAt(1)) {
            case 'D':
                ++suits[DIAMONDS];
                break;
            case 'C':
                ++suits[CLUBS];
                break;
            case 'H':
                ++suits[HEARTS];
                break;
            default:
                ++suits[SPADES];
                break;
        }
    }

    public static boolean isRoyal(int[] ranks) {
        return ranks[TEN] == 1 && ranks[JACK] == 1 && ranks[QUEEN] == 1 && ranks[KING] == 1 && ranks[ACE] == 1;
    }

    public static boolean isFlush(int[] suits) {
        for (int i = DIAMONDS; i <= SPADES; ++i) {
            if (suits[i] == 5)
                return true;
        }

        return false;
    }

    public static boolean isStraight(int[] ranks) {
        if (isRoyal(ranks))
            return true;

        int min = 13;
        int max = 0;
        for (int i = ACE; i <= KING; ++i) {
            if (ranks[i] > 1) {
                return false;
            } else if (ranks[i] == 1) {
                min = Math.min(min, i);
                max = Math.max(max, i);
            }
        }

        return max - min + 1 == 5;

    }

    public static boolean isFourOfAKind(int[] ranks) {
        for (int i = ACE; i <= KING; ++i)
            if (ranks[i] == 4)
                return true;

        return false;
    }

    public static boolean isFullHouse(int[] ranks) {
        return isThreeOfAKind(ranks) && isPair(ranks);
    }

    public static boolean isThreeOfAKind(int[] ranks) {
        for (int i = ACE; i <= KING; ++i)
            if (ranks[i] == 3)
                return true;

        return false;
    }

    public static boolean isTwoPairs(int[] ranks) {
        return countPair(ranks) == 2;
    }

    public static boolean isPair(int[] ranks) {
        return countPair(ranks) == 1;
    }

    public static int countPair(int[] ranks) {
        int count = 0;
        for (int i = ACE; i <= KING; ++i)
            if (ranks[i] == 2)
                ++count;

        return count;
    }
}
