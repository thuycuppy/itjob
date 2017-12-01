package com.ptit.itjob.common;

public class Constant {
	// Roles
	public static final String ROLE_CANDIDATE = "ROLE_CANDIDATE";
	public static final String ROLE_COMPANY = "ROLE_COMPANY";

	// Upload directories and paths
	public static final String UPLOAD_BASE_DIRECTORY = "D:/itjob/";
	public static final String UPLOAD_CANDIDATE_AVATAR_DIRECTORY = UPLOAD_BASE_DIRECTORY + "avatar/";
	public static final String UPLOAD_CANDIDATE_RESUME_DIRECTORY = UPLOAD_BASE_DIRECTORY + "resume/";
	public static final String UPLOAD_COMPANY_LOGO_DIRECTORY = UPLOAD_BASE_DIRECTORY + "logo/";
	public static final String UPLOAD_BASE_PATH = "/upload/";
	public static final String UPLOAD_CANDIDATE_AVATAR_PATH = UPLOAD_BASE_PATH + "avatar/";
	public static final String UPLOAD_CANDIDATE_RESUME_PATH = UPLOAD_BASE_PATH + "resume/";
	public static final String UPLOAD_COMPANY_LOGO_PATH = UPLOAD_BASE_PATH + "logo/";
	public static final String DEFAULT_AVATAR = UPLOAD_CANDIDATE_AVATAR_PATH + "default.jpg";

	// Pagination
	public static final int COMPANY_HOME = 6;
	public static final int JOB_HOME = 4;
	public static final int COMPANY_PER_PAGE = 9;
	public static final int COMPANY_JOB_PER_PAGE = 3;
	public static final int JOB_PER_PAGE = 9;

	// Datetime format
	public static final String DF_YYYY_MM_DD_DASH = "yyyy-MM-dd";
}
