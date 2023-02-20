package tool;

import java.security.MessageDigest;

import org.apache.tomcat.util.codec.binary.Base64;

public class Encode {
	//md5
	//sha-1 thương duoc sai
	public static String toSHA1(String txt) {
		String salt = "ansk@sfjaVfnfk;vlk-nmfa";
		txt += salt;
		String result = null;
		try {
			byte[] dataBytes = txt.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = Base64.encodeBase64String(md.digest(dataBytes));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
