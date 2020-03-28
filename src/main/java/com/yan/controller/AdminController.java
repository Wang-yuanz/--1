package com.yan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.yan.common.Constant;
import com.yan.dao.AdminMapper;
import com.yan.pojo.Admin;
import com.yan.pojo.UploadPojo;
import com.yan.service.AdminService;
import com.yan.util.Convert;
import com.yan.util.JSONUtil;
import com.yan.util.SessionUtil;
import com.yan.util.ToolUtil;
import com.yan.util.UploadFileUtils;

/**
 * 后台管理员类的方法
 *
 */
@Controller
@RequestMapping("/login")
public class AdminController {

	public static final String page = null;

	@Autowired
	AdminService adminService;

	@Autowired
	AdminMapper adminMapper;

	private Logger log = Logger.getLogger(AdminController.class);

	public String[][] content;

	/**
	 * 用户后台登录页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "")
	public String loginindex() {
		log.info("进入首界面");
		return "login";
	}

	/**
	 * 登录验证方法
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/tologin")
	@ResponseBody
	public void tologin(HttpServletRequest request, HttpServletResponse response, String username, String password)
			throws IOException {
		log.info("开始登陆了");
		// 新建返回值对象
		@SuppressWarnings("unused")
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(true);
		// 组装对象
		Admin admin = new Admin();
		admin.setAdminuname(username);
		admin.setAdminpwd(password);

		// 查询
		Admin returnAdmin = adminService.getModelByUsernameAndPassword(admin);
		// 判断
		if (returnAdmin == null) {
			pw.write("0");
		} else {
			session.setAttribute("admin", returnAdmin);
			session.setAttribute("adminName", returnAdmin.getAdminuname());
			pw.write(JSONUtil.bean2json(returnAdmin));
		}
		pw.close();
	}

	/**
	 * 登陆成功后跳转
	 * 
	 * @return
	 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView loginMain(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		Admin admin = SessionUtil.getAdmin();
		Integer adminrole = admin.getAdminrole();
		// 新建返回值对象
		mv.addObject("adminrole", adminrole);
//        mv.addObject("userId", userId);
		mv.addObject("userName", admin.getAdminuname());
		mv.setViewName("index");
		return mv;
	}

	// ifram嵌入方法
	@RequestMapping(value = "/welcome")

	public ModelAndView welcome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Admin admin = SessionUtil.getAdmin();
		mv.addObject("userName", admin.getAdminuname());
		mv.setViewName("welcome");
		return mv;
	}

	/**
	 * 后台用户退出方法
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/uplogin")
	@ResponseBody
	public ModelAndView uplogin(HttpServletRequest request) {
		log.info("后台退出");
		// 新建返回值对象
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();
		// 新建返回值对象
		session.removeAttribute("admin");// 删除session
		mv.setViewName("login");
		return mv;
	}

	/**
	 * 跳转到所有的用户页面
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/member-list")
	public ModelAndView getAdmins(HttpServletRequest request, HttpServletResponse response, String yujing, String name,
			String adminphone, String idno) throws IOException {

		log.info("获取所有用户");
		// 新建返回值对象
		@SuppressWarnings("unused")
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		Date newdate = null;

		List<Map<String, Object>> admins = adminMapper.selectAllAdmin(name, adminphone, idno, yujing);
		Admin admin = SessionUtil.getAdmin();
		if (ToolUtil.isEmpty(yujing)) {
			mv.addObject("name", name);
			mv.addObject("adminphone", adminphone);
			mv.addObject("idno", idno);
		}
		mv.addObject("admin", admin);
		mv.addObject("admins", admins);
		mv.addObject("counts", admins.size());

		mv.setViewName("member-list");
		return mv;
	}

	/**
	 * 删除
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/del")
	@ResponseBody
	public void del(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {

		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		adminMapper.deleteByPrimaryKey(Convert.toInt(id));
		pw.close();
	}

	/**
	 * 去添加页面
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toAddUser")
	public String goAddAdmin(HttpServletRequest request) {
		return "member_add";
	}
	/*
	 * 
	 * 
	 * 校验是不是有重复账户
	 */

	@RequestMapping(value = "/yzzh")
	@ResponseBody
	public void yzzh(HttpServletRequest request, HttpServletResponse response, String adminuname) throws IOException {
		log.info("校验账户重复?");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();

		List<Map<String, Object>> list = adminMapper.selectByName(adminuname);

		if (ToolUtil.isNotEmpty(list)) {
			pw.write("0");// 重复了
		} else {
			pw.write("1");
		}
		pw.close();
	}

	@RequestMapping(value = "/yzzhsj")
	@ResponseBody
	public void yzzhsj(HttpServletRequest request, HttpServletResponse response, String adminphone) throws IOException {
		log.info("校验手机重复?");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();

		List<Map<String, Object>> list = adminMapper.selectByPhone(adminphone);

		if (ToolUtil.isNotEmpty(list)) {
			pw.write("0");// 重复了
		} else {
			pw.write("1");
		}
		pw.close();
	}

	/**
	 * 添加用户信息(注册)
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/adduser")
	@ResponseBody
	public void addUser(HttpServletResponse response, HttpServletRequest request, Admin admin) throws IOException {

		log.info("用户 》 添加 》 保存");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		if (ToolUtil.isNotEmpty(admin)) {//
			// 做存储操作
			int id = adminService.addUser(admin);
			pw.write(Convert.toString(id));
			pw.close();
		} else {
			// 异常提醒
			pw.write("0");
		}
	}

	/*
	 * 修改存储头像的路径
	 * 
	 * 
	 */
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	@ResponseBody
	public void uploadFile(MultipartHttpServletRequest request, HttpServletResponse response, UploadPojo uploadPojo)
			throws IOException {

		log.info("上传文件");
		// 获取路径
		String resourcePath = Constant.PIC_PATH;
		ModelAndView mv = new ModelAndView();
		// 新建返回值对象
		String ubid = uploadPojo.getUbid();
		MultipartFile[] uplodFile = uploadPojo.getUplodFile();
		response.setContentType("text/plain;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			if (uplodFile != null && uplodFile.length > 0) { // 组合image名称，“#隔开”
				String pictureurl = ""; // 用来接收拼接各个图片的名字，并保存到数据库。
				for (int i = 0; i < uplodFile.length; i++) {
					if (!uplodFile[i].isEmpty()) {
						pictureurl = pictureurl + UploadFileUtils.uploadImage(request, uplodFile[i], resourcePath,
								Constant.USER_NAME_FILE);
					}
				} // 上传成功
				if (pictureurl != null && pictureurl.length() > 0) {
					System.out.println("上传成功！" + pictureurl);
					Admin admin = new Admin();
					admin.setAdminid(Convert.toInt(ubid));
					admin.setPic(pictureurl);
					adminMapper.updateByPrimaryKeySelective(admin);
				} else {
					System.out.println("上传失败！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 去修改页面
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/goUpdate")
	@ResponseBody
	public ModelAndView goUpdate(HttpServletRequest request, HttpServletResponse response, String id) {
		log.info("用户 》 修改 》 跳转");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");

		ModelAndView mv = new ModelAndView();
		Admin admin = adminMapper.selectByPrimaryKey(Convert.toInt(id));
		mv.setViewName("member-edit");
		mv.addObject("admin", admin);

		return mv;
	}

	/**
	 * 修改信息
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/updateuser")
	@ResponseBody
	public void updateuser(HttpServletResponse response, HttpServletRequest request, Admin admin) throws IOException {

		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		if (ToolUtil.isNotEmpty(admin)) {//
			// 做存储操作
			int id = adminService.updateUser(admin);
			pw.write(Convert.toString(id));
			pw.close();
		} else {
			// 异常提醒
			pw.write("0");
		}
	}

	/**
	 * 去详情页
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/goshow")
	@ResponseBody
	public ModelAndView goshow(HttpServletRequest request, HttpServletResponse response, String id) {
		log.info("用户 》详情");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mv = new ModelAndView();
		Admin admin = adminMapper.selectByPrimaryKey(Convert.toInt(id));
		mv.setViewName("member-show");
		mv.addObject("admin", admin);
		return mv;
	}

//   获取教练信息列表 
	/**
	 * 跳转到所有的用户页面
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/coach-list")
	public ModelAndView getcoachs(HttpServletRequest request, HttpServletResponse response, String yujing, String name,
			String adminphone, String idno) throws IOException {

		log.info("获取所有用户");
		// 新建返回值对象
		@SuppressWarnings("unused")
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");

//       List<Map<String, Object>> admins = adminMapper.selectAllcoachs(name);
//       Admin admin = SessionUtil.getAdmin();
//       mv.addObject("name",name);
//       mv.addObject("adminsession", admin);
//       mv.addObject("admins", admins);
		mv.setViewName("index2");
		return mv;
	}

	/**
	 * 跳转到修改密码
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/pass-edit")
	public String goedit(HttpServletRequest request, HttpServletResponse response) {

		return "pass-edit";
	}

	@RequestMapping(value = "/updatepass")
	@ResponseBody
	public void updatepass(HttpServletResponse response, HttpServletRequest request, String adminpwd)
			throws IOException {

		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		if (ToolUtil.isNotEmpty(adminpwd)) {//
			// 做存储操作
			Admin admin = SessionUtil.getAdmin();
			admin.setAdminpwd(adminpwd);
			int isok = adminMapper.updateByPrimaryKeySelective(admin);
			pw.write(Convert.toString(isok));
			pw.close();
		} else {
			// 异常提醒
			pw.write("0");
		}
	}

}
