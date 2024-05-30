package com.morning.ctrl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.morning.biz.InventoryBiz;
import com.morning.biz.ProductBiz;
import com.morning.domain.CategoryVO;
import com.morning.domain.Inventory;
import com.morning.domain.Product;
import com.morning.domain.ProductVO;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductBiz productService;
		
	String uploadLoc = "/resources/upload/";
	
	@RequestMapping("listAll.do")
	public String getProductList(Model model) {
		model.addAttribute("list", productService.getProductList());
		return "product/list";
	}
	
	@RequestMapping("list.do")
	public String getProductCateList(@RequestParam("cate") String cate, Model model) {
		model.addAttribute("list", productService.getProductCateList(cate));
		return "product/list";
	}
	
	@RequestMapping("detail.do")
	public String getBoard(@RequestParam("pno") int pno, Model model) {
		model.addAttribute("product", productService.getProduct(pno));
		return "product/get";
	}



}
