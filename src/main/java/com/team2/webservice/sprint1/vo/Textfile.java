package com.team2.webservice.sprint1.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Blob;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name="textfile")
public class Textfile {
    @Id // 해당 테이블의 PK필드
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;

    private String textbox1;
    private String textbox2;
    private String textbox3;
    private String textbox4;
    private String textbox5;
    private Blob textfileimg;
    private int filed;
    private String date;
    //private int uid;



    @ManyToOne
    @JoinColumn(name = "uid")
    private Member member;


    //private String content;
    //private Date postTime;
}
