ackage com.multi.werin.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BbsServiceImpl implements BbsService {

    @Autowired
    private BbsMapper bbsMapper;

    @Override
    public List<BbsVO> getBbsList() {
        return bbsMapper.getBbsList();
    }

    @Override
    public BbsVO getBbsById(int bbsId) {
        return bbsMapper.getBbsById(bbsId);
    }

    @Override
    public void createBbs(BbsVO bbsVO) {
        bbsMapper.createBbs(bbsVO);
    }

    @Override
    public void updateBbs(BbsVO bbsVO) {
        bbsMapper.updateBbs(bbsVO);
    }

    @Override
    public void deleteBbs(int bbsId) {
        bbsMapper.deleteBbs(bbsId);
    }
}