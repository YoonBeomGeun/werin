// BbsDAO.java
package com.multi.werin.bbs;

import org.springframework.data.jpa.repository.JpaRepository;

public interface BbsDAO extends JpaRepository<BbsVO, Integer> {
    // Spring Data JPA가 JpaRepository를 상속하면 자동으로 CRUD 메서드를 제공합니다.
    // 따라서 추가적인 메서드 선언이 필요 없습니다.
}