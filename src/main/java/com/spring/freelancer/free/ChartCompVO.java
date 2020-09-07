package com.spring.freelancer.free;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("chartCompVO")
public class ChartCompVO {
	private String pdate;
	private int cnt;
}
