package com.team2.webservice.sprint1.service;

import com.team2.webservice.sprint1.dto.LoginDTO;
import com.team2.webservice.sprint1.jpa.MemberRepository;
import com.team2.webservice.sprint1.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public  class MemberServiceImpl implements MemberService{


    @Autowired
    MemberRepository memberRepository;

    @Override
    public Optional<Member> login(LoginDTO loginDTO){
        System.out.println(loginDTO.getMemberEmail());
        System.out.println(loginDTO.getMemberPw());
        Optional<Member> oMember = memberRepository.findByEmailAndPassword(
                loginDTO.getMemberEmail(), loginDTO.getMemberPw());

        return oMember;
    }





}
