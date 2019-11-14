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
@Table(name="dashboard")
public class Dashboard {



    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;
    private int did;
    private int allmembercount;
    private int todaymembercount;
    private Double selfintroduction;
    private int questioncount;
    private Double averagestudentscore;
    private Double averageoverseascore;
    private Double averageprizescore;
    private Double averagecertificatescore;
    private Double averagetoeicscore;
    private Double averageinternscore;


/*
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="name")
    private Myinfo myinfo;
*/

    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.REMOVE)
    @JoinColumn(name="uid")
    private List<Textfile> textfiles;




    //private String content;
    //private Date postTime;
}
