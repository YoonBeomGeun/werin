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
	
	@RequestMapping()
	public void recommendlandmark(MainVO mainVO, Model model) {
		List<MainVO> recommendlandmark = maindao.recommendlandmark(mainVO);
		model.addAttribute("recommendlandmark", recommendlandmark);
	}
	
	@RequestMapping()
	public void mainsearch(MainVO mainVO, Model model) {
		List<MainVO> mainsearch = maindao.mainsearch(mainVO);
		model.addAttribute("mainsearch", mainsearch);
	}
	
	@RequestMapping()
	public void hottravel(MainVO mainVO, Model model) {
		List<MainVO> hottravel = maindao.hottravel(mainVO);
		model.addAttribute("hottravel", hottravel);
	}
	
	@RequestMapping()
	public void hotshop(MainVO mainVO, Model model) {
		List<MainVO> hotshop = maindao.hotshop(mainVO);
		model.addAttribute("hotshop", hotshop);
	}
	
	@RequestMapping()
	public void hotboard(MainVO mainVO, Model model) {
		List<MainVO> hotboard = maindao.hotboard(mainVO);
		model.addAttribute("hotboard", hotboard);
	}
}
