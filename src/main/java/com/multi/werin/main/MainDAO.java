/*
 * package com.multi.werin.main;
 * 
 * import java.util.List;
 * 
 * import org.mybatis.spring.SqlSessionTemplate; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Repository;
 * 
 * xml과 연결 완료. 단, xml(mapper)에서 sql문은 아직 각 함수마다 데이터베이스에서 가져올 정보들 보고 리턴타입 다시
 * 확인해봐야함
 * 
 * @Repository public class MainDAO {
 * 
 * @Autowired SqlSessionTemplate my;
 * 
 * public List<MainVO> recommendlandmark(MainVO mainVO) { return
 * my.selectList("main.hotlandmark", mainVO); }
 * 
 * public List<MainVO> mainsearch(MainVO mainVO) { return
 * my.selectList("main.mainsearch", mainVO); }
 * 
 * public List<MainVO> hottravel(MainVO mainVO) { return
 * my.selectList("main.hottravel", mainVO); }
 * 
 * public List<MainVO> hotshop(MainVO mainVO) { return
 * my.selectList("main.hotshop", mainVO); }
 * 
 * public List<MainVO> hotboard(MainVO mainVO) { return
 * my.selectList("main.hotboard", mainVO); } }
 */