package always.awake.studyplus.member.model.vo;

public class Sentence implements java.io.Serializable{
	private String verb;
	private String noun;
	private String directObject;
	
	public Sentence() {}
	
	public Sentence(String verb, String noun, String directObject) {
		super();
		this.verb = verb;
		this.noun = noun;
		this.directObject = directObject;
	}

	public String getVerb() {
		return verb;
	}

	public void setVerb(String verb) {
		this.verb = verb;
	}

	public String getNoun() {
		return noun;
	}

	public void setNoun(String noun) {
		this.noun = noun;
	}

	public String getDirectObject() {
		return directObject;
	}

	public void setDirectObject(String directObject) {
		this.directObject = directObject;
	}

	@Override
	public String toString() {
		return "Sentence [verb=" + verb + ", noun=" + noun + ", directObject=" + directObject + "]";
	}
	
}
