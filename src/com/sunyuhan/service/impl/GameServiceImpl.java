package com.sunyuhan.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sunyuhan.dao.GameMapper;
import com.sunyuhan.pojo.Game;
import com.sunyuhan.pojo.GameExample;
import com.sunyuhan.service.GameService;

/**
*@author SunYuHan
*2019年3月16日下午9:34:19
*
*/
@Service
public class GameServiceImpl implements GameService{
	@Autowired
	private GameMapper gameMapper;

	@Override
	/*添加游戏*/
	public boolean gameInput(Game game) throws Exception {
		try {
			game.setCreatetime(new Date());
			gameMapper.insert(game);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	@Override
	/*逆序查询所有游戏*/
	public List<Game> getGameList() throws Exception {
		GameExample example = new GameExample();
		example.setOrderByClause("id desc");
		List<Game> games = gameMapper.selectByExample(example);
		return games;
	}
	/*根据Id查询游戏*/
	@Override
	public Game getGameById(Integer id) throws Exception {
		Game game = gameMapper.selectByPrimaryKey(id);
		return game;
	}
	/*分页查询游戏列表*/
	@Override
	public PageInfo<Game> getGameByPage(Integer currectPage,Integer pageSize) throws Exception {
		PageHelper.startPage(currectPage, pageSize);
		List<Game> games = gameMapper.selectByExample(null);
		PageInfo<Game> pageInfo = new PageInfo<>(games);
		return pageInfo;
	}
	/*获得低价游戏列表*/
	@Override
	public List<Game> getCheapGame() throws Exception {
		GameExample example = new GameExample();
		example.setOrderByClause("price");
		List<Game> games = gameMapper.selectByExample(example);
		return games;
	}
	/*搜索游戏*/
	@Override
	public List<Game> searchGame(String keyWords) throws Exception {
		GameExample example = new GameExample();
		example.createCriteria().andGamenameLike("%"+keyWords+"%");
		List<Game> games = gameMapper.selectByExample(example);
		return games;
	}
	/*获取游戏分类列表*/
	@Override
	public List<String> getTypeList() throws Exception {
		List<Game> games = gameMapper.selectByExample(null);
		List<String> types = new ArrayList<String>();
		boolean flag = true;
		String result = "";
		//重复类型判断
		for (Game game : games) {
			result = game.getType();
			A:for (String type : types) {
				if(type.equals(result)) {
					flag = false;
					break A;
				}
			}
			if (flag) {
				types.add(result);
			}
			flag = true;
		}
		return types;
	}
	/*根据类型获得游戏列表*/
	@Override
	public List<Game> getListByType(String type) throws Exception {
		GameExample example = new GameExample();
		example.createCriteria().andTypeEqualTo(type);
		List<Game> games = gameMapper.selectByExample(example);
		return games;
	}

	

}
