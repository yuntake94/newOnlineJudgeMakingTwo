package com.team2.webservice.sprint1.service;

import com.team2.webservice.sprint1.dto.LoginDTO;
import com.team2.webservice.sprint1.vo.Member;

import java.util.Optional;

public interface MemberService    // 로그인 처리
{

    //boolean validEmail(String email) throws Exception;
    Optional<Member> login(LoginDTO loginDTO) throws Exception;
}
