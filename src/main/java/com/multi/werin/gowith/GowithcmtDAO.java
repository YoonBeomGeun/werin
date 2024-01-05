package com.multi.werin.gowith;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GowithcmtDAO {

	@Autowired
	SqlSessionTemplate my;
	
}
