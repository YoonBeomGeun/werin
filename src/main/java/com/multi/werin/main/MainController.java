package com.multi.werin.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*return타입 뭔지 확인해봐야함*/
/*requestmapping  뭐 넣어야하는지 확인해봐야함*/

@Controller
public class MainController {

	@Autowired
	MainDAO maindao;

	@RequestMapping("main/recommendlandmark")
	public void recommendlandmark(MainlandmarkVO mainlandmarkVO, Model model) {
		List<MainlandmarkVO> recommendlandmark = maindao.recommendlandmark(mainlandmarkVO);
		model.addAttribute("recommendlandmark", recommendlandmark);
	}

	@RequestMapping("main/mainsearch") /* search 아얘 싹다 고쳐야함 */
	public void mainsearch(MainlandmarkVO mainVO, Model model) {
		List<MainlandmarkVO> mainsearch = maindao.mainsearch(mainVO);
		model.addAttribute("mainsearch", mainsearch);
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
