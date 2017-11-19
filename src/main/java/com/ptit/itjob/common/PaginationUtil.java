package com.ptit.itjob.common;

import org.springframework.data.domain.Page;

import java.util.HashMap;
import java.util.Map;

public class PaginationUtil {
    public static Map<String, Integer> paging(Page page) {
        // Spring Data JPA page index is from 0
        int currentIndex = page.getNumber() + 1;
        int beginIndex = Math.max(1, currentIndex - 2);
        int endIndex = Math.min(beginIndex + 4, page.getTotalPages());

        Map<String, Integer> result = new HashMap<>();
        result.put("beginIndex", beginIndex);
        result.put("currentIndex", currentIndex);
        result.put("endIndex", endIndex);
        return result;
    }
}
