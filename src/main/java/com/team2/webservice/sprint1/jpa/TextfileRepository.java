package com.team2.webservice.sprint1.jpa;

import com.team2.webservice.sprint1.vo.Textfile;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TextfileRepository extends JpaRepository<Textfile, Integer> {


    Optional<Textfile> findByCid(int cid);
    Optional<Textfile> findByMember_Name(String name);
    Optional<Textfile> findByMember_Uid(int uid);



} // 인터페이스를 생성후, JpaRepository<Entity 클래스, PK타입>을 상속하면 기본적인 CRUD 메소드가 자동생성됨
