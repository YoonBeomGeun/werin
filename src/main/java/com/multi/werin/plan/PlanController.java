package com.multi.werin.plan;

import java.sql.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.werin.member.MemberDAO;
import com.multi.werin.member.MemberVO;

@Controller
public class PlanController {
	@Autowired
	PlanDAO dao;
	
	@Autowired
    ScheduleDAO scheduleDao;

	@RequestMapping(value = "plan/addPlan", method = RequestMethod.POST)
	@ResponseBody
	public String addPlan(PlanVO vo, String jsonEle, HttpSession session, Model model) {

		System.out.println("jsonEle : " + jsonEle);
		// 로그인한 사용자의 아이디를 세션에서 가져옴
		String writer = (String) session.getAttribute("loginId");

		// 작성자 및 계획과 함께 저장할 스케줄 번호를 설정
		vo.setPlan_writer(writer);

		// 여행 날짜 정보를 추출하여 vo에 설정
		Date startDate = vo.getPlan_start_date();
		Date endDate = vo.getPlan_end_date();

		int result = dao.insert(vo);
		System.out.println("Plan_no : " + vo.getPlan_no());

		// request로 문자열형식의 데이터를 받고
		// json객체 안에 json 배열
		// {"1":[{"placeName":"1-1","latitude":"2-1","longitude":"3-1","contextPath":"4-1","phone":"5-1"}],"2":[{"placeName":"1-2","latitude":"2-2","longitude":"3-2","contextPath":"4-2","phone":"5-2"}],"3":[{"placeName":"1-3","latitude":"2-3","longitude":"3-3","contextPath":"4-3","phone":"5-3"}]}
		System.out.println(jsonEle);

		// String -> Object -> JSONObject
		Object obj = null;
		JSONObject jsonObj = null;
		JSONParser parser = new JSONParser();

		// 문자열 형식의 데이터를 JSONArray로 가공
		try {
			obj = parser.parse(jsonEle);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // String -> Object
		jsonObj = (JSONObject) obj; // Object -> JSONObject

		Iterator iter = jsonObj.keySet().iterator(); // JSONObject key 추출

		while (iter.hasNext()) {
			String key = (String) iter.next();

			JSONArray jsonArray = (JSONArray) jsonObj.get(key); // jsonArry
			// jsonObj.get(1)
			// [{"placeName":"1-1","latitude":"2-1","longitude":"3-1","contextPath":"4-1","phone":"5-1"}]

			for (int i = 0; i < jsonArray.size(); i++) { // jsonArray.size() : 1
				JSONObject listKey = (JSONObject) jsonArray.get(i);

				String placeName = String.valueOf(listKey.get("placeName"));
				String latitude = String.valueOf(listKey.get("latitude"));
				String longitude = String.valueOf(listKey.get("longitude"));
				String contextPath = String.valueOf(listKey.get("contextPath"));
				String phone = String.valueOf(listKey.get("phone"));
				String day = String.valueOf(listKey.get("day"));
				System.out.println("travelPlans : " + placeName + "/" + latitude + "/" + contextPath + "/" + phone + "/" + day);
				
				ScheduleVO scheduleVO = new ScheduleVO(); 
			    scheduleVO.setSchedule_map_lat(latitude);
			    scheduleVO.setSchedule_map_lon(longitude); 
			    scheduleVO.setSchedule_title(placeName);
			    scheduleVO.setSchedule_day(day);
			    scheduleVO.setSchedule_plan_no(vo.getPlan_no());
			    
			    int scheduleResult = scheduleDao.insert(scheduleVO);

				
			}
		}
		if (result == 1) {
			return "redirect:/plan/planlist";
		} else {
			return "redirect:/member/insert";
		}
	}
	
	@RequestMapping("plan/planlist")
	public String select(HttpSession session, Model model) {
	    List<PlanVO> result = dao.select((String) session.getAttribute("loginId"));
	    model.addAttribute("planList", result); // 수정된 부분
	    System.out.print(result.size());
	    if (result.size() > 0) {
	        return "plan/planlist";
	    } else {
	        return "plan/planlist";
	    }
	}
	
	@RequestMapping("plan/planalllist")
	public String select(PlanVO vo, Model model) {
		List<PlanVO> result = dao.select2(vo);
		System.out.print(result.size());
		model.addAttribute("planlist", result);
		if (result.size() > 0) {
            return "plan/planalllist";
        } else {
            return "plan/planalllist";
        }
	}
	
	/*
	 * @RequestMapping("plan/plan_detail") public String select1(HttpSession
	 * session, Model model) { List<PlanVO> result =
	 * dao.selectWithSchedules((String) session.getAttribute("loginId"));
	 * model.addAttribute("planlist", result); System.out.print(result.size()); if
	 * (result.size() > 0) { return "plan/plan_detail"; } else { return
	 * "plan/plan_detail"; } }
	 */

}
