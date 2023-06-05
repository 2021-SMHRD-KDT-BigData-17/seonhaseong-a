package kr.smhrd.PMnt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.smhrd.PMnt.entity.ProProduct;
import kr.smhrd.PMnt.mapper.ProductMapper;

// json 데이터 통신을 위한 컨트롤러
@RestController
public class ProductController {
	
	// ProductMapper 의존성
	@Autowired
	private ProductMapper mapper;
	
	// 재고관리 리스트 
	@GetMapping("/product.do")
	public List<ProProduct> product(){
		
		List<ProProduct> list = mapper.productlist();
		
		return list;
	}
	
}
