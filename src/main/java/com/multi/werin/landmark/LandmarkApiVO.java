package com.multi.werin.landmark;

public class LandmarkApiVO {

    private String firstimage;
    private String mapx;
    private String mapy;
    private String contentid;
    private String title;
    
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	@Override
	public String toString() {
		return "LandmarkItemVO [firstimage=" + firstimage + ", mapx=" + mapx + ", mapy=" + mapy + ", contentid="
				+ contentid + ", title=" + title + "]";
	}

    
    
}