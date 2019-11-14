package com.team2.webservice.sprint1.vo;


import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name="createproblem")
public class Createproblemsubmit {


    private String createproblem_problem_number;
    private String createproblemproblemname;
    private String createproblem_problem_explanation;
    private String createproblem_problem_input_explanation;
    private String createproblem_problem_output_explanation;
    private String createproblem_problem_timelimit;
    private String createproblem_problem_memorylimit;
    private String createproblem_problem_difficulty;
    private String createproblem_problem_input_sample;
    private String createproblem_problem_output_sample;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int cid;

}
