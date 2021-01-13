package ptithcm.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name ="CT_HinhAnh")
public class CT_HinhAnh {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer maCT;
	
	@ManyToOne
	@JoinColumn(name = "MaPhong")
	private PhongTro maPhong;
	
	private String urlHinhAnh;
	
	public Integer getMaCT() {
		return maCT;
	}
	public void setMaCT(Integer maCT) {
		this.maCT = maCT;
	}
	public PhongTro getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(PhongTro maPhong) {
		this.maPhong = maPhong;
	}
	public String getUrlHinhAnh() {
		return urlHinhAnh;
	}
	public void setUrlHinhAnh(String urlHinhAnh) {
		this.urlHinhAnh = urlHinhAnh;
	}
	
	
}
