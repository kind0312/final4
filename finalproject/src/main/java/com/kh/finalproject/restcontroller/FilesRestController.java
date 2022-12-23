package com.kh.finalproject.restcontroller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.kh.finalproject.entity.FilesDto;
import com.kh.finalproject.repository.FilesDao;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name="첨부파일 컨트롤러")
@RestController
public class FilesRestController {
	
	@Autowired
	private FilesDao filesDao;
	
	// 기준 경로
private File dir = new File(System.getProperty("user.home"),"/carepet");//각자 집에서 C드라이브용
//	private File dir = new File("D:/upload/kh10i/carepet");//배포시 D드라이브용
	
	//이미지 저장소 폴더 생성
	@PostConstruct
	public void prepare() {//최소 실행시 딱 한번만 실행되는 코드
		dir.mkdirs(); //폴더 생성
	}
	
	//업로드
	@PostMapping("/upload")
	public String upload(@RequestParam(required = false) MultipartFile files) throws IllegalStateException, IOException {
		//DB저장
		int filesNo = filesDao.sequence();
		filesDao.insert(FilesDto.builder()
				.filesNo(filesNo)
				.filesOriginalName(files.getOriginalFilename())
				.filesType(files.getContentType())
				.filesSize(files.getSize())
				.build());
		
		//파일저장
		File target = new File(dir, String.valueOf(filesNo));
		files.transferTo(target);
		
//		return "redirect:/download/"+filesNo;
		
		return ServletUriComponentsBuilder.fromCurrentContextPath()
				.path("/download/").path(String.valueOf(filesNo))
				.toUriString();
	}
	
	//다운로드 - 기존 방식과 동일
	@GetMapping("/download/{filesNo}")
	public ResponseEntity<ByteArrayResource> download(
			@PathVariable int filesNo) throws IOException{
		FilesDto filesDto = filesDao.find(filesNo);
		if(filesDto==null) {
			throw new IllegalArgumentException();
			//잘못된 매개변수가 들어왔을때의 에러를 발생시킴
		}
		
		File target = new File(dir, String.valueOf(filesDto.getFilesNo()));
		if(!target.exists()) {//파일이 없을때
			throw new IllegalArgumentException();
		}
		
		byte[] date = FileUtils.readFileToByteArray(target);
		ByteArrayResource resource = new ByteArrayResource(date);
		
		return ResponseEntity.ok()
				.header(
						HttpHeaders.CONTENT_ENCODING, 
						StandardCharsets.UTF_8.name()
				)
				.header(
						HttpHeaders.CONTENT_TYPE, 
						filesDto.getFilesType()
				)
				.header(
						HttpHeaders.CONTENT_DISPOSITION, 
						ContentDisposition.attachment()
							.filename(
								filesDto.getFilesOriginalName(),
								StandardCharsets.UTF_8
							).build().toString()
				)
				.contentLength(filesDto.getFilesSize())
				.body(resource);
	}
	
	@DeleteMapping("/delete/{fileNo}")
	public boolean delete(@PathVariable int fileNo) {
		return filesDao.delete(fileNo);
	}

}
