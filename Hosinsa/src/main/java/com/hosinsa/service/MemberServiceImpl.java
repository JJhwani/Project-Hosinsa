package com.hosinsa.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.hosinsa.domain.MemberVO;
import com.hosinsa.domain.OrderVO;
import com.hosinsa.domain.PageDTO;
import com.hosinsa.domain.PreReviewVO;
import com.hosinsa.domain.ProductVO;
import com.hosinsa.domain.ReviewVO;
import com.hosinsa.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void join(MemberVO member) {
		log.info("join...." + member);
		memberMapper.insert(member);
	}

	@Override
	public MemberVO get(String id) {
		log.info("get...." + id);
		return memberMapper.read(id);
	}

	@DateTimeFormat
	@Override
	public boolean modify(MemberVO member) {
		log.info("modify...." + member);
		return memberMapper.update(member) == 1;
	}

	@Override
	public int remove(MemberVO member) {
		log.info("remove...." + member);
		return memberMapper.delete(member);
	}

	@Override
	public List<MemberVO> getList() {
		log.info("getList....");
		return memberMapper.getList();
	}

	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return memberMapper.memberLogin(member);
	}

	@Override
	public int idCheck(String memberId) {
		return memberMapper.idCheck(memberId);
	}

	@Override
	public int nickCheck(String memberNickname) {
		return memberMapper.nickCheck(memberNickname);
	}

	@Override
	public int introCheck(String memberIntroducer) {
		return memberMapper.introCheck(memberIntroducer);
	}

	@Override
	public List<OrderVO> getOrderList(String id) {
		return memberMapper.getOrderList(id);
	}

	@Override
	public List<PreReviewVO> getPreList(String id) {
		return memberMapper.getPreList(id);
	}

	@Override
	public List<ReviewVO> getAlreadyList(String id) {
		return memberMapper.getAlreadyList(id);
	}

	@Override
	public List<ProductVO> getLikesListWithPaging(String id,int page) {
		return memberMapper.getLikesListWithPaging(id,page);
	}

	@Override
	public OrderVO getOrder(int ordernum) {
		return memberMapper.getOrder(ordernum);
	}
}
