package com.multi.werin.landmark;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class LandmarkInfoService {

	@Autowired
	LandmarkInfoDAO dao;

	@Autowired
	Landmarkdb1 db1;

	public void api() {
		// 파라메터 배열
		String[] list = { "A0201", "A0202", "A0203", "A0204", "A0205" };

		// Landmarkdb1 api = new Landmarkdb1();

		for (String s : list) {
			List<LandmarkApiVO> items = db1.getLandmarkItems(s);

			for (LandmarkApiVO item : items) {
				System.out.println(item);
				dao.insert(item);
			}
		}
	}

	public void list(LandmarkPageVO pageVO, Model model) {
		// db처리하기 전 전처리/후처리
		// db처리 요청
		List<LandmarkInfoVO> list = dao.list("1");
		System.out.println(list.size());

		// 전체 페이지수 구하기
		int count = dao.count2(); // 전체게시물 수
		System.out.println("전체 게시물수>> " + count);
		int pages = count / 10;
		if (count % 10 != 0) {
			pages = count / 10 + 1;
		}

		// 모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
		System.out.println("총 페이지수>> " + pages);

		// views/list.jsp까지 넘어가야 함.==>Model
		// model을 이용해서 검색결과인 list를 jejulist.jsp까지 넘기자
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}

	public void pagelist1(String culturetype, LandmarkPageVO pageVO, Model model) {
		// db처리하기 전 전처리/후처리
		int culturecode1 = 0;
		int culturecode2 = 0;
		if (culturetype.equals("history")) {
			culturecode1 = 1;
			culturecode2 = 55;
		} else if (culturetype.equals("resort")) {
			culturecode1 = 56;
			culturecode2 = 122;
		} else if (culturetype.equals("experience")) {
			culturecode1 = 123;
			culturecode2 = 205;
		} else if (culturetype.equals("industry")) {
			culturecode1 = 206;
			culturecode2 = 223;
		} else if (culturetype.equals("architecture")) {
			culturecode1 = 224;
			culturecode2 = 238;
		}
		
		LandmarkPageVO landmarkpageVO = new LandmarkPageVO();
		landmarkpageVO.setStart(culturecode1);
		landmarkpageVO.setEnd(culturecode2);
		System.out.println(landmarkpageVO);
		
		
		// db처리 요청
		List<LandmarkInfoVO> list = dao.pagelist1(landmarkpageVO);
		System.out.println(list.size());

		// 전체 페이지수 구하기
		int count = dao.count1(landmarkpageVO); // 전체게시물 수
		System.out.println("전체 게시물수>> " + count);
		int pages = count / 10;
		if (count % 10 != 0) {
			pages = count / 10 + 1;
		}

		// 모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
		System.out.println("총 페이지수>> " + pages);

		// views/list.jsp까지 넘어가야 함.==>Model
		// model을 이용해서 검색결과인 list를 jejulist.jsp까지 넘기자
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}

	public void pagelist2(String pagelist, Model model) {
		// db처리하기 전 전처리/후처리
		LandmarkPageVO pageVO = new LandmarkPageVO();
		pageVO.setPage(Integer.parseInt(pagelist));
		pageVO.setStartEnd();
		// db처리 요청
		List<LandmarkInfoVO> list = dao.pagelist2(pageVO);
		System.out.println(list.size());

		// 전체 페이지수 구하기
		int count = dao.count2(); // 전체게시물 수
		System.out.println("전체 게시물수>> " + count);
		int pages = count / 10;
		if (count % 10 != 0) {
			pages = count / 10 + 1;
		}

		// 모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
		System.out.println("페이지당 가지고 온 게시물수>> " + pages);

		// views/list.jsp까지 넘어가야 함.==>Model
		// model을 이용해서 검색결과인 list를 jejulist.jsp까지 넘기자
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}

	public void delete1() {
		dao.delete1();
	}

}
