package com.morning.filter;

import java.util.HashSet;
import java.util.Set;

public class BadWordFilter {
	
    private static final Set<String> BAD_WORDS = new HashSet<>();

    static {
        BAD_WORDS.add("badword1");
        BAD_WORDS.add("badword2");
        BAD_WORDS.add("badword3");
        // 필터링할 비속어를 추가합니다.
    }

    public static boolean containsBadWord(String input) {
        String[] words = input.split("\\s+");
        for (String word : words) {
            if (BAD_WORDS.contains(word.toLowerCase())) {
                return true;
            }
        }
        return false;
    }

    public static String filterBadWords(String input) {
        String[] words = input.split("\\s+");
        StringBuilder filteredInput = new StringBuilder();
        for (String word : words) {
            if (BAD_WORDS.contains(word.toLowerCase())) {
                filteredInput.append("***");  // 비속어를 대체할 문자열
            } else {
                filteredInput.append(word);
            }
            filteredInput.append(" ");
        }
        return filteredInput.toString().trim();
    }
}
