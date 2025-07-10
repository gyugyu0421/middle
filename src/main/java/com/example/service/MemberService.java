package com.example.service;

import java.util.List;

import com.example.model.MemberVO;


public interface MemberService {
	
	public List<MemberVO> getMemberList();
	int getTotalMemberCount();
	
	
    int countJanuary();
    int countFebruary();
    int countMarch();
    int countApril();
    int countMay();
    int countJun();
    
    MemberVO getMemberByMKey(Long mkey);
    
    int getTotalCompanyCount();
    
    int CompanycountJanuary();
    int CompanycountFebruary();
    int CompanycountMarch();
    int CompanycountApril();
    int CompanycountMay();
    int CompanycountJun();

    List<MemberVO> getRecentMembers();
    
    int deleteMember(Long mkey);

    int deactivateMember(Long mkey);
    int activateMember(Long mkey);

    
    MemberVO login(String id, String pw);
    
    double getUserJoinGrowthRate();
    double getCompanyJoinGrowthRate();
    
}
