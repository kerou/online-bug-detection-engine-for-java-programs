package Utils;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class JavaUtil {
	private static JavaUtil javaUtil;
	private String result;
	private Process process;

	public int currentState;
	public boolean error;

	public static final int CompileSuccess = 1;
	public static final int CompileFail = 2;
	public static final int Idle = 3;

	private JavaUtil() {
		result = "";
		currentState = Idle;
	}

	public static JavaUtil getInstance() {
		if (javaUtil == null) {
			javaUtil = new JavaUtil();
		}
		return javaUtil;
	}

	public boolean compile(String path) {
		try {
			System.out.println("start compileing");
			System.out.println("start compileing");
			process = Runtime.getRuntime().exec("javac " + path);
			System.out.println("start compileing");
			processResultInfo();
			System.out.println("start compileing");
			if (!error) {
				System.out.println("compile successed");
			} else {
				System.out.println("compile failed");
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("compile failed");
			currentState = CompileFail;
		}
		return error;
	}

	public boolean compileProject(String path) {
		try {
			File file = new File(path);
			if (!file.exists()) {
				file.mkdirs();
			}
			String[] env = { "JAVA_HOME="+Config.JAVAHOME, "M2_HOME=" + Config.M2HOME,
					"M2=%M2_HOME%\bin", "MAVEN_OPTS=" + Config.M2OPTS };
			String[] command = { "\"" + Config.MavenBin + "\"", "compile" };
			try {
				Process process3=Runtime.getRuntime().exec(command, env, file);
				Debug.showConsole(process3);
				process3.waitFor();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	public void checkChildren(File file, BufferedWriter writer) {
		try {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				if (files[i].isDirectory()) {
					checkChildren(files[i], writer);
					writer.write(files[i].getAbsolutePath() + ";");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void processResultInfo() {
		InputStream stdin = process.getInputStream();
		InputStream stderr = process.getErrorStream();

		InputStreamReader isr = new InputStreamReader(stdin);
		BufferedReader reader = new BufferedReader(isr);

		InputStreamReader isr2 = new InputStreamReader(stderr);
		BufferedReader reader2 = new BufferedReader(isr2);

		String s;

		StringBuffer sb = new StringBuffer("");

		try {
			while ((s = reader.readLine()) != null) {
				if (s.length() != 0) {
					sb.append(s);
					currentState = CompileFail;
					error = false;
				}
			}

			while ((s = reader2.readLine()) != null) {
				if (s.length() != 0) {
					sb.append(s);
					currentState = CompileSuccess;
					error = true;
				}
			}

			result = sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getResult() {
		return result;
	}

	public static void main(String[] args) {
		JavaUtil test = JavaUtil.getInstance();
		test.compile("test.java");
		System.out.println(test.getResult());
	}
}
