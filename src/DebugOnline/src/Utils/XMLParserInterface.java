package Utils;
import java.util.Vector;

public interface XMLParserInterface {
	public void SetInput(String input);
	public void parse();
	public void clear();
	public String getOutput();
	public Vector<Report> getReports();
}
