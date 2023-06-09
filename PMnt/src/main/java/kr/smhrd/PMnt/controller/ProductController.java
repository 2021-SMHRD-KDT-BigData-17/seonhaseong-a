package kr.smhrd.PMnt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.PMnt.entity.ProProduct;
import kr.smhrd.PMnt.mapper.ProductMapper;

// json 데이터 통신을 위한 컨트롤러
// @RestController
@Controller
public class ProductController {
	
	// ProductMapper 의존성
	@Autowired
	private ProductMapper mapper;
	
	// 재고관리 리스트 
//	@GetMapping("/product.do")
//	public List<ProProduct> product(){
//		
//		List<ProProduct> list = mapper.productlist();
//		
//		return list;
//	}

	// 재고관리 == main.do에 옮겨 주기
//	@RequestMapping("/product.do")
//	public String productList(Model model) {
//		System.out.println("확인용");
//		List<ProProduct> list = mapper.productList();
//		model.addAttribute("list", list);
//		return "main";
//	}
	
	@PostMapping("/productInsert.do")
	public String productInsert(ProProduct product) {
		System.out.println("컨트롤러 동작 확인");
		mapper.productInsert(product);
		return "redirect:/main.do";
	}
	
//	재고관리 삭제 controller
	@PostMapping("/productDelete.do")
	public String productDelete(ProProduct product) {
		// 찰떡같이 요청에 idx를 받아들여야 하는데....
		// @PathVariable 이용해서 연결!!!
		mapper.productDelete(product);
		System.out.println(product.getPseq());
		System.out.println("삭제");
		return "redirect:/main.do";
	}

	
}
