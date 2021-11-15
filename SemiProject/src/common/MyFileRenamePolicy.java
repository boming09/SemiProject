package common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		/* 전달 받은 원본 파일명을 중복 되는 값 없게끔 변경해서 변경 된 파일명을 반환하는 기능 */
		/* 파일명 변경 규칙 : 파일 업로드 시간(년월일시분초) + 0~10만 사이의 랜덤값 부여 */
		
		/* 파일명을 변경하더라도 확장자를 유지하기 위해 확장자명 먼저 추출 */
		String fileName = originFile.getName();   // Ex. 원본 파일명 "user.png"
		String ext = "";                          // 확장자만 추출해서 담을 변수
		int dot = fileName.lastIndexOf(".");      // "."의 인덱스 위치
		
		// "."이라는 문자가 fileName안에 존재한다면
		if(dot != -1) {          
			// "."의 위치부터 마지막까지 추출(Ex. ".png")
			ext = fileName.substring(dot);
		}
		
		/* 년월일시분초 포맷 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		/* 최종 수정할 파일명(년월일시분초  + 최대 5자리 랜덤값 + 파일확장자) */
		String rename = sdf.format(new Date()) + (int)(Math.random() * 100000) + ext;
		
		/* 변경 된 파일명으로 동일 경로에 파일 생성 */
		File newFile = new File(originFile.getParent(), rename);
		
		/* 리네임 된 새로운 파일 리턴 */
		return newFile;
	}

}
