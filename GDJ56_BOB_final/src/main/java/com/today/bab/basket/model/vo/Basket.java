package com.today.bab.basket.model.vo;

import java.util.Date;
import java.util.List;

import com.today.bab.market2.model.vo.SellItem;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Basket {
   
   private int basketNo;
   private String memberId;
   private List<SellItem> item;
   private int itemCount;
}