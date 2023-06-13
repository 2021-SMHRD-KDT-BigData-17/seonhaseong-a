package kr.smhrd.PMnt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.PMnt.entity.ProProduct;


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
	
	public void productUpdate(ProProduct product);
	
}
