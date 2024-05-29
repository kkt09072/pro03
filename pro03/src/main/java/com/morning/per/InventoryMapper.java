package com.morning.per;

import java.util.List;

import com.morning.domain.Inventory;

public interface InventoryMapper {
	int getTotalCount();
	List<Inventory> getInventoryList();
	Inventory getInventory(int ino);
	void insInventory(Inventory inventory);
	void upInventory(Inventory inventory);
	void delInventory(int ino);
}
