package kr.smhrd.PMnt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.PMnt.entity.ProFruits;
import kr.smhrd.PMnt.entity.ProProduct;
import kr.smhrd.PMnt.entity.ProSynthesis;


@Mapper
public interface ProductMapper {

	// 재고관리 리스트 mapper
	public List<ProProduct> productList();
	
	// 재고현황 추가 mapper
	public void productInsert(ProProduct product);
	
	public void productDelete(ProProduct product);
	
	// 재품명 검색 mapper
	public List<ProProduct> productSearch(ProProduct product);
	
	// 입고일 검색 mapper
	public List<ProProduct> productSearch2(ProProduct product);
	
	// 출고일 검색 mapper
	public List<ProProduct> productSearch3(ProProduct product);
	
	// 재고 수정
	public void productUpdate(ProProduct product);
	
	// 제철과일 정보 mapper
	public List<ProFruits>fruitsList();

	public List<ProSynthesis> fruitsData();

	public List<ProSynthesis> tempData();
	
}
