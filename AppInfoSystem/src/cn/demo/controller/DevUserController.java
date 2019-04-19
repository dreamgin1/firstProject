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
@RequestMapping(value="/dev")
public class DevUserController extends BaseController {
	private Logger log = Logger.getLogger(DevUserController.class);
	
	@Resource
	private DevUserService devUserService;

	@RequestMapping("/login")
	public String login(){
		log.debug("UserController welcome SMBMS ================ ");
		return "devlogin";
	}
	
	@RequestMapping("/dologin")
	public String doLogin(@RequestParam String devCode,
						@RequestParam String devPassword,
						HttpSession session,
						HttpServletRequest request){
		log.debug(devCode+":密码："+devPassword);
		log.debug("doLogin ================ ");
		DevUser user=new DevUser();
		 user = devUserService.login(devCode, devPassword);
		if(user!=null){
			session.setAttribute(Constants.USER_SESSION, user);
			log.debug("登录成功！ ");
			return "redirect:/dev/main";
		}else{
			request.setAttribute("error", "用户名或密码错误!");
			log.debug("登录失败！ ");
			return "devlogin";
		}
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.removeAttribute(Constants.USER_SESSION);
		return "login";
		
	}
	
	@RequestMapping("main")
	public String main(HttpSession session){
		if(session.getAttribute(Constants.USER_SESSION)!=null){
			return "devmain";
		}
		return "redirect:/dev/login";
	}
	@RequestMapping("userlist")
	public String userlist(HttpSession session){
		if(session.getAttribute(Constants.USER_SESSION)!=null){
			return "userlist";
		}
		return "redirect:/dev/login";
	}
}
