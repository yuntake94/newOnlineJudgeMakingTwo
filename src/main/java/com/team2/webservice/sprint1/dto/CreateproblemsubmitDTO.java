package com.team2.webservice.sprint1.dto;


import lombok.Data;

@Data
public class CreateproblemsubmitDTO {


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

}
