package ptithcm.bean;


public class PhongTroInfo {
	
	private String loai;
	private String TP;
	private String Quan;
	private String Duong;
	private String gia;
	private String dienTich;
	
	public PhongTroInfo()
	{
		super();
	}

	public PhongTroInfo(String loai, String tP, String quan, String duong, String gia, String dienTich) {
		super();
		this.loai = loai;
		TP = tP;
		Quan = quan;
		Duong = duong;
		this.gia = gia;
		this.dienTich = dienTich;
	}

	public String getLoai() {
		return loai;
	}

	public void setLoai(String loai) {
		this.loai = loai;
	}

	public String getTP() {
		return TP;
	}

	public void setTP(String tP) {
		TP = tP;
	}

	public String getQuan() {
		return Quan;
	}

	public void setQuan(String quan) {
		Quan = quan;
	}

	public String getDuong() {
		return Duong;
	}

	public void setDuong(String duong) {
		Duong = duong;
	}

	public String getGia() {
		return gia;
	}

	public void setGia(String gia) {
		this.gia = gia;
	}

	public String getDienTich() {
		return dienTich;
	}

	public void setDienTich(String dienTich) {
		this.dienTich = dienTich;
	}

	
}
