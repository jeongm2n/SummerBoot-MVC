package com.spring.summerboot2.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TodayresService {
    @Autowired
    TodayresDAO todayresDAO;

    public List<Map<String,String>> todayresList(int no) {
        return todayresDAO.todayresList(no);
    }
}
