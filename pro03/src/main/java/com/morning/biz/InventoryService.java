package com.morning.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.domain.CategoryVO;
import com.morning.domain.Inventory;
import com.morning.per.InventoryMapper;

@Service
public class InventoryService implements InventoryBiz {

	@Autowired
	private InventoryMapper inventoryDAO;
	
	@Override
	public int getTotalCount() {
		return inventoryDAO.getTotalCount();
	}

	@Override
	public List<Inventory> getInventoryList() {
		return inventoryDAO.getInventoryList();
	}

	@Override
	public List<CategoryVO> categoryLoading(String cate) {
		return inventoryDAO.categoryLoading(cate);
	}

	@Override
	public Inventory getInventory(int pno) {
		return inventoryDAO.getInventory(pno);
	}

	@Override
	public void insInventory(Inventory inventory) {
		inventoryDAO.insInventory(inventory);		
	}

	@Override
	public void upInventory(Inventory inventory) {
		inventoryDAO.upInventory(inventory);		
	}

	@Override
	public void delInventory(int ino) {
		inventoryDAO.delInventory(ino);		
	}
	
}
