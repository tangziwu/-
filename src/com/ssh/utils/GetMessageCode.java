package com.ssh.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.json.JSONObject;

/**
 * 根据手机号码发送验证码的封装类
 * @author Veblen
 *
 */
public class GetMessageCode {
	//接口参数
	private static final String QUERY_PATH = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
	private static final String ACCOUNT_SID = "954e16211b76429283e0c6b4a30710a1";
	private static final String AUTH_TOKEN = "3f826e1f7c2d42ceb4bc3631a134c989";
	
	//根据手机号码发送验证码
	public static String getCode(String ophone,String mcontent,String mtype){
		String timestamp = getTimestamp();
		String sig = getMD5(ACCOUNT_SID,AUTH_TOKEN,timestamp);
		String tamp = "【安居物业】"+mtype+"：尊敬的业主，您好！"+mcontent;//模板
		OutputStreamWriter out = null;
		BufferedReader br = null;
		StringBuilder result = new StringBuilder();
		
		try {
			URL url = new URL(QUERY_PATH);
			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoInput(true);//设置允许数据写入
			connection.setDoOutput(true);//设置是否允许参数输出
			connection.setConnectTimeout(5000);//设置连接响应时间
			connection.setReadTimeout(10000);//设置参数读取时间
			connection.setRequestProperty("content-type","application/x-www-form-urlencoded");//设置接口的请求包头
			//提交请求
			out = new OutputStreamWriter(connection.getOutputStream(),"utf-8");
			String args = getQueryArgs(ACCOUNT_SID, tamp, ophone, timestamp, sig, "JSON");
			out.write(args);
			out.flush();
			//读取返回结果
			br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"UTF-8"));
			String temp = "";
			while((temp = br.readLine())!=null){
				result.append(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//导入json-20160810.jar
		JSONObject json = new JSONObject(result.toString());
		//返回包体内的返回状态码在json内的键值
		String respCode = json.getString("respCode");
		//默认的返回状态码（成功为00000）
		String defaultRespCode = "00000";
		if(defaultRespCode.equals(respCode)){
			return "发送成功";
		}else{
			return "发送失败";
		}
	}
	
	//拼接参数
	public static String getQueryArgs(String accountSid,String smsContent,String to,String timestamp,String sig,String respDataType){
		return "accountSid="+accountSid+"&smsContent="+smsContent+"&to="+to+"&timestamp="+timestamp+"&sig="+sig+"&respDataType="+respDataType;
	}
	
	//获取时间戳(系统时间字符串：20171030214306)
	public static String getTimestamp(){
		return new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	}
	
	//sig签名进行加密处理
	public static String getMD5(String sid,String token,String timestamp){
		StringBuilder result = new StringBuilder();
		String source = sid + token + timestamp;
		
		try {
			MessageDigest digest = MessageDigest.getInstance("MD5");
			byte[] bytes = digest.digest(source.getBytes());
			for(byte b : bytes){
				String hex = Integer.toHexString(b&0xff);
				if(hex.length()==1){
					result.append("0"+hex);
				}else{
					result.append(hex);
				}
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result.toString();
	}
	
}
