package com.multi.werin.landmark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller // 싱글톤 + 컨트롤러 등록
public class LandmarkInfoController {
	
	@Autowired
	LandmarkInfoService infoservice;
	
	@Autowired
	LandmarkPageService pageservice;
	
	@RequestMapping("landmark/LandmarkInsert1")
	public void insert (Model model) throws Exception {
		infoservice.api();
		System.out.println("-----");
	}
	
	@RequestMapping("landmark/jejulist")
	public void list(LandmarkPageVO pageVO, Model model){
		infoservice.list(pageVO, model);
	}
	
	@RequestMapping("landmark/jejulistpaging1")
	public void pagelist1(@RequestParam("cultureType") String cultureType, LandmarkPageVO pageVO, Model model){
		System.out.println(cultureType);
		infoservice.pagelist1(cultureType, pageVO, model);
	}
	
	@RequestMapping("landmark/jejulistpaging2")
	public void pagelist2(@RequestParam("page") String pageNumber, LandmarkPageVO pageVO, Model model) {
	    System.out.println("Page number ==> " + pageNumber);
	    infoservice.pagelist2(pageNumber, model);
	}
	
	
	@RequestMapping("landmark/Landmarkdelete1")
	public void delete1 (Model model) throws Exception {
		infoservice.delete1();
	}
	
	@RequestMapping("landmark/LandmarkInsert2")
	public void insert2 (Model model) throws Exception {
		pageservice.api2();
		System.out.println("-----");
	}
	
	@RequestMapping("landmark/jejupagelist")
	public void list2(String ko, Model model){
		pageservice.list2(ko, model);
	}
	
	@GetMapping ("/jejupage")
    public String showJejuPage(@RequestParam(name = "landmarkName", required = false) String landmarkName, Model model) {
        // 여기서 필요한 작업 수행
        // 예를 들어, landmarkName을 이용하여 데이터를 가져와서 모델에 추가
		System.out.println(landmarkName);
		pageservice.page(landmarkName, model);
        model.addAttribute("landmarkName", landmarkName);

        // "jejupage" 뷰를 반환
        return "landmark/jejupage";
    }
	
	@RequestMapping("landmark/Landmarkdelete2")
	public void delete2 (Model model) throws Exception {
		pageservice.delete2();
	}
	
}
