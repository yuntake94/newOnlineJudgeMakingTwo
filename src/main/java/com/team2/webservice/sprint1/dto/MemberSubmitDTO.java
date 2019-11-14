package com.team2.webservice.sprint1.dto;


import lombok.Data;

@Data
public class MemberSubmitDTO {

    private String submit_name;
    private Double submit_studentscore;
    private int submit_toeicscore;
    private int submit_certificatenumber;
    private int submit_overseanumber;
    private int submit_internnumber;
    private int submit_competition;
    private String submit_textbox1;
    private String submit_textbox2;
    private String submit_textbox3;

}
