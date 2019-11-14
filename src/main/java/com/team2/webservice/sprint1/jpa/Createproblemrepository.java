package com.team2.webservice.sprint1.jpa;


import com.team2.webservice.sprint1.vo.Createproblemsubmit;
import com.team2.webservice.sprint1.vo.Member;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface Createproblemrepository extends JpaRepository<Createproblemsubmit, Integer> {


Optional<Createproblemsubmit> findByCreateproblemproblemname(String name);


} // 인터페이스를 생성후, JpaRepository<Entity 클래스, PK타입>을 상속하면 기본적인 CRUD 메소드가 자동생성됨
