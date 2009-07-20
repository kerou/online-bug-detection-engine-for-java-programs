package Utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Debug {
	public static void showConsole(Process process) {
		InputStream stdin = process.getInputStream();
		InputStreamReader isr = new InputStreamReader(stdin);
		BufferedReader reader = new BufferedReader(isr);
		String s;
		StringBuffer sb = new StringBuffer("");
		try {
			while ((s = reader.readLine()) != null) {
				if (s.length() != 0) {
					sb.append(s + "\n");
				} else {
					System.out.println("length==0");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		String result = sb.toString();
		System.out.println(result);
	}
}