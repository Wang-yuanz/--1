package com.yan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yan.dao.ApiMapper;
import com.yan.pojo.Api;
import com.yan.pojo.ApiWithBLOBs;
import com.yan.service.ApiService;
import com.yan.util.Convert;
import com.yan.util.SessionUtil;
import com.yan.util.ToolUtil;

/**
 * 后台管理员类的方法
 *
 */
@Controller
@RequestMapping("/api")
public class ApiController {

	@Autowired
	ApiService apiService;

	@Autowired
	ApiMapper apiMapper;

	private Logger log = Logger.getLogger(ApiController.class);

	private Object api;

	/**
	 * 跳转api页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/api-list", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getApiList1(HttpServletRequest request) {

		/*
		 * List<ApiWithBLOBs> list = apiService.getlist(); mv.addObject("apis", list);
		 */
		log.info("获取所有用户");
		// 新建返回值对象
		@SuppressWarnings("unused")
		ModelAndView mv = new ModelAndView();

		Date newdate = null;

		String remark = null;
		List<Map<String, Object>> apis = apiMapper.selectByRemark(remark);
		Api api = SessionUtil.getApi();
		if (ToolUtil.isEmpty(remark)) {
			mv.addObject("remark", remark);
		}
		mv.addObject("api", api);
		mv.addObject("apis", apis);
		mv.addObject("counts", apis.size());

		mv.setViewName("api");
		return mv;
	}

	/**
	 * 去详情页
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/goapishow")
	@ResponseBody
	public ModelAndView goapishow(HttpServletRequest request, HttpServletResponse response, String id) {
		log.info("api 》详情");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mv = new ModelAndView();
		Api api = apiMapper.selectByPrimaryKey(Convert.toInt(id));
		mv.setViewName("api-show");
		mv.addObject("api", api);
		return mv;
	}

	/**
	 * 去添加页面
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/toAddApi")
	@ResponseBody
	public ModelAndView toAddapi() {
		log.info("用户 》 添加 》 跳转");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("api-add");
		return mv;
	}

	/**
	 * 跳转到所有的用户页面
	 *
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/selectApi")
	public ModelAndView getAdmins(HttpServletRequest request, HttpServletResponse response, String sname)
			throws IOException {

		log.info("获取所有用户");
		// 新建返回值对象
		@SuppressWarnings("unused")
		ModelAndView mv = new ModelAndView();
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		Date newdate = null;

		List<ApiWithBLOBs> api = apiMapper.selectApi(sname);

		if (ToolUtil.isEmpty(sname)) {
			mv.addObject("sname", sname);

		}

		mv.setViewName("selectApi");
		return mv;
	}

	/**
	 * 
	 * 执行添加
	 * 
	 * 
	 */

	@RequestMapping(value = "/addApi")
	@ResponseBody
	public void addApi(HttpServletResponse response, HttpServletRequest request, ApiWithBLOBs api) throws IOException {

		log.info("用户 》 添加 》 保存");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		if (ToolUtil.isNotEmpty(api)) {//
			// 做存储操作
			int isok = apiService.addApi(api);
			pw.write(Convert.toString(isok));
			pw.close();
		} else {
			// 异常提醒
			pw.write("0");
		}
	}

	/**
	 * 去修改页面
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/goapiUpdate")
	@ResponseBody
	public ModelAndView goapiUpdate(HttpServletRequest request, HttpServletResponse response, String id) {
		log.info("用户 》 修改 》 跳转");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		ModelAndView mv = new ModelAndView();
		Api api = apiMapper.selectByPrimaryKey(Convert.toInt(id));
		mv.setViewName("api-edit");
		mv.addObject("api", api);
		return mv;
	}

	/**
	 * 执行修改
	 * 
	 */
	@RequestMapping(value = "/updateApi")
	@ResponseBody
	public void updateApi(HttpServletResponse response, HttpServletRequest request, ApiWithBLOBs api)
			throws IOException {

		log.info("用户 》 修改 》 保存");
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		if (ToolUtil.isNotEmpty(api)) {//
			// 做存储操作
			int isok = apiService.updateApi(api);
			pw.write(Convert.toString(isok));
			pw.close();
		} else {
			// 异常提醒
			pw.write("0");
		}
	}

	/**
	 * 删除
	 * 
	 */

	@RequestMapping(value = "/delapi")
	@ResponseBody
	public void del(HttpServletRequest request, HttpServletResponse response, String id) throws IOException {

		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter pw = response.getWriter();
		apiMapper.deleteByPrimaryKey(Convert.toInt(id));
		pw.close();
	}

	public static Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}

}
