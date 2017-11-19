package com.ptit.itjob.common;

public class StringUtil {
    public static String splice(String input, int num) {
        String[] words = input.split("\\s+");
        if (words.length < 10) {
            num = words.length;
        }
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < num; i++) {
            builder.append(words[i]);
            builder.append(" ");
        }
        return builder.toString();
    }
}
