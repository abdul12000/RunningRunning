package internal.qaauto.inrunning.tom.Utilties;

public enum BGSEnvironment {
	
	MDEV("mdev"), LDEV("ldev"), LINT("lint");
	
	private static final String ENV_NOT_DEFINED = "Environment '%s' not defined";
	
	private String environmentLabel;
	
	private BGSEnvironment(final String label){
		environmentLabel = label;
	}
	
	public String getEnvironmentLabel(){
		return environmentLabel;
	}
	
	public static BGSEnvironment getEnvironment(final String label){
		for(final BGSEnvironment env : BGSEnvironment.values()){
			if(label.equals(env.getEnvironmentLabel())){
				return env;
			}
		}
		throw new IllegalArgumentException(String.format(ENV_NOT_DEFINED, label));
	}

}
