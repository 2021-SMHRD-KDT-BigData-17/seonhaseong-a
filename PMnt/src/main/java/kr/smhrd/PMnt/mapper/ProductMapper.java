package kr.smhrd.PMnt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.smhrd.PMnt.entity.ProProduct;


@Mapper
public interface ProductMapper {

	public List<ProProduct> productlist();
	
}
