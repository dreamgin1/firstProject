package cn.demo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.demo.pojo.DevUser;
import cn.demo.service.user.DevUserService;
import cn.demo.tools.Constants;


@Controller
@RequestMapping
public class UserController extends BaseController {
	private Logger log = Logger.getLogger(UserController.class);
	
	@Resource
	private DevUserService devUserService;

	@RequestMapping("/login")
	public String login(){
		log.debug("UserController welcome SMBMS ================ ");
		return "AppInfoSystem";
	}
	
}
