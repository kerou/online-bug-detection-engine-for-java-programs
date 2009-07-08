package Utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class JavaUtil {
	private static JavaUtil javaUtil;
	private String result;
	private Process process;
	
	public int currentState;
	public boolean error;
	
	public static final int CompileSuccess=1;
	public static final int CompileFail=2;
	public static final int Idle=3;
	
	private JavaUtil(){
		result="";
		currentState=Idle;
	}
	
	public static JavaUtil getInstance(){
		if(javaUtil==null){
			javaUtil=new JavaUtil();
		}
		return javaUtil;
	}
	
	public boolean compile(String path){
		try {
			System.out.println("start compileing");
			process=Runtime.getRuntime().exec("javac "+path);
			processResultInfo();
			if(!error){
				System.out.println("compile successed");
			}else{
				System.out.println("compile failed");
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("compile failed");
			currentState=CompileFail;
		}
		return error;
	}
	
	private void processResultInfo(){
		InputStream stdin=process.getInputStream();
		InputStream stderr=process.getErrorStream();
		
		InputStreamReader isr=new InputStreamReader(stdin);
		BufferedReader reader=new BufferedReader(isr);
		
		InputStreamReader isr2=new InputStreamReader(stderr);
		BufferedReader reader2=new BufferedReader(isr2);
		
		String s;
		
		StringBuffer sb=new StringBuffer("");
		
		try {
			while((s=reader.readLine())!=null){
				if(s.length()!=0){
					sb.append(s);
					currentState=CompileFail;
					error=false;
				}
			}
			
			while((s=reader2.readLine())!=null){
				if(s.length()!=0){
					sb.append(s);
					currentState=CompileSuccess;
					error=true;
				}
			}
			
			result=sb.toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String getResult(){
		return result;
	}
	
	public static void main(String[] args){
		JavaUtil test=JavaUtil.getInstance();
		test.compile("test.java");
		System.out.println(test.getResult());
	}
}
