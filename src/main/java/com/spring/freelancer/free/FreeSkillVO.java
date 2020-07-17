package com.spring.freelancer.free;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("freeSkillVO")
public class FreeSkillVO {

	private String free_id;
	private String free_skill;
}
