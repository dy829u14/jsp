package fileupload;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int MaxPostSize) {
		try {
			return new MultipartRequest(req, saveDirectory, MaxPostSize, "UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
}
