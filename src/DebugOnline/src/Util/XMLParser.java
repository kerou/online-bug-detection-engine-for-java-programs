package Util;

public interface XMLParser {
	public void SetInput(String input);
	public void parse();
	public void clear();
	public String getOutput();
	public Report getReport();
}
