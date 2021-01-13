package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name ="PhongTro")
public class PhongTro {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer maPhong;
	
	@NotBlank(message="Không được để trống tiêu đề!")
	private String tieuDe;
	
	@NotBlank(message="Không được để trống loại tin!")
	private String loai;
	
	@NotBlank(message="Không được để trống thông tin liên hệ!")
	private String lienHe;
//	
//	@NotBlank(message="Không được để trống số điện thoại!")
//	@Pattern(regexp="\\d{10}",message="Số điện thoại không hợp lệ!")
	private String sdt;
	
	@NotNull(message="Không được để trống diện tích!")
	@Max(value= 1000, message="Giá trị không quá 1000")
	@Min(value= 5, message="Giá trị không nhỏ hơn 5")
	private Integer dienTich;
	
	@NotNull(message="Không được để trống giá tiền thuê!")
	@DecimalMax(value= "100.00", message="Giá thuê không vượt quá 100 triệu!")
	@DecimalMin(value="0.50", message="Giá thuê không nhỏ hơn 500 ngàn!")
	private Float giaThue;
	
	@NotBlank(message="Không được để trống  địa chỉ!")
	private String diaChi;
	
	@NotBlank(message="Không được để trống thông tin chi tiết!")
	private String ghiChu;
	
	@ManyToOne
	@JoinColumn(name = "MaDuong")
	private DuongPho maDuong;
	
	@OneToMany(mappedBy = "maPhong", fetch = FetchType.EAGER)
	private Collection<CT_HinhAnh> ctHinhAnh;
	
	@ManyToOne
	@JoinColumn(name = "MaUser")
	private TaiKhoan maUser;
	
	public Integer getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(Integer maPhong) {
		this.maPhong = maPhong;
	}
	public String getTieuDe() {
		return tieuDe;
	}
	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}
	public String getLoai() {
		return loai;
	}
	public void setLoai(String loai) {
		this.loai = loai;
	}
	public String getLienHe() {
		return lienHe;
	}
	public void setLienHe(String lienHe) {
		this.lienHe = lienHe;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public Integer getDienTich() {
		return dienTich;
	}
	public void setDienTich(Integer dienTich) {
		this.dienTich = dienTich;
	}
	public Float getGiaThue() {
		return giaThue;
	}
	public void setGiaThue(Float giaThue) {
		this.giaThue = giaThue;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getGhiChu() {
		return ghiChu;
	}
	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}
	public DuongPho getMaDuong() {
		return maDuong;
	}
	public void setMaDuong(DuongPho maDuong) {
		this.maDuong = maDuong;
	}
	public Collection<CT_HinhAnh> getCtHinhAnh() {
		return ctHinhAnh;
	}
	public void setCtHinhAnh(Collection<CT_HinhAnh> ctHinhAnh) {
		this.ctHinhAnh = ctHinhAnh;
	}
	public TaiKhoan getMaUser() {
		return maUser;
	}
	public void setMaUser(TaiKhoan maUser) {
		this.maUser = maUser;
	}

	
	
}
