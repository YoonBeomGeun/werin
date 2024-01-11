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
		model.addAttribute("searchlandmark", searchlandmark);
		
		List<SearchBbsVO> searchbbs = maindao.searchbbs(searchbbsVO);
		model.addAttribute("searchbbs", searchbbs);
		
		List<SearchTripVO> searchtrip = maindao.searchtrip(searchtripVO);
		model.addAttribute("searchtrip", searchtrip); 
		//views/main/serarch.jsp
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

	/*
	 * @RequestMapping("main/hottravel") 다시 재호출하는방법 public String name() {
	 * return"redirect:main.jsp"; }
	 */

}
