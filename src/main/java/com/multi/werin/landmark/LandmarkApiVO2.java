package com.multi.werin.landmark;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class LandmarkApiVO2 {

	private String overview;
    private String addr1;
    private String title;
    private String firstImage2;
    private String mapx;
    private String mapy;
    private String tel;
    private String homepage;
    
    private Response response;

    // 다른 필드들은 그대로 두세요.

    public Response getResponse() {
        return response;
    }

    public void setResponse(Response response) {
        this.response = response;
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Response {
        // 'header', 'body', 등 필드들은 그대로 두세요.
    }
    
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstImage2() {
		return firstImage2;
	}
	public void setFirstImage2(String firstImage) {
		this.firstImage2 = firstImage;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
	@Override
	public String toString() {
		return "LandmarkApiVO2 [overview=" + overview + ", addr1=" + addr1 + ", title=" + title + ", firstImage="
				+ firstImage2 + ", mapx=" + mapx + ", mapy=" + mapy + ", tel=" + tel + ", homepage=" + homepage + "]";
	}
    
}