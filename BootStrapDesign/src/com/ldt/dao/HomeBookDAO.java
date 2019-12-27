package com.ldt.dao;

import java.util.List;

import com.ldt.dto.HomeBook;
public interface HomeBookDAO extends IDAO<HomeBook, Long> {
	List<HomeBook> selectAllById(String id);
}