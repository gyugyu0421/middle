package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class MembersVO {
	private int mkey;
    private String id;
    private String pw;
    private String username;
    private String email;
    private String phone;
    private String status;
    private String madd1;
    private String madd2;
    private String cnum;
    private String cscale;
    private String type;
    
    private java.sql.Date reg_date;
    private java.sql.Date mbirth;
}
