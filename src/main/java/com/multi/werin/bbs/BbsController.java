package com.multi.werin.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/bbs")
public class BbsController {

    @Autowired
    private BbsService bbsService;

    @GetMapping("/list")
    public List<BbsVO> getBbsList() {
        return bbsService.getBbsList();
    }

    @GetMapping("/{bbsId}")
    public BbsVO getBbsById(@PathVariable int bbsId) {
        return bbsService.getBbsById(bbsId);
    }

    @PostMapping("/create")
    public void createBbs(@RequestBody BbsVO bbsVO) {
        bbsService.createBbs(bbsVO);
    }

    @PutMapping("/update")
    public void updateBbs(@RequestBody BbsVO bbsVO) {
        bbsService.updateBbs(bbsVO);
    }

    @DeleteMapping("/delete/{bbsId}")
    public void deleteBbs(@PathVariable int bbsId) {
        bbsService.deleteBbs(bbsId);
    }
}
