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
@Table(name = "QuanHuyen")
public class QuanHuyen {
	
	@Id
	private String maQuan;
	private String tenQuan;
	@ManyToOne
	@JoinColumn(name = "MaTP")
	private ThanhPho thanhPho;
	@OneToMany(mappedBy = "maQuan", fetch = FetchType.EAGER)
	private Collection<DuongPho> duongPho;
	
	
	public String getMaQuan() {
		return maQuan;
	}
	public void setMaQuan(String maQuan) {
		this.maQuan = maQuan;
	}
	public String getTenQuan() {
		return tenQuan;
	}
	public void setTenQuan(String tenQuan) {
		this.tenQuan = tenQuan;
	}
	public ThanhPho getThanhPho() {
		return thanhPho;
	}
	public void setThanhPho(ThanhPho thanhPho) {
		this.thanhPho = thanhPho;
	}
	public Collection<DuongPho> getDuongPho() {
		return duongPho;
	}
	public void setDuongPho(Collection<DuongPho> duongPho) {
		this.duongPho = duongPho;
	}
	
	
}
