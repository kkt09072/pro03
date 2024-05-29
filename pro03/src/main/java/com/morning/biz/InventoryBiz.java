package com.morning.biz;

import java.util.List;

import com.morning.domain.Inventory;

public interface InventoryBiz {
	int getTotalCount();
	List<Inventory> getInventoryList();
	Inventory getInventory(int ino);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}
