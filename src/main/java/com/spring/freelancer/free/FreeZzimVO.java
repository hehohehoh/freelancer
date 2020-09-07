package com.spring.freelancer.free;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component("freeZzimVO")
public class FreeZzimVO {

   private String free_id;
   private String comp_id;
}