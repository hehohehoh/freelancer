package com.spring.freelancer.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.freelancer.board.service.ReplyService;
import com.spring.freelancer.board.vo.ReplyVO;

@Controller("replyController")
public class ReplyController {
	
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/reply/list")
	@ResponseBody
	public List<ReplyVO> readReply(Model model, int bno) throws Exception{
		System.out.println("댓글 출력");
		return replyService.replyRead(bno);
	}
	
	@RequestMapping("/reply/insert")
	@ResponseBody
	private int insertReply(@RequestParam int bno, @RequestParam String content, @RequestParam String writer)throws Exception{
		System.out.println("댓글 입력");
			ReplyVO replyVO = new ReplyVO();
			replyVO.setBno(bno);
			replyVO.setContent(content);
			replyVO.setWriter(writer);
			
			return replyService.replyInsert(replyVO);
	}
	
	@RequestMapping("/reply/update")
	@ResponseBody
	private int updateReply(@RequestParam int rno, @RequestParam String content)throws Exception{
		System.out.println("댓글 수정");
		ReplyVO replyVO = new ReplyVO();
		replyVO.setRno(rno);
		replyVO.setContent(content);
		
		return replyService.replyUpdate(replyVO);
	}
	@RequestMapping("/reply/delete/{rno}")
	@ResponseBody
	private int replyDelete(@PathVariable int rno)throws Exception{
		System.out.println("댓글 삭제");
		return replyService.replyDelete(rno);
	}
	
	
}
