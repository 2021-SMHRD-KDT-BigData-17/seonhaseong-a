package kr.smhrd.PMnt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.PMnt.entity.ProFruits;
import kr.smhrd.PMnt.entity.ProProduct;
import kr.smhrd.PMnt.entity.ProSynthesis;
import kr.smhrd.PMnt.entity.ProUser;
import kr.smhrd.PMnt.mapper.ProductMapper;

// json 데이터 통신을 위한 컨트롤러
// @RestController
@Controller
public class ProductController {
	
	// ProductMapper 의존성
	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private HttpServletRequest request;
	
	// 재고관리 리스트 
//	@GetMapping("/product.do")
//	public List<ProProduct> product(){
//		
//		List<ProProduct> list = mapper.productlist();
//		
//		return list;
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
	
	// 재고관리 == main.do에 옮겨 주기
//	@RequestMapping("/product.do")
//	public String productList(Model model) {
//		System.out.println("확인용");
//		List<ProProduct> list = mapper.productList();
//		model.addAttribute("list", list);
//		return "main";
//	}
	
	// 재품명 검색
	@GetMapping("/productSearch.do")
	public String productSearch(@RequestParam("pname") String pname, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(pname);
		System.out.println(userbno);
		
        
		ProProduct product = new ProProduct();
		product.setPname(pname);
		product.setUserbno(userbno);
		List<ProProduct> search = mapper.productSearch(product);
		model.addAttribute("search", search);
		System.out.println(search);
		
		if (product != null) {
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
            System.out.println(product+"세션 저장 확인");
            }
		
		return "main2";
	}
	
	// 입고일 검색 form / button사용시 작동가능
	@GetMapping("/productSearch2.do")
	public String productSearch2(@RequestParam("preceivingdate") String preceivingdate, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(preceivingdate);
		System.out.println(userbno);
		ProProduct product = new ProProduct();
		product.setPreceivingdate(preceivingdate);
		product.setUserbno(userbno);
		List<ProProduct> search2 = mapper.productSearch2(product);
		model.addAttribute("search2", search2);
		System.out.println(search2);
		
		if (product != null) {
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
            System.out.println(product+"세션 저장 확인");
            }
		
		
		return "main3";
	}
	
	@GetMapping("/productSearch3.do")
	public String productSearch3(@RequestParam("pshippingdate") String pshippingdate, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(pshippingdate);
		System.out.println(userbno);
		ProProduct product = new ProProduct();
		product.setPshippingdate(pshippingdate);
		product.setUserbno(userbno);
		List<ProProduct> search3 = mapper.productSearch3(product);
		model.addAttribute("search3", search3);
		System.out.println(search3);
		
		if (product != null) {
            HttpSession session = request.getSession();
            session.setAttribute("product", product);
            System.out.println(product+"세션 저장 확인");
            }
		
		
		return "main4";
	}
	
//	 @RequestMapping("/main2.do")
//	    public String mainPage(Model model) {
//	    	List<ProProduct> list = mapper.productList();
//			model.addAttribute("list", list);
//	        return "main2";
//	    }
	
	
	@GetMapping("/productup.do")
	public String productup(Model model) {
		List<ProProduct> list = mapper.productList();
		model.addAttribute("list", list);
		return "main5";
	}
	
	@PostMapping("/productUpdate.do")
	public String product(ProProduct product) {
		mapper.productUpdate(product);
		System.out.println(product);
		return "redirect:/main.do";
	}
	
	@GetMapping("/productup2.do")
	public String productSearch6(@RequestParam("pname") String pname, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(pname);
		System.out.println(userbno);
		ProProduct product = new ProProduct();
		product.setPname(pname);
		product.setUserbno(userbno);
		List<ProProduct> search = mapper.productSearch(product);
		model.addAttribute("search", search);
		System.out.println(search);
		return "main6";
	}
	
	
	@GetMapping("/productup3.do")
	public String productSearch7(@RequestParam("preceivingdate") String preceivingdate, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(preceivingdate);
		System.out.println(userbno);
		ProProduct product = new ProProduct();
		product.setPreceivingdate(preceivingdate);
		product.setUserbno(userbno);
		List<ProProduct> search2 = mapper.productSearch2(product);
		model.addAttribute("search2", search2);
		System.out.println(search2);
		return "main7";
	}
	
	@GetMapping("/productup4.do")
	public String productSearch8(@RequestParam("pshippingdate") String pshippingdate, @RequestParam("userbno") String userbno,Model model) {
		System.out.println("확인용");
		System.out.println(pshippingdate);
		System.out.println(userbno);
		ProProduct product = new ProProduct();
		product.setPshippingdate(pshippingdate);
		product.setUserbno(userbno);
		List<ProProduct> search3 = mapper.productSearch3(product);
		model.addAttribute("search3", search3);
		System.out.println(search3);
		
		return "main8";
	}
	
	

	@GetMapping("/fruits.do")
	public @ResponseBody List<ProFruits> fruitsList() {
		System.out.println("성민 바보 확인용");
		List<ProFruits> fruits = mapper.fruitsList();
		System.out.println(fruits);
		return fruits;
	}
	
	@GetMapping("/fruitsData.do")
	public @ResponseBody List<ProSynthesis> fruitsData(){
		System.out.println("fruitscnt 확인용");
		List<ProSynthesis> fruitscnt = mapper.fruitsData();
		System.out.println(fruitscnt);
		return fruitscnt;
	}
	
	
}
