package always.awake.studyplus.need.model.vo;

public class Need {

	private int lv;
	private int exp;
	private int water;
	private int minusWater;
	
	public Need() {
		super();
	}

	public Need(int lv, int exp, int water, int minusWater) {
		super();
		this.lv = lv;
		this.exp = exp;
		this.water = water;
		this.minusWater = minusWater;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public int getWater() {
		return water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	public int getMinusWater() {
		return minusWater;
	}

	public void setMinusWater(int minusWater) {
		this.minusWater = minusWater;
	}

	@Override
	public String toString() {
		return "Need [lv=" + lv + ", exp=" + exp + ", water=" + water + ", minusWater=" + minusWater + "]";
	}
}
