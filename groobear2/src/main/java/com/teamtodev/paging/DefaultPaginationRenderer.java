package com.teamtodev.paging;

public class DefaultPaginationRenderer implements PaginationRenderer {

	@Override
	public String renderPagination(PaginationInfo paging, String funcName) {
		int firstPage = paging.getFirstPage();
		int lastPage = paging.getLastPage();
		int totalPage = paging.getTotalPage();
		lastPage = lastPage > totalPage ? totalPage : lastPage;
		int pageSize = paging.getPageSize();
		int currentPage = paging.getCurrentPage();
		
		StringBuffer html = new StringBuffer();
		
		String pattern = "<a href='javascript:;' onclick='%s(%d);'>[%s]</a>";
		if(firstPage > pageSize) {
			html.append( String.format(pattern, funcName, firstPage - pageSize, "이전") );
		}
		
		for(int page = firstPage; page <= lastPage; page++) {
			if(page==currentPage) {
				html.append(page);
			}else {
				html.append( String.format(pattern, funcName, page, page) );
			}
		}
		
		if(lastPage < totalPage) {
			html.append( String.format(pattern, funcName, lastPage + 1, "다음") );
		}
		
		
		return html.toString();
	}

}
