package com.team2.webservice.sprint1.controller;

import com.team2.webservice.sprint1.dto.CreateproblemsubmitDTO;
import com.team2.webservice.sprint1.dto.MemberSubmitDTO;

import com.team2.webservice.sprint1.jpa.Createproblemrepository;
import com.team2.webservice.sprint1.jpa.DashboardRepository;
import com.team2.webservice.sprint1.jpa.MemberRepository;

import com.team2.webservice.sprint1.vo.Createproblemsubmit;
import com.team2.webservice.sprint1.vo.Dashboard;
import com.team2.webservice.sprint1.vo.Member;
import com.team2.webservice.sprint1.vo.Textfile;
import com.team2.webservice.sprint1.jpa.TextfileRepository;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {


	@Autowired
	private TextfileRepository textfileRepository;

    @Autowired
    private MemberRepository memberRepository;

    @Autowired
    private DashboardRepository dashboardRepository;

    @Autowired
    private Createproblemrepository createproblemrepository;

    int today_register_textfile_size=0;
    int today_register_member_size=0;

    List<Textfile> textfileList;
    List<Member> memberList;
    List<Dashboard> dashboardList;
    List<Createproblemsubmit> createproblemsubmitList;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, ModelMap model) throws Exception {
		logger.info("Welcome index! The client locale is {}.", locale);


		//#.잠시 오류가 터져서
		textfileList= textfileRepository.findAll();
		memberList= memberRepository.findAll();

		model.addAttribute("textfileList",textfileList);
		model.addAttribute("memberList",memberList);

		return "index";
	}

    @RequestMapping(value = "/pass_fail", method = RequestMethod.GET)
    public String Pass_Fail_Function(Locale locale, ModelMap model) throws Exception {
        logger.info("Welcome index! The client locale is {}.", locale);

        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);

        return "pass_fail";
    }


	
	/*@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) throws Exception {
		logger.info("Welcome login! The client locale is {}.", locale);

		return "login";
	}*/

    @RequestMapping(value = "/detailjun", method = RequestMethod.GET)
    public String DetailJun(Locale locale, Model model) throws Exception {
        logger.info("Welcome login! The client locale is {}.", locale);

        return "detailjun";
    }
    @RequestMapping(value = "/indexjun", method = RequestMethod.GET)
    public String IndexJun(Locale locale, Model model) throws Exception {
        logger.info("Welcome login! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);


        logger.info("IndexJun 은 정상이다.", locale);
        return "indexjun";
    }



	@RequestMapping(value = "/detailjuntwo", method = RequestMethod.GET)
	public String DetailJuntwo(Locale locale, Model model) throws Exception {
		logger.info("Welcome color! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);

		return "detailjuntwo";
		//detailjuntwo
	}



    @RequestMapping(value = "/detailreal", method = RequestMethod.GET)
    public String DetailReal(Locale locale, Model model,HttpServletRequest request) throws Exception {
        logger.info("Welcome color! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();


        String name = request.getParameter("data_a");
        if(name!=null){
            InformationFinding(request,model,name); //#.여기에서 등록함.
            logger.info("InformNAme Not Null");
        }
        else{
            logger.info("InformNAme Null");
        }


        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);



        return "detailreal";
        //detailjuntwo
    }




    @RequestMapping(value = "/tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) throws Exception {
		logger.info("Welcome tables! The client locale is {}.", locale);

		return "tables";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Locale locale, Model model,HttpServletRequest request) throws Exception {
		logger.info("Welcome detail! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);

		return "detail";
	}
	
	@RequestMapping(value = "/charts", method = RequestMethod.GET)
	public String charts(Locale locale, Model model) throws Exception {
		logger.info("Welcome charts! The client locale is {}.", locale);

		return "charts";
		
	}
	
	@RequestMapping(value = "/animation", method = RequestMethod.GET)
	public String animation(Locale locale, Model model) throws Exception {
		logger.info("Welcome animation! The client locale is {}.", locale);

		return "animation";
		
	}
	
	@RequestMapping(value = "/border", method = RequestMethod.GET)
	public String border(Locale locale, Model model) throws Exception {
		logger.info("Welcome border! The client locale is {}.", locale);

		return "border";


	}

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String DashBoardMethod(Locale locale, Model model) throws Exception {
        logger.info("Welcome color! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        DashBoardScoreSaveFunction();

        dashboardList= dashboardRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);
        model.addAttribute("dashboardList",dashboardList);


        model.addAttribute("Width1",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragestudentscore()/4.5)*100)));
        model.addAttribute("Width2",Integer.parseInt(String.format("%.0f",((dashboardList.get(0).getAverageoverseascore()/5)*100))));
        model.addAttribute("Width3",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAverageprizescore()/5)*100)));
        model.addAttribute("Width4",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragecertificatescore()/5)*100)));
        model.addAttribute("Width5",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragetoeicscore()/990)*100)));
        model.addAttribute("Width6",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAverageinternscore()/5)*100)));


        model.addAttribute("allmembernumber",memberList.size()); //#.현재 총 member의 수
        model.addAttribute("alltextfilenumber",textfileList.size()); //#.현재 총 textfile의 갯수
        model.addAttribute("today_register_member_size",today_register_member_size);
        model.addAttribute("today_register_textfile_size",today_register_textfile_size);



        return "dashboard";
        //detailjuntwo
    }


    @RequestMapping(value = "/createProblem", method = RequestMethod.GET)
    public String CreateProblem(Locale locale, Model model) throws Exception {
        logger.info("Welcome color! The client locale is {}.", locale);
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        DashBoardScoreSaveFunction();

        dashboardList= dashboardRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);
        model.addAttribute("dashboardList",dashboardList);


        model.addAttribute("Width1",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragestudentscore()/4.5)*100)));
        model.addAttribute("Width2",Integer.parseInt(String.format("%.0f",((dashboardList.get(0).getAverageoverseascore()/5)*100))));
        model.addAttribute("Width3",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAverageprizescore()/5)*100)));
        model.addAttribute("Width4",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragecertificatescore()/5)*100)));
        model.addAttribute("Width5",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAveragetoeicscore()/990)*100)));
        model.addAttribute("Width6",Integer.parseInt(String.format("%.0f",(dashboardList.get(0).getAverageinternscore()/5)*100)));


        model.addAttribute("allmembernumber",memberList.size()); //#.현재 총 member의 수
        model.addAttribute("alltextfilenumber",textfileList.size()); //#.현재 총 textfile의 갯수
        model.addAttribute("today_register_member_size",today_register_member_size);
        model.addAttribute("today_register_textfile_size",today_register_textfile_size);



        return "createProblem";
        //detailjuntwo
    }
	@RequestMapping(value = "/color", method = RequestMethod.GET)
	public String color(Locale locale, Model model) throws Exception {
		logger.info("Welcome color! The client locale is {}.", locale);

		return "color";
		//detailjuntwo
	}

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String Register(Locale locale, Model model) throws Exception {
        logger.info("Welcome color! The client locale is {}.", locale);

        return "register";
        //detailjuntwo
    }
	
	@RequestMapping(value = "/other", method = RequestMethod.GET)
	public String other(Locale locale, Model model) throws Exception {
		logger.info("Welcome other! The client locale is {}.", locale);

		return "other";
		
	}

	@RequestMapping(value = "/post", method = RequestMethod.GET)
	public String Post_Jsp(Locale locale, Model model) throws Exception {
		logger.info("Welcome other! The client locale is {}.", locale);

		return "post";

	}



    @ResponseBody
    @RequestMapping("/join")
    public Map<String, Object> join() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("name", "victolee");
        map.put("age", 26);

        return map;

    }



    @RequestMapping(value = "/submit", method = RequestMethod.GET)
    public String submit(Locale locale, Model model) throws Exception {
        logger.info("Welcome submit! The client locale is {}.", locale);

        return "submit";

    }
    @RequestMapping(value = "/bookmark", method = RequestMethod.GET)
    public String BookMark(Locale locale, Model model) throws Exception {
        logger.info("Welcome submit! The client locale is {}.", locale);

        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();

        model.addAttribute("textfileList",textfileList);
        model.addAttribute("memberList",memberList);
        return "bookmark";

    }

    @RequestMapping(value = "/problemlist", method = RequestMethod.GET)
    public String ProblemList(Locale locale, Model model) throws Exception {
        logger.info("Welcome submit! The client locale is {}.", locale);


        createproblemsubmitList = createproblemrepository.findAll();


        model.addAttribute("createproblemsubmitList",createproblemsubmitList);
        return "problemlist";

    }



    //problemCheck
    @RequestMapping(value = "/problemcontent", method = RequestMethod.GET)
    public String ProblemContent(Locale locale, Model model,HttpServletRequest request) throws Exception {
        logger.info("Welcome submit! The client locale is {}.", locale);



        createproblemsubmitList = createproblemrepository.findAll();

        String name = request.getParameter("data_a");

        if(name!=null){
            InformGo(request,model,name); //#.여기에서 등록함.
            logger.info("InformNAme Not Null");
        }
        else{
            logger.info("InformNAme Null");
        }

        model.addAttribute("createproblemsubmitList",createproblemsubmitList);
        return "problemcontent";

    }
    //createProblem_submit
    @RequestMapping(value = "/createProblem_submit", method = RequestMethod.POST)
    public String CreateProblemSubmit(CreateproblemsubmitDTO createProblemSubmitDTO, ModelAndView mav, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {//public String SubmitInfo(ModelAndView mav, Myinfo myinfo, @RequestParam MultipartFile image, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {



        httpServletResponse.setContentType("/");
        HttpSession session = httpServletRequest.getSession();


      /*  logger.info(createProblemSubmitDTO.getCreateproblem_problem_input_explanation()

        +"\n"
        + createProblemSubmitDTO.getCreateproblem_problem_timelimit()
        +"\n"  + createProblemSubmitDTO.get()
        );*/


       // CreateProblemSubmit createProblemSubmit= (CreateProblemSubmit) session.getAttribute("login");

        Createproblemsubmit createProblemSubmit = new Createproblemsubmit();
        createProblemSubmit.setCreateproblem_problem_number(createProblemSubmitDTO.getCreateproblem_problem_number());
        createProblemSubmit.setCreateproblemproblemname(createProblemSubmitDTO.getCreateproblemproblemname());
        createProblemSubmit.setCreateproblem_problem_explanation(createProblemSubmitDTO.getCreateproblem_problem_explanation());
        createProblemSubmit.setCreateproblem_problem_input_explanation(createProblemSubmitDTO.getCreateproblem_problem_input_explanation());
        createProblemSubmit.setCreateproblem_problem_output_explanation(createProblemSubmitDTO.getCreateproblem_problem_output_explanation());
        createProblemSubmit.setCreateproblem_problem_input_sample(createProblemSubmitDTO.getCreateproblem_problem_input_sample());
        createProblemSubmit.setCreateproblem_problem_output_sample(createProblemSubmitDTO.getCreateproblem_problem_output_sample());
        createProblemSubmit.setCreateproblem_problem_difficulty(createProblemSubmitDTO.getCreateproblem_problem_difficulty());

        createProblemSubmit.setCreateproblem_problem_timelimit(createProblemSubmitDTO.getCreateproblem_problem_timelimit());
        createProblemSubmit.setCreateproblem_problem_memorylimit(createProblemSubmitDTO.getCreateproblem_problem_memorylimit());








        createproblemrepository.save(createProblemSubmit);


        logger.info("submit됐다");
        logger.info("Board View In");
      //  DashBoardScoreSaveFunction(); //#.DashBoard에 저장한다.

        return "createProblem";
    }

    @RequestMapping(value = "/codeMirror", method = RequestMethod.GET)
    public String Code(Locale locale, Model model) throws Exception {
        logger.info("Welcome submit! The client locale is {}.", locale);


        return "codeMirror";

    }

    @RequestMapping(value = "/submit_data", method = RequestMethod.POST)
    public String SubmitInfo(MemberSubmitDTO memberSubmitDTO, ModelAndView mav, @RequestParam MultipartFile image, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {//public String SubmitInfo(ModelAndView mav, Myinfo myinfo, @RequestParam MultipartFile image, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
        textfileList= textfileRepository.findAll();
        memberList= memberRepository.findAll();
        httpServletResponse.setContentType("/");
        HttpSession session = httpServletRequest.getSession();
        Member member= (Member)session.getAttribute("login");
        member.setCertificatenumber(memberSubmitDTO.getSubmit_certificatenumber());
        member.setCompetition(memberSubmitDTO.getSubmit_competition());
        member.setToeicscore(memberSubmitDTO.getSubmit_toeicscore());
        member.setOverseanumber(memberSubmitDTO.getSubmit_overseanumber());
        member.setInternnumber(memberSubmitDTO.getSubmit_internnumber());
        member.setStudentscore(Double.parseDouble(String.format("%.2f",memberSubmitDTO.getSubmit_studentscore())));
        member.setName(memberSubmitDTO.getSubmit_name());

        logger.info(member.getName()+"GOdGOdGod");

        Textfile textfile= new Textfile();
        textfile.setTextbox1(memberSubmitDTO.getSubmit_textbox1());
        textfile.setTextbox2(memberSubmitDTO.getSubmit_textbox2());
        textfile.setTextbox3(memberSubmitDTO.getSubmit_textbox3());
        textfile.setMember(member);

        Date date = new Date();
        SimpleDateFormat today_Date_Format=new SimpleDateFormat("yyyy-MM-dd");
        textfile.setDate(today_Date_Format.format(date)); //#.오늘 날짜 저장



        try {
            textfile.setTextfileimg(new javax.sql.rowset.serial.SerialBlob(image.getBytes()));
        } catch (SQLException e) {
            Writer temp_writer= new StringWriter();
            e.printStackTrace(new PrintWriter(temp_writer));
            String s = temp_writer.toString();
            logger.info(s);


        }

        try {
            member.setImg(new javax.sql.rowset.serial.SerialBlob(image.getBytes()));
        } catch (SQLException e) {
            Writer temp_writer= new StringWriter();
            e.printStackTrace(new PrintWriter(temp_writer));
            String s = temp_writer.toString();
            logger.info(s);


        }

        textfileRepository.save(textfile);
        memberRepository.save(member);

        logger.info("submit됐다");
        logger.info("Board View In");
        DashBoardScoreSaveFunction(); //#.DashBoard에 저장한다.

        return "home";
    }




    @RequestMapping("/imgcode/{uid}")
    public void imageView(HttpServletRequest req, HttpServletResponse res, @PathVariable("uid") int uid) throws IOException {
        res.setContentType("image/*");


        //Optional<Myinfo> myinfo= myinfoRepository.findByUid(uid);
        System.out.println("imgcode In!");

        try{
            Optional<Textfile> optionalTextfile = textfileRepository.findByCid(uid);
            if(optionalTextfile.isPresent()){
                Textfile textfile  = optionalTextfile.get();

                Blob blob = textfile.getTextfileimg();
                int blob_length =(int)blob.length();
                try{
                    byte[] imagefile1 = textfile.getTextfileimg().getBytes(1,blob_length);
                    InputStream in1 = new ByteArrayInputStream(imagefile1);
                    IOUtils.copy(in1, res.getOutputStream());
                }catch (Exception e){
                    Writer writer= new StringWriter();
                    e.printStackTrace(new PrintWriter(writer));
                    String s = writer.toString();
                    logger.info(s);

                }
            }

        }catch (Exception e){
            Writer writer= new StringWriter();
            e.printStackTrace(new PrintWriter(writer));
            String s = writer.toString();
            logger.info(s);
        }


    }



    @ResponseBody
    @PostMapping
    @RequestMapping("/find_Like")
    public String Find_Like_Click(HttpServletRequest request)
    {
        //#.북마크
        String tr_cid = request.getParameter("tr_cid");
        Optional<Textfile> optionalTextfile = textfileRepository.findByCid(Integer.parseInt(tr_cid));     //.findByPid(Long.parseLong(post_Pid));
        if(optionalTextfile.isPresent()){
            Textfile textfile= optionalTextfile.get();
            textfile.setFiled(1); //#.북마크
            textfileRepository.save(textfile);
            return "success";
        }
        return "null";
    }


    @ResponseBody
    @PostMapping
    @RequestMapping("/find_Detail")
    public String Find_Detail_Information(HttpServletRequest request)
    {

        //#.북마크
        String tr_uid = request.getParameter("tr_uid"); //#.현재 이 값은 cid의 값임. 즉 순서가 있다는 말임 Textfile에  따라서
        String search_Content = request.getParameter("searchText");
        String where = request.getParameter("where");


        if(where.equals("pass_fail")){
            Optional<Textfile> cid_textfile= textfileRepository.findByMember_Uid(Integer.parseInt(tr_uid));
            if(cid_textfile.isPresent()) {
                return cid_textfile.get().getMember().getName();
            }
        }
        else if(where.equals("bookmark")){
            logger.info("여기 과연 들어올까 bookmark");
            Optional<Textfile> cid_textfile= textfileRepository.findByMember_Uid(Integer.parseInt(tr_uid));
            if(cid_textfile.isPresent()) {
                return cid_textfile.get().getMember().getName();
            }
        }
        else if(where.equals("index") )
        {
            Optional<Textfile> cid_textfile= textfileRepository.findByCid(Integer.parseInt(tr_uid));
            if(cid_textfile.isPresent()) {
                return cid_textfile.get().getMember().getName();
            }
        }
        else if(where.equals("quickview")){
            return tr_uid;
        }









        return "null";

    }



    @ResponseBody
    @PostMapping
    @RequestMapping("/find_DataForTextfile")
    public String DataSending(HttpServletRequest request)
    {
        //#.북마크
        int limit_letter=150;
        String tr_cid = request.getParameter("tr_cid");
        Optional<Textfile> optionalTextfile = textfileRepository.findByCid(Integer.parseInt(tr_cid));     //.findByPid(Long.parseLong(post_Pid));
        if(optionalTextfile.isPresent()){

            Textfile textfile= optionalTextfile.get();
            String returnTextfileMember= textfile.getMember().getName() + "_"+ textfile.getTextbox1().substring(0,limit_letter) + "_"
                    + textfile.getTextbox2().substring(0,limit_letter) + "_" + textfile.getTextbox3().substring(0,limit_letter) +"_" + tr_cid;
            return returnTextfileMember;
            //#.이름이랑 textbox만 보내는데 q1,q2,q3도 저장해야하네.. 흠..

        }
        return "null";
    }


    @ResponseBody
    @PostMapping
    @RequestMapping("/find_Delete")
    public String Find_Delete_Click(HttpServletRequest request)
    {
        //#.즐겨찾기 지우기는 0
        if(Function_By_Detail_Bookmark_Index(request,0)==1){
            return "success";
        }
        return "null";
    }


    @ResponseBody
    @PostMapping
    @RequestMapping("/find_congratulation")
    public String Allow_My_Company(HttpServletRequest request)
    {
        //#.합격


        if(Function_By_Detail_Bookmark_Index(request,2)==1){
            return "success";
        }
        return "null";
    }

    @ResponseBody
    @PostMapping
    @RequestMapping("/find_getout")
    public String Reject_My_Company(HttpServletRequest request)
    {

//#.불합격은 3


        if(Function_By_Detail_Bookmark_Index(request,3)==1){
            return "success";
        }
        return "null";
    }


    public void DashBoardScoreSaveFunction(){

        double all_Toeic_Score=0;
        double all_Student_Score=0;
        double all_Prize_Score=0;
        double all_Certificate_Score=0;
        double all_Oversea_Score=0;
        double all_Intern_Score=0;


        Date date = new Date();
        SimpleDateFormat today_Date_Format=new SimpleDateFormat("yyyy.MM.dd");




        //#.오늘 member와 textfile 등록된 갯수들
        for(int i=0;i<textfileList.size();i++){
            if(textfileList.get(i).getDate().equals(today_Date_Format.format(date))){
                today_register_textfile_size+=1;
            }
        }
        for(int i=0;i<memberList.size();i++)
        {
            if(memberList.get(i).getDate()!=null &&memberList.get(i).getDate().equals(today_Date_Format.format(date))){
                today_register_member_size+=1;
            }
        }
        ///////////////////////////////////////////


        //#.성적 계산
        for(int i=0;i<memberList.size();i++){
            all_Toeic_Score+=memberList.get(i).getToeicscore();
            all_Student_Score+=memberList.get(i).getStudentscore();
            all_Prize_Score+=memberList.get(i).getCompetition();
            all_Oversea_Score+=memberList.get(i).getOverseanumber();
            all_Intern_Score+=memberList.get(i).getInternnumber();
            all_Certificate_Score+=memberList.get(i).getCertificatenumber();
        }
        //#.이제 평균으로 나누면 됨

        Dashboard dashboard;
        Optional<Dashboard> optionalDashboard=dashboardRepository.findByDid(1);
        if(optionalDashboard.isPresent()){
            dashboard= optionalDashboard.get();
            dashboard.setAllmembercount(memberList.size());
            dashboard.setTodaymembercount(today_register_member_size);
            dashboard.setAveragecertificatescore(Double.parseDouble(String.format("%.2f",all_Certificate_Score/memberList.size())));
            dashboard.setAverageinternscore(Double.parseDouble(String.format("%.2f",all_Intern_Score/memberList.size())));
            dashboard.setAverageoverseascore(Double.parseDouble(String.format("%.2f",all_Oversea_Score/memberList.size())));
            dashboard.setAverageprizescore(Double.parseDouble(String.format("%.2f",all_Prize_Score/memberList.size())));
            dashboard.setAveragestudentscore(Double.parseDouble(String.format("%.2f",all_Student_Score/memberList.size())));
            dashboard.setAveragetoeicscore(Double.parseDouble(String.format("%.2f",all_Toeic_Score/memberList.size())));

            dashboardRepository.save(dashboard);

        }




    }





    public String InformGo(HttpServletRequest request,Model model,String name){

        Optional<Createproblemsubmit> optionalCreateproblemsubmit = createproblemrepository.findByCreateproblemproblemname(name);
        logger.info("여기가 InforoGo시작");
        if(optionalCreateproblemsubmit.isPresent()){

            logger.info("여기가 InforoGo_Ispresent");
            model.addAttribute("Inform_Number",optionalCreateproblemsubmit.get().getCreateproblem_problem_number());
            model.addAttribute("Inform_Name",optionalCreateproblemsubmit.get().getCreateproblemproblemname());
            model.addAttribute("Inform_InputSameple",optionalCreateproblemsubmit.get().getCreateproblem_problem_input_sample());
            model.addAttribute("Inform_InputExplanation",optionalCreateproblemsubmit.get().getCreateproblem_problem_input_explanation());
            model.addAttribute("Inform_OutputSample",optionalCreateproblemsubmit.get().getCreateproblem_problem_output_sample());
            model.addAttribute("Inform_OutputExplanation",optionalCreateproblemsubmit.get().getCreateproblem_problem_output_explanation());
            model.addAttribute("Inform_Memorylimit",optionalCreateproblemsubmit.get().getCreateproblem_problem_memorylimit());
            model.addAttribute("Inform_Timelimit",optionalCreateproblemsubmit.get().getCreateproblem_problem_timelimit());
            model.addAttribute("Inform_Difficulty",optionalCreateproblemsubmit.get().getCreateproblem_problem_difficulty());
            model.addAttribute("Inform_Explanation",optionalCreateproblemsubmit.get().getCreateproblem_problem_explanation());

            logger.info("등록완료!!모델 맵핑에 등록완료");


            return "success";
        }

        System.out.println("여기는 오냐?");

        return "null";
    }

    public String InformationFinding(HttpServletRequest request,Model model,String name)
    {

        name = request.getParameter("data_a");
        int textfile_First_SearchContent_Count =0;

        int textfile_Second_SearchContent_Count =0;
        int textfile_Third_SearchContent_Count =0;
        String[] textfile_First_Split;
        String[] textfile_Second_Split;
        String[] textfile_Third_Split;
        String return_String="";
        int textfile_All_Length=0;
        Double textbox1_percent;
        Double textbox2_percent;
        Double textbox3_percent;



        //#.북마크
        String tr_cid = request.getParameter("tr_uid"); //#.현재 이 값은 cid의 값임. 즉 순서가 있다는 말임 Textfile에  따라서
        String search_Content = request.getParameter("searchText");
        String detail_Request = request.getParameter("detail");



        logger.info("들으가기전");

        Optional<Member> optionalMember = memberRepository.findByName(name);
        if(optionalMember.isPresent()){
            textfile_First_Split= optionalMember.get().getTextfiles().get(0).getTextbox1().split(" ");
            textfile_Second_Split= optionalMember.get().getTextfiles().get(0).getTextbox2().split(" ");
            textfile_Third_Split= optionalMember.get().getTextfiles().get(0).getTextbox3().split(" ");


            textfile_All_Length = textfile_First_Split.length + textfile_Second_Split.length + textfile_Third_Split.length; //#.Textfile 의 모든 길이를 더해서 이를 Textfile_All_Length 에 넣는다.
            textfile_All_Length += 6; //#.각 텍스트 파일의 끝자리를 계산을 안했으므로 각각 2씩 두어 3개니까 6으로 한다.

            textfile_First_SearchContent_Count = StringUtils.countOccurrencesOf(optionalMember.get().getTextfiles().get(0).getTextbox1(),search_Content);
            textfile_Second_SearchContent_Count = StringUtils.countOccurrencesOf(optionalMember.get().getTextfiles().get(0).getTextbox2(), search_Content);
            textfile_Third_SearchContent_Count = StringUtils.countOccurrencesOf(optionalMember.get().getTextfiles().get(0).getTextbox3(), search_Content);
            textbox1_percent = (double)textfile_First_SearchContent_Count / (double)(textfile_First_Split.length + 2);
            textbox2_percent = (double)textfile_Second_SearchContent_Count / (double)(textfile_Second_Split.length + 2);
            textbox3_percent =(double)textfile_Third_SearchContent_Count /(double)(textfile_Third_Split.length + 2);


            model.addAttribute("Inform_Name",optionalMember.get().getName());
            model.addAttribute("Inform_Img",optionalMember.get().getImg().toString());
            model.addAttribute("Inform_Uid",optionalMember.get().getUid());
            model.addAttribute("Inform_Email",optionalMember.get().getEmail());
            model.addAttribute("Inform_StudentScore",optionalMember.get().getStudentscore());
            model.addAttribute("Inform_ToeicScore",optionalMember.get().getToeicscore());
            model.addAttribute("Inform_CertificateNumber",optionalMember.get().getCertificatenumber());
            model.addAttribute("Inform_OverseaNumber",optionalMember.get().getOverseanumber());
            model.addAttribute("Inform_InternNumber",optionalMember.get().getInternnumber());
            model.addAttribute("Inform_CompetitionNumber",optionalMember.get().getCompetition());



            model.addAttribute("Inform_Width1",Integer.parseInt(String.format("%.0f",(optionalMember.get().getStudentscore()/4.5)*100)));
            model.addAttribute("Inform_Width2",Integer.parseInt(String.format("%.0f",(((double)optionalMember.get().getOverseanumber()/5)*100))));
            model.addAttribute("Inform_Width3",Integer.parseInt(String.format("%.0f",((double)optionalMember.get().getCompetition()/5)*100)));
            model.addAttribute("Inform_Width4",Integer.parseInt(String.format("%.0f",((double)optionalMember.get().getCertificatenumber()/5)*100)));
            model.addAttribute("Inform_Width5",Integer.parseInt(String.format("%.0f",((double)optionalMember.get().getToeicscore()/990)*100)));
            model.addAttribute("Inform_Width6",Integer.parseInt(String.format("%.0f",((double)optionalMember.get().getInternnumber()/5)*100)));



            String[] temp1=optionalMember.get().getTextfiles().get(0).getTextbox1().split("\n");
            String[] temp2=optionalMember.get().getTextfiles().get(0).getTextbox2().split("\n");
            String[] temp3 = optionalMember.get().getTextfiles().get(0).getTextbox3().split("\n");

            String textbox1_temp1_String="";
            String textbox2_temp2_String="";
            String textbox3_temp3_String="";
            for(int i=0;i<temp1.length;i++){
                textbox1_temp1_String+=temp1[i].trim();
            }
            for(int i=0;i<temp2.length;i++){
                textbox2_temp2_String+=temp2[i].trim();
            }
            for(int i=0;i<temp3.length;i++){
                textbox3_temp3_String+=temp3[i].trim();
            }
            model.addAttribute("Inform_Textbox1",textbox1_temp1_String);
            model.addAttribute("Inform_Textbox2",textbox2_temp2_String);
            model.addAttribute("Inform_Textbox3",textbox3_temp3_String);


            if(search_Content!=null){
                model.addAttribute("Inform_Textbox1Percent",String.format("%.0f",textbox1_percent*100));
                model.addAttribute("Inform_Textbox2Percent",String.format("%.0f",textbox2_percent*100));
                model.addAttribute("Inform_Textbox3Percent",String.format("%.0f",textbox3_percent*100));
                model.addAttribute("Inform_SearchContent",search_Content);
            }
            else{
                model.addAttribute("Inform_Textbox1Percent","0");
                model.addAttribute("Inform_Textbox2Percent","0");
                model.addAttribute("Inform_Textbox3Percent","0");
                model.addAttribute("Inform_SearchContent","null");
            }

            logger.info("등록완료!!모델 맵핑에 등록완료");


            return "success";
        }

        System.out.println("여기는 오냐?");

        return "null";

    }
    public int Function_By_Detail_Bookmark_Index(HttpServletRequest request,int value){
        String uid = request.getParameter("uid");
        String where = request.getParameter("where");
        String name= request.getParameter("name");

        //#.합격
        if(where.equals("index")){
            Optional<Textfile> optionalTextfile = textfileRepository.findByCid(Integer.parseInt(uid));
            if(optionalTextfile.isPresent()){
                Optional<Textfile> optxt = textfileRepository.findByMember_Uid(optionalTextfile.get().getMember().getUid());
                if(optxt.isPresent()){
                    optxt.get().setFiled(value);
                    textfileRepository.save(optxt.get());
                    return 1;
                }
            }

        }
        else if(where.equals("bookmark") || where.equals("detail")){
            Optional<Textfile> optionalTextfile = textfileRepository.findByMember_Uid(Integer.parseInt(uid));
            if(optionalTextfile.isPresent()){
                optionalTextfile.get().setFiled(value);
                textfileRepository.save(optionalTextfile.get());
                return 1;
            }
        }

        return 0;
    }
	
}



