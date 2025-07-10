package com.example.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserQnaVO {
    private Integer qnakey;
    private Integer mkey;
    private String id;
    private String qnatitle;
    private String qnacontents;
    private Date qnadate;
    private String qnaStatus;

    private String adminTitle;
    private String adminContents;
    private Date adminDate;
    
    private String username;
    private String type;
}