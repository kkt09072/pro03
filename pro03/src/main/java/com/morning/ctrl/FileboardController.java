package com.morning.ctrl;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.morning.biz.FileboardService;
import com.morning.domain.Fileboard;
import com.morning.util.PagingBean;

@Controller
@RequestMapping("/fileboard/")
public class FileboardController {

	private static final Logger log = LoggerFactory.getLogger(FileboardController.class);
	
	@Autowired
	private FileboardService fileboardService;
	
	@Autowired
	private ServletContext servletContext;

	@Autowired
	private HttpSession session;
	
	@RequestMapping("list.do")
	public String getBoardList(@RequestParam("pageNo") String pageNo, Model model) {
		int cnt = fileboardService.getTotalCount();
		PagingBean pagingBean = new PagingBean(cnt);
		
		int totalPage = pagingBean.getTotalPage();
		
		float pageCnt = cnt / 5.0f;
		
		model.addAttribute("totalPage", totalPage);
		List<Fileboard> fileboardList = fileboardService.getPostList(pageNo);
		model.addAttribute("list", fileboardList);
		model.addAttribute("pageNo", pageNo);
		
		for(Fileboard file : fileboardList) {
			log.info(file.toString());
		}
		
		return "fileboard/list";
	}
	
	@RequestMapping("detail.do")
	public String getBoard(@RequestParam("no") int no, @RequestParam("pageNo") String pageNo, HttpServletRequest req, HttpServletResponse res, Model model) {
		
		String id = (String) session.getAttribute("sid");
		
		Cookie viewCookie = null;
		Cookie[] cookies = req.getCookies();
		
		if(cookies !=null) {
			for (int i = 0; i < cookies.length; i++) {
				if(cookies[i].getName().equals("|"+id+"fileboard"+no+"|")) {
					log.info("쿠키 이름 : "+cookies[i].getName());
					viewCookie=cookies[i];
				}	
			}
		} else {
			log.info("아직 방문한 적이 없습니다.");
		}
		
		if(viewCookie==null) {
            try {
            	//쿠키 생성
				Cookie newCookie=new Cookie("|"+id+"fileboard"+no+"|","readCount");
				res.addCookie(newCookie);
                //쿠키가 없으니 증가 로직 진행
				model.addAttribute("board", fileboardService.getPostDetailHasHits(no));	
			} catch (Exception e) {
				log.info("쿠키 확인 불가 : "+e.getMessage());
				e.getStackTrace();
			}
        //만들어진 쿠키가 있으면 증가로직 진행하지 않음
		} else {
			model.addAttribute("board", fileboardService.getPostDetailNoHits(no));
			log.info("viewCookie 확인 로직 : 쿠키 있음");
			String value=viewCookie.getValue();
			log.info("viewCookie 확인 로직 : 쿠키 value : "+value);
		}
		
		model.addAttribute("pageNo", pageNo);
		
		return "fileboard/get";
	}


}
