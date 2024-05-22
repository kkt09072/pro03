package com.morning.domain;

import java.util.List;

import com.morning.util.PagingBean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FreeListVO {
	private List<Free> list;
	private PagingBean pagingBean;
}
