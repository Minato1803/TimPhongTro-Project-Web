package ptithcm.entity;


import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DuongPho")
public class DuongPho {

	@Id
	private String maDuong;
	private String tenDuong;
	@ManyToOne
	@JoinColumn(name = "MaQuan")
	private QuanHuyen maQuan;
	@OneToMany(mappedBy = "maDuong", fetch = FetchType.EAGER)
	private Collection<PhongTro> phongTro;
	
	public String getMaDuong() {
		return maDuong;
	}
	public void setMaDuong(String maDuong) {
		this.maDuong = maDuong;
	}
	public String getTenDuong() {
		return tenDuong;
	}
	public void setTenDuong(String tenDuong) {
		this.tenDuong = tenDuong;
	}
	public QuanHuyen getMaQuan() {
		return maQuan;
	}
	public void setMaQuan(QuanHuyen maQuan) {
		this.maQuan = maQuan;
	}
	public Collection<PhongTro> getPhongTro() {
		return phongTro;
	}
	public void setPhongTro(Collection<PhongTro> phongTro) {
		this.phongTro = phongTro;
	}
	
}
