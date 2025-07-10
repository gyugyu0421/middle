package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.MemberDAO;
import com.example.model.MemberVO;


@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public List<MemberVO> getMemberList() {
        return memberDAO.getMemberList();
    }
    
    @Override
    public int getTotalMemberCount() {
        return memberDAO.getTotalMemberCount();
    }
    
    
    @Override
    public int countJanuary() {
        return memberDAO.countJanuary();
    }
    @Override
    public int countFebruary() {
        return memberDAO.countFebruary();
    }
    @Override
    public int countMarch() {
        return memberDAO.countMarch();
    }
    @Override
    public int countApril() {
        return memberDAO.countApril();
    }
    @Override
    public int countMay() {
        return memberDAO.countMay();
    }
    @Override
    public int countJun() {
    	return memberDAO.countJun();
    }
    
    @Override
    public MemberVO getMemberByMKey(Long mkey) {
        return memberDAO.getMemberByMKey(mkey);
    }
    

    @Override
    public int getTotalCompanyCount() {
        return memberDAO.getTotalCompanyCount();
    }
    
    
    @Override
    public int CompanycountJanuary() {
        return memberDAO.CompanycountJanuary();
    }
    @Override
    public int CompanycountFebruary() {
        return memberDAO.CompanycountFebruary();
    }
    @Override
    public int CompanycountMarch() {
        return memberDAO.CompanycountMarch();
    }
    @Override
    public int CompanycountApril() {
        return memberDAO.CompanycountApril();
    }
    @Override
    public int CompanycountMay() {
        return memberDAO.CompanycountMay();
    }
    @Override
    public int CompanycountJun() {
    	return memberDAO.CompanycountJun();
    }
    
    @Override
    public List<MemberVO> getRecentMembers() {
        return memberDAO.getRecentMembers();
    }

    
    @Override
    public int deleteMember(Long mkey) {
        return memberDAO.deleteMember(mkey);
    }
    @Override
    public int deactivateMember(Long mkey) {
        return memberDAO.deactivateMember(mkey);
    }
    @Override
    public int activateMember(Long mkey) {
        return memberDAO.activateMember(mkey);
    }
    
    
    @Override
    public MemberVO login(String id, String pw) {
        // DB에서 아이디, 비밀번호로 회원 정보 조회
        return memberDAO.selectByIdAndPw(id, pw);
    }
    
    @Override
    public double getUserJoinGrowthRate() {
        int recent = memberDAO.countRecentUserJoins();
        int previous = memberDAO.countPreviousUserJoins();

        if (previous > 0) {
            return ((double)(recent - previous) / previous) * 100;
        } else if (recent > 0) {
            return 100.0;
        } else {
            return 0.0;
        }
    }

    @Override
    public double getCompanyJoinGrowthRate() {
        int recent = memberDAO.countRecentCompanyJoins();
        int previous = memberDAO.countPreviousCompanyJoins();

        if (previous > 0) {
            return ((double)(recent - previous) / previous) * 100;
        } else if (recent > 0) {
            return 100.0;
        } else {
            return 0.0;
        }
    }
}
