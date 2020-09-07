package com.spring.freelancer.company;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("chartFreeVO")
public class ChartFreeVO {
	private String ppdate;
	private int ccnt;
}
