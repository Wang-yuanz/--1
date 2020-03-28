package com.yan.dto;

import java.io.Serializable;
import java.util.List;
/*分页中的属性模型*/
@SuppressWarnings("serial")
public class PageVo implements Serializable {
	
	 private int countPage;// 总页数

	    private int conutNote;// 总条数

	    private int previousPage;// 上一页

	    private boolean previous;// 判断上一页

	    private int nextPage;// 下一页

	    private boolean next;// 判断下一页

	    private int nowPage;// 当前页

	    private int HeadPage;// 首页

	    private int pageNote;// 每一页显示的条数

	    public int getConutNote() {
	        return conutNote;
	    }

	   
	    @SuppressWarnings("rawtypes")
		public void setConutNote(List list) {
	        this.conutNote = list.size();
	    }

	    public int getCountPage() {
	        return countPage;
	    }

	    @SuppressWarnings("rawtypes")
		public void setCountPage(List list) {
	        if (list.isEmpty()) {
	            this.countPage = 1;
	        } else if (list.size() == 0) {
	            this.countPage = 1;
	        } else {
	            this.countPage = list.size() % this.getPageNote() == 0 ? list
	                    .size()
	                    / this.getPageNote() : list.size() / this.getPageNote() + 1;
	        }
	    }

	    public int getHeadPage() {
	        return HeadPage;
	    }

	    public void setHeadPage(int headPage) {
	        HeadPage = headPage;
	    }

	    public int getNextPage() {
	        if (this.nextPage < this.countPage) {
	            this.nextPage++;
	        }
	        return this.nextPage;
	    }

	    public void setNextPage(int nextPage) {
	        this.nextPage = nextPage;
	    }

	    public int getNowPage() {
	        return nowPage;
	    }

	    public void setNowPage(int nowPage) {
	        if (nowPage > this.countPage) {
	            nowPage = 1;
	        }
	        this.nowPage = nowPage;
	    }

	    public int getPageNote() {
	        return pageNote;
	    }

	    public void setPageNote(int pageNote) {
	        this.pageNote = pageNote;
	    }

	    public int getPreviousPage() {
	        if (this.previousPage > this.HeadPage) {
	            this.previousPage--;
	        }
	        return previousPage;
	    }

	    public void setPreviousPage(int previousPage) {
	        this.previousPage = previousPage;
	    }

	    public boolean isNext() {
	        if (this.nextPage >= this.countPage || this.countPage == this.HeadPage) {
	            this.next = false;
	        } else {
	            this.next = true;
	        }
	        return this.next;
	    }

	    public void setNext(boolean next) {
	        this.next = next;
	    }

	    public boolean isPrevious() {
	        if (this.nowPage <= this.HeadPage) {
	            this.previous = false;
	        } else {
	            this.previous = true;
	        }
	        return this.previous;
	    }

	    public void setPrevious(boolean previous) {
	        this.previous = previous;
	    }

}
