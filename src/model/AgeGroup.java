package model;

public class AgeGroup {

	int ageGroup;
	int ageGroupCount;
	
	public int getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}
	public int getAgeGroupCount() {
		return ageGroupCount;
	}
	public void setAgeGroupCount(int ageGroupCount) {
		this.ageGroupCount = ageGroupCount;
	}
	@Override
	public String toString() {
		return "AgeGroup [ageGroup=" + ageGroup + ", ageGroupCount=" + ageGroupCount + "]";
	}
	
	
}
