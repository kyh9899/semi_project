package com.hm.mvc.model.enrollment;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Enroll {
    private String pgTitle;
    private String fcName;
    private String chName;
    private String pgTime;
    private String pgDate;
    private String pgFee;
    private int pgMax;
    private int pgNum;
    private String ermAva;
    
}

