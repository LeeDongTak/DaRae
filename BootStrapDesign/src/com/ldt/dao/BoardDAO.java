package com.ldt.dao;
import com.ldt.dto.Board;
public interface BoardDAO extends IDAO<Board,Long>{
	public long countRows(); 
}