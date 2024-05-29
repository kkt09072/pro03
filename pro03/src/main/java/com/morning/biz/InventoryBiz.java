package com.morning.biz;

import java.util.List;

import com.morning.domain.CategoryVO;
import com.morning.domain.Inventory;

public interface InventoryBiz {
	int getTotalCount();
	List<Inventory> getInventoryList();
	List<CategoryVO> categoryLoading(String cate);
	Inventory getInventory(int pno);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}
