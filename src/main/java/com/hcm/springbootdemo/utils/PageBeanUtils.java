package com.hcm.springbootdemo.utils;

import com.hcm.springbootdemo.entity.YwInfo;
import org.apache.poi.ss.formula.functions.T;

import java.util.List;

/**
 * 
 * @author zhuzeyong
 * @date 2021/08/31 15:38
 **/
public class PageBeanUtils<T> {
    private int prePage;//上一页
    private int nextPage;//下一页
    private int firstPage = 1;//首页
    private int lastPage;//尾页
    private int currentPage = 1;//当前页
    private int totalPage;//总页数
    private int pageSize;//每页显示条数，默认显示10条
    private int totalData;//数据总条数
    private List<T> pageData;//数据

    public int getPrePage() {
        return prePage;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalData() {
        return totalData;
    }

    public void setTotalData(int totalData) {
        this.totalData = totalData;
    }

    public List<T> getPageData() {
        return pageData;
    }

    public void setPageData(List<T> pageData) {
        this.pageData = pageData;
    }

    public PageBeanUtils(int currentPage, int pageSize, int totalData){
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalData = totalData;

        //计算获得总页数（尾页）
        this.totalPage = this.lastPage = (int) Math.ceil((double) totalData / pageSize);

        //防止当前页小于1
        this.currentPage = Math.max(this.currentPage,1);

        //防止当前页大于总的页面
        this.currentPage = Math.min(this.totalPage,this.currentPage);

        //设置上一页，上一页不能小于1
        this.prePage = Math.max(this.currentPage - 1, 1);

        //设置下一页，下一页不能大于总页数
        this.nextPage = Math.min(this.currentPage + 1, this.totalPage);
    }
}
