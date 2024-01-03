// BbsService.java
package com.multi.werin.bbs;

import java.util.List;

public interface BbsService {

    List<BbsVO> getBbsList();

    BbsVO getBbsById(int bbsId);

    void createBbs(BbsVO bbsVO);

    void updateBbs(BbsVO bbsVO);

    void deleteBbs(int bbsId);
}