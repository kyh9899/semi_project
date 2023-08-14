package com.hm.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int no;
	
	private String boardId;
	
	private int boardNo;
	
	private String status;
	
	private int writerNo;
//	
//	private String writerId;
	
	private String content;	
	
	private Date createDate;
	
	private Date modifyDate;
}