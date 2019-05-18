package com.sunyuhan.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.sunyuhan.pojo.Game;

/**
*@author SunYuHan
*2019年3月16日下午9:33:12
*
*/
public interface GameService {
	
	public boolean gameInput(Game game) throws Exception;
	public List<Game> getGameList() throws Exception;
	public Game getGameById(Integer id) throws Exception;
	public PageInfo<Game> getGameByPage(Integer currectPage,Integer pageSize)throws Exception;
	public List<Game> getCheapGame()throws Exception;
	public List<Game> searchGame(String keyWords)throws Exception;
	public List<String> getTypeList()throws Exception;
	public List<Game> getListByType(String type)throws Exception;
}
