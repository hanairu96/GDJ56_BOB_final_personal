package com.today.bab.onedayclass.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AdminMaster {
   private String memberId;
   private String history; //활동이력
   private Date apply; //신청날짜
   private String info; //신청글
   private String name; //강사명
   private String ing; //진행상황
   private Date testDate; //심사날짜
}
