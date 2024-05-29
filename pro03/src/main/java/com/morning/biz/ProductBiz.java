package com.morning.biz;

import java.util.List;

import com.morning.domain.Product;

public interface ProductBiz {
	int getTotalCount();
	List<Product> getProductList();
	List<Product> getProductCateList(String cate);
	Product getProduct(int pno);
	void insProduct(Product product);
	void upProduct(Product product);
	void delProduct(int pno);
}
