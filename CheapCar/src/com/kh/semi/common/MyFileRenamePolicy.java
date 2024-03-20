package com.kh.semi.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

// FileRenamePolicy를 구현해서 이름바꾸기 정책을 사용할 예정
public class MyFileRenamePolicy implements FileRenamePolicy{
	
	// FileRenamePolicy 인터페이스를 구현했기대문에 인터페이스가 가지고 있는 rename 추상메소드를 구현해야만한다!!!!!!!!!!!!!!!!!
	// rename 메소드에서는 기존 파일명을 전달받아서 파일명을 수정한 후 수정한 파일을 반환해줄 것!
	
	@Override
	public File rename(File originFile) {
		
		// 원본 파일명!
		String originName = originFile.getName();
		// ex.) aaa.jpg
		
		// 수정파일명 만들기(규칙) => 최대한 이름이 안겹치게끔!
		// KH_파일이업로드된시간(년월일시분초)_5자리랜덤값_원본파일확장자
		/*
		 * 원본명						=>				수정명
		 * 
		 * bono.jpg					=>				KH_202403150948309999.jpg
		 * 
		 * 이런식으로 바꾸는걸로 한다면
		 */
		
		// 1. 파일이 업로드된 시간 추출 => String currentTime
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 2. 5자리 랜덤값 만들기 = int randomNo
		int randomNo = (int)(Math.random() * 90000) + 10000;
		
		// 3. 확장자 => String ext
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 1 + 2 + 3 조합해서 수정파일명을 변수에 대입하기
		String changeName = "KH_" + currentTime + "_" + randomNo + "_" + ext;
		
		// 기존 파일명을 수정된 파일명으로 적용시켜서 반환
		return new File(originFile.getParent(), changeName);
		
	}

}
