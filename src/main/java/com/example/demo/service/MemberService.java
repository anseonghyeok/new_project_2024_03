package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입이 완료되었습니다.", id);

	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	private Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}

	public ResultData<Integer> doLogin(String loginId, String loginPw) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember == null) {
			return ResultData.from("F-3", Ut.f("없는 아이디(%s)입니다", loginId));
		}

		existsMember = getMemberByLoginPw(loginPw);

		if (existsMember == null) {
			return ResultData.from("F-4", Ut.f("없는 비밀번호(%s)입니다", loginPw));
		}

		memberRepository.login(loginId, loginPw);

		existsMember = memberRepository.login(loginId, loginPw);
		int id = existsMember.getId();

		return ResultData.from("S-1", Ut.f("로그인 성공", id));

	}

	private Member getMemberByLoginPw(String loginPw) {
		return memberRepository.getMemberByLoginPw(loginPw);
	}

}