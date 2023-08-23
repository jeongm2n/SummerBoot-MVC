package com.spring.summerboot2.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodayresService {
    @Autowired
    TodayresDAO todayresDAO;

    public List<ReservationVO> todayresList(String param) {
        return todayresDAO.todayresList(param);
    }
}
