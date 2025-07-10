package com.example.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FreeVO {
	private Integer fbkey;
    private Integer mkey;
    private String id;
    private String fbtitle;
    private String fbcontent;
    private Date fbdate;
    private Integer fbview;
    private Integer fblike;
    private String fbcategory;
    private String username;
   // private String category;
}
