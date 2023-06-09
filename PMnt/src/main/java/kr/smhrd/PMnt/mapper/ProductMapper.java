package kr.smhrd.PMnt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.PMnt.entity.ProProduct;


@Mapper
public interface ProductMapper {

	// 재고관리 리스트 mapper
	public List<ProProduct> productList();
	
	public void productInsert(ProProduct product);
	
}
