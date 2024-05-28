package com.morning.biz;

import java.util.List;

import com.morning.domain.Free;

public interface FreeBiz {
	public int getTotalCount();
	public List<Free> getFreeList();
	public Free getFree(int no);
	public Free getNoCountFree(int no);
	public void insFree(Free free);
	public void upFree(Free free);
	public void hitCount(int no);
	public void delFree(int no);
}
