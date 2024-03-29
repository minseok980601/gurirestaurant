package kr.guri.restaurant.main.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.sound.sampled.AudioFormat.Encoding;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker extends Criteria{

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private String id;
	
	private int displayPageNum = 5;
	
	private Criteria cri;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void serCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public void setTotalCount(String id) {
		this.id = id;
		calcData();
	}
	
	public void setTotalCount(int totalCount, String id) {
		System.out.println("들어온 totalCount : " + totalCount + "들어온 id : " + id);
		this.totalCount = totalCount;
		this.id = id;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public Criteria getCri() {
		return cri;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();
		
		return uriComponents.toUriString();
	}
	
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeSearch(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
					.queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
					.build();
		
		return uriComponents.toUriString();
	}
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
}
