package com.multi.werin.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*Requestmapping에 똑같은게 있는 경우는 어떻게 되는지?*/

@Controller
public class MainController {

	@Autowired
	MainDAO maindao;

	@RequestMapping("main/recommendlandmark")
	public void recommendlandmark(MainlandmarkVO mainlandmarkVO, Model model) {
		List<MainlandmarkVO> recommendlandmark = maindao.recommendlandmark(mainlandmarkVO);
		model.addAttribute("recommendlandmark", recommendlandmark);
	}
	
	
	@RequestMapping("main/search")
	public void mainsearch(SearchLandmarkVO searchlandmarkVO, SearchBbsVO searchbbsVO, SearchTripVO searchtripVO, Model model) {
		List<SearchLandmarkVO> searchlandmark = maindao.searchlandmark(searchlandmarkVO);
		List<SearchBbsVO> searchbbs = maindao.searchbbs(searchbbsVO);
		List<SearchTripVO> searchtrip = maindao.searchtrip(searchtripVO);
		
		//위에 어떤 값들이 들어가는지 확인해볼 필요가 있음
		 int result = 0;
		 if(searchlandmark.isEmpty() && searchbbs.isEmpty() && searchtrip.isEmpty()) { // 아무런 검색 결과가 없는 경우
			 result = 1;
		 }
		 if(result==0) {
			 model.addAttribute("searchlandmark", searchlandmark);
			 model.addAttribute("searchbbs", searchbbs);
			 model.addAttribute("searchtrip", searchtrip);	
			 model.addAttribute("searching", searchtripVO.getSearching());
		 }
		 System.out.println(searchlandmark);
		 System.out.println(searchbbs);
		 System.out.println(searchtrip);
		 System.out.println(result);
		 System.out.println(searchtripVO.getSearching());
		 model.addAttribute("result", result);
		//views/main/serarch.jsp
	}
	
	/* search페이지에서 페이징 사용하기 위한 함수 */
	@RequestMapping("main/searchbbs")
	public void searchbbs(SearchBbsVO searchbbsVO, Model model) {
		List<SearchBbsVO> searchbbs = maindao.searchbbs(searchbbsVO);
		model.addAttribute("searchbbs", searchbbs);
		System.out.println(searchbbs);
	}
	
	@RequestMapping("main/hottravel")
	public void hottravel(MaintripVO maintripVO, Model model) {
		List<MaintripVO> hottravel = maindao.hottravel(maintripVO);
		model.addAttribute("hottravel", hottravel);
	}

	@RequestMapping("main/hotshop")
	public void hotshop(MainintroducestoreVO mainintroducestoreVO, Model model) {
		List<MainintroducestoreVO> hotshop = maindao.hotshop(mainintroducestoreVO);
		model.addAttribute("hotshop", hotshop);
	}

	@RequestMapping("main/hotboard")
	public void hotboard(MainbbsVO mainbbsVO, Model model) {
		List<MainbbsVO> hotboard = maindao.hotboard(mainbbsVO);
		model.addAttribute("hotboard", hotboard);
	}
	
	@RequestMapping("main/morelandmark")
	public void morelandmark(SearchVO searchVO, Model model) {
		searchVO.setStartEnd();
		System.out.println("searchVO : " + searchVO);
		List<SearchLandmarkVO> searchlandmark = maindao.morelandmark(searchVO);
		int count = maindao.landmark_count(searchVO);
		System.out.println("count : " + count); //1?
		int pages = count/10; // 1/10  pages = 0
		if(count%10!=0) { //1 % 10 --->1 
			pages=count/10+1; //pages = 0/10 + 1 = 1
		}		
		model.addAttribute("searchlandmark", searchlandmark);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("searching", searchVO.getSearching());
	}
	
	@RequestMapping("main/moretrip")
	public void moretrip(SearchVO searchVO, Model model) {
		searchVO.setStartEnd();
		System.out.println("searchVO : " + searchVO);
		List<SearchTripVO> searchtrip = maindao.moretrip(searchVO);
		System.out.println("searchtrip : " + searchtrip.size());
		int count = maindao.trip_count(searchVO);
		System.out.println("count: "+count);
		int pages = count/10;
		if(count%10!=0) {
			pages=count/10+1;
		}
		model.addAttribute("searchtrip", searchtrip);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);		
		model.addAttribute("searching", searchVO.getSearching());
	}

	/*
	 * @RequestMapping("main/hottravel") 다시 재호출하는방법 public String name() {
	 * return"redirect:main.jsp"; }
	 */

}
