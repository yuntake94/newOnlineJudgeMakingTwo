package com.team2.webservice.sprint1.jpa;

import com.team2.webservice.sprint1.vo.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface MemberRepository extends JpaRepository<Member, Integer> {

    Optional<Member> findByEmail(String email);
    Optional<Member> findByPassword(String password);
    Optional<Member> findByEmailAndPassword(String email,String password);
    Optional<Member> findByUid(int uid);
    Optional<Member> findByCid(int cid);
    Optional<Member> findByName(String name);


} // 인터페이스를 생성후, JpaRepository<Entity 클래스, PK타입>을 상속하면 기본적인 CRUD 메소드가 자동생성됨
