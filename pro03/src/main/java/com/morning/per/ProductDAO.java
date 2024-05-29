package com.morning.per;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.morning.domain.Product;

@Repository
public class ProductDAO implements ProductMapper {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("product.getTotalCount");
	}

	@Override
	public List<Product> getProductList() {
		return sqlSession.selectList("product.getProductList");
	}

	@Override
	public List<Product> getProductCateList(String cate) {
		return sqlSession.selectList("product.getProductCateList", cate);
	}

	@Override
	public Product getProduct(int pno) {
		return sqlSession.selectOne("product.getProduct", pno);
	}

	@Override
	public void insProduct(Product product) {
		sqlSession.insert("product.insProduct", product);
	}

	@Override
	public void upProduct(Product product) {
		sqlSession.update("product.upProduct", product);		
	}

	@Override
	public void delProduct(int pno) {
		sqlSession.delete("product.delProduct");		
	}

}
