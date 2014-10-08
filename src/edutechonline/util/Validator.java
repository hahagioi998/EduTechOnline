package edutechonline.util;

import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import edutechonline.application.Constants;

public class Validator {
	private static Logger log =Logger.getLogger(Validator.class);
	private static Pattern namePattern;
	private static Pattern emailPattern;
	
	public static void compilePatterns() {
		namePattern=Pattern.compile(Constants.NAME_REGEX,Pattern.CASE_INSENSITIVE);
		emailPattern=Pattern.compile(Constants.EMAIL_REGEX, Pattern.CASE_INSENSITIVE);
	}
	
	
	public static boolean isValidEmail(String email) {
		
		if (!emailPattern.matcher(email).matches()) {
			return false;
		}
		if (email.length() > Constants.EMAIL_LENGTH)  {
			return false;
		}
		return true;
	}
	
	public static boolean isValidName(String name) {
		if (!namePattern.matcher(name).matches()) {
			log.debug("invalid name");
			return false;
		}
		if (name.length() > Constants.NAME_LENGTH)  {
			return false;
		}
		return true;
	}
	
	public static boolean isValidPassword(String pass) {
		if (pass==null) {
			return false;
		}
		if (pass.length()>Constants.PASS_LENGTH) {
			return false;
		}
		return true;
	}
	
	public static boolean isValidRole(String role) {
		if (role.equals("admin") || role.equals("unverified") || role.equals("user") || role.equals("unverified")) {
			return true;
		}
		return false;
	}
}
