package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ArticleService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	public UsrArticleController() {

	}

	// 액션 메서드

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticleAction(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물은 존재하지 않습니다", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), article);
	}

	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.getArticles();
		return ResultData.from("S-1", "Article List", articles);
	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(HttpSession httpSession, String title, String body, int memberId) {

		if (Ut.isNullOrEmpty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요");
		}

		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "로그인후 수정해주세요");
		}

		memberId = (int) httpSession.getAttribute("loginedMemberId");

		ResultData<Integer> writeArticleRd = articleService.writeArticle(title, body, memberId);

		int id = (int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		return ResultData.newData(writeArticleRd, article);
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(HttpSession httpSession, int id, String title, String body) {

		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "로그인후 수정해주세요");
		}
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 존재하지 않습니다", id), id);
		}

		if ((int) httpSession.getAttribute("loginedMemberId") != article.getMemberId()) {
			return ResultData.from("F-A", Ut.f("%d번 글은 권한이 없습니다", id), id);
		}

		articleService.modifyArticle(id, title, body);

		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", id), id);
	}

	private Object getAttribute(String string) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(HttpSession httpSession, int id) {

		if (httpSession.getAttribute("loginedMemberId") == null) {
			return ResultData.from("F-A", "로그인후 삭제해주세요");
		}

		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 존재하지 않습니다", id), id);
		}

		if ((int) httpSession.getAttribute("loginedMemberId") != article.getMemberId()) {
			return ResultData.from("F-A", Ut.f("%d번 글은 권한이 없습니다", id), id);
		}

		articleService.deleteArticle(id);

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", id), id);
	}

}