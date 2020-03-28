package com.yan.util;

import java.util.List;

import com.yan.dto.PageVo;




/*
 * 
 * list要被分页的集合
 * 
 * nowPage当前页
 * 
 * pageNote 每一页显示的条数
 * */
public class PageListUtil {
	
	
	  @SuppressWarnings("rawtypes")
	  public static  List distributePage(List list, int nowPage, int pageNote) {
	        List pageList = null;
	        PageVo vo = new PageVo();
	        vo = encapsulationPage(list, nowPage, pageNote);
	        pageList = list.subList(vo.getNowPage() * vo.getPageNote()
	                - vo.getPageNote(), list.size());
	        if (pageList.size() > vo.getPageNote()) {
	            pageList = list.subList(vo.getNowPage() * vo.getPageNote()
	                    - vo.getPageNote(), vo.getNowPage() * vo.getPageNote());
	        }
	        return pageList;
	    }
	   //封装页面 属性
	    @SuppressWarnings("rawtypes")
		public  static PageVo encapsulationPage(List list, int nowPage, int pageNote){
	           PageVo page = new PageVo();
	           page.setHeadPage(1);
	           page.setPageNote(pageNote);
	           page.setConutNote(list);
	           page.setCountPage(list);
	           page.setNowPage(nowPage);
	           page.setNextPage(nowPage);
	           page.setPreviousPage(nowPage);
	            return page;
	    }

}
