package ptithcm.entity;


import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ThanhPho")
public class ThanhPho {
	@Id
	private String maTP;
	private String tenTP;
	@OneToMany(mappedBy = "thanhPho", fetch = FetchType.EAGER)
	private Collection<QuanHuyen> quanHuyen;
	public String getMaTP() {
		return maTP;
	}
	public void setMaTP(String maTP) {
		this.maTP = maTP;
	}
	public String getTenTP() {
		return tenTP;
	}
	public void setTenTP(String tenTP) {
		this.tenTP = tenTP;
	}
	public Collection<QuanHuyen> getQuanHuyen() {
		return quanHuyen;
	}
	public void setQuanHuyen(Collection<QuanHuyen> quanHuyen) {
		this.quanHuyen = quanHuyen;
	}
	
	
	
	
}
