package com.multi.werin.landmark;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class LandmarkPageService {

	@Autowired
	LandmarkInfoDAO infodao;
	
	@Autowired
	LandmarkPageDAO pagedao;
	
	@Autowired
	Landmarkdb2 db2;
	
	public void delete2() {
    	pagedao.delete2();
    }
	
	public void api2() {
    	//파라메터 배열
    	List<LandmarkInfoVO> contentidlist = infodao.list("1");
    	System.out.println(contentidlist);
    	 
        // 결과 출력
        System.out.println(contentidlist);
        
        List<Integer> apiidlist = new ArrayList<>();
        for (LandmarkInfoVO landmarkInfo : contentidlist) { // db에 저장된 정보에서 contentid만 가져오는 메서드
        	apiidlist.add(landmarkInfo.getLandmarkinfo_contentid());
        }
        
        System.out.println(apiidlist);
        
        int apiid = 0;
        for (int i = 0; i < 5; i++) { // 가져온 contentid를 이용한 반복문으로 overview 등을 불러와서 db에 집어넣는 메서드
        	apiid = apiidlist.get(i);
        	// System.out.println(apiid);
        	LandmarkApiVO2 item = db2.getLandmarkItems(apiidlist.get(i));
        	System.out.println(item);
        	pagedao.insert2(item);
        	
		}
    	
    }
	
	public void list2(String ko, Model model) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		List<LandmarkApiVO2> list2 = pagedao.list2(ko);
		System.out.println(list2.size());
		//views/list.jsp까지 넘어가야 함.==>Model 
		//model을 이용해서 검색결과인 list를 jejupage.jsp까지 넘기자
		model.addAttribute("list2", list2);
	}
	
	
	
}

