package com.hm.mvc.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int no;
	
	private int rowNum;
	
	private int writerNo;
	
	private String boardId;
	
	private String writerId;
	
	private String title;
	
	private String content;
	
	private String content2;
	
	private String originalFilename; 
	
	private String renamedFilename;
	
	private int readCount;
	
	private String status;
	
	private List<Reply> replies;
	
	private Date createDate;
	
	private Date modifyDate;
}
