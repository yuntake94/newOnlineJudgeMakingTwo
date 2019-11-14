package com.team2.webservice.sprint1.controller;

import com.team2.webservice.sprint1.jpa.TextfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TextfileController {


    @Autowired
    private TextfileRepository textfileRepository;

/*

    @RequestMapping("/repository_update")
    public String DataUpdateToJsp(ModelMap model)
    {
        System.out.println("In LikeRecord");


        List<Textfile> textfileList = textfileRepository.findAll(); // select * from LikeRecord
        List<Myinfo> myinfoList = myinfoRepository.findAll();

        model.addAttribute("myinfoModelList",myinfoList);
        model.addAttribute("textfileModelList", textfileList);
        System.out.println(textfileList.get(0).getUid());


        return "index";
    }*/
}
