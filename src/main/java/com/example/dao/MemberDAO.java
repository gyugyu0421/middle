package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.model.MemberVO;


@Mapper
public interface MemberDAO {

	public List<MemberVO>getMemberList();
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
    
    MemberVO selectByIdAndPw(@Param("id") String id, @Param("pw") String pw);
    
    
    int countRecentUserJoins();
    int countPreviousUserJoins();
    int countRecentCompanyJoins();
    int countPreviousCompanyJoins();
}
