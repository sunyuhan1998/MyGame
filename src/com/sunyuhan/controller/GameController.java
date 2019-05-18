package com.sunyuhan.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.sunyuhan.pojo.Game;
import com.sunyuhan.service.GameService;

/**
*@author SunYuHan
*2019��3��16������9:28:24
*��Ϸ���Controller
*/
@Controller
public class GameController {
	@Autowired
	private GameService gameService;
	
	/*����Ա�����Ϸ����*/
	@RequestMapping(value = "/game/gameInput.action")
	public String gameInput(Game game,@RequestParam MultipartFile[] files) throws Exception {
		String posterName = UUID.randomUUID().toString().replaceAll("-", "")+"."+FilenameUtils.getExtension(files[0].getOriginalFilename());
		String coverName = UUID.randomUUID().toString().replaceAll("-", "")+"."+FilenameUtils.getExtension(files[1].getOriginalFilename());
		String adspicName = UUID.randomUUID().toString().replaceAll("-", "")+"."+FilenameUtils.getExtension(files[2].getOriginalFilename());
		files[0].transferTo(new File("E:\\eclipse code\\cache\\"+posterName));
		files[1].transferTo(new File("E:\\eclipse code\\cache\\"+coverName));
		files[2].transferTo(new File("E:\\eclipse code\\cache\\"+adspicName));
		game.setPoster(posterName);
		game.setCover(coverName);
		game.setAdspic(adspicName);
		boolean result = gameService.gameInput(game);
		if (result) {
			System.out.println(game.getGamename()+"��ӳɹ�");
			return "admin";
		}else {
			System.out.println("���ʧ�ܣ�");
			return "admin";
		}
	}
	
	/*���������Ϸ�б���*/
	@RequestMapping(value = "/game/getGameList.action")
	public @ResponseBody List<Game> getGameList(Model model) throws Exception {
		List<Game> games = gameService.getGameList();
		return games;
	}
	/*�����Ϸ���鷽��*/
	@RequestMapping(value = "/game/toGame{id}.action")
	public String getGameById(@PathVariable Integer id,HttpSession session,Model model) throws Exception {
		Game game = gameService.getGameById(id);
		String tempTime = new SimpleDateFormat("yyyy-MM-dd").format(game.getCreatetime());
		session.setAttribute("createtime", tempTime);
		model.addAttribute(game);
		return "game";
	}
	/*��ҳ��ҳ��ѯ��Ϸ�б�*/
	@RequestMapping(value = "/game/getGamePage.action")
	public @ResponseBody List<Game> getGamePage(Integer currentPage) throws Exception {
		PageInfo<Game> games = gameService.getGameByPage(currentPage,4);
		List<Game> list = games.getList();
		return list;
	}
	/*��ҳ��ȡҳ��*/
	@RequestMapping(value = "/game/getEndPage.action")
	public void getEndPage(HttpServletResponse response) throws Exception {
		PageInfo<Game> games = gameService.getGameByPage(1,4);
		int lastPage = games.getLastPage();
		response.getWriter().write(""+lastPage);
	}
	/*��ȡ�ؼ���Ϸ*/
	@RequestMapping(value = "/game/getCheapGame.action")
	public @ResponseBody List<Game> getCheapGame() throws Exception {
		List<Game> games = gameService.getCheapGame();
		return games;
	}
	/*��Ϸģ������*/
	@RequestMapping(value = "/game/searchGame.action")
	public String searchGame(Model model,String keyWords) throws Exception{
		List<Game> games = gameService.searchGame(keyWords);
		if (games.toString().equals("[]")) {
			model.addAttribute("msg", "��Ǹ��û���ҵ��롮"+keyWords+"����ص���Ϸ��");
			return "msg";
		}else {
			model.addAttribute("title", "�������:");
			model.addAttribute("gamelist", games);
			return "gamelist";
		}
	}
	/*��ȡ��Ϸ�����б�*/
	@RequestMapping(value = "/game/getTypeList.action")
	public void getTypeList(HttpSession session)throws Exception{
		List<String> types = gameService.getTypeList();
		session.setAttribute("typeList", types);
	}
	/*�����ȡ��Ϸ�б�*/
	@RequestMapping(value = "/game/gameType.action")
	public String gameType(String type,Model model)throws Exception{
		List<Game> games = gameService.getListByType(type);
		model.addAttribute("title", type+":");
		model.addAttribute("gamelist", games);
		return "gamelist";
	}

}
