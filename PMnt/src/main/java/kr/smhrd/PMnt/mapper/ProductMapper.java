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
	
	// 재고관리 검색 기능 mapper
	public List<ProProduct> productSearch(ProProduct product);
	
}
