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
@Table(name="member")
public class Member  {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    private String email;
    private String password;
    private String name;
    private Double studentscore;
    private int toeicscore;
    private int certificatenumber;
    private int overseanumber;
    private int internnumber;
    private int competition;
    private Blob img;
    private String date;
    private int uid;
/*
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="name")
    private Myinfo myinfo;
*/

    @OneToMany(mappedBy = "member",cascade = CascadeType.REMOVE)
    //@JoinColumn(name="uid")
    private List<Textfile> textfiles;




    //private String content;
    //private Date postTime;
}
