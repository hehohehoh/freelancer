package com.spring.freelancer.free;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("carList")
public class CareerList {

	private List<FreeCareerVO> carList;
}
