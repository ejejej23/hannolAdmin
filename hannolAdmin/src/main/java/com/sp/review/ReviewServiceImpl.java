package com.sp.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("review.reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	CommonDAO dao;


	@Override
	public int dataCount() throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("review.dataCount");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Review> listReview(Map<String, Object> map) throws Exception {
		List<Review> list = null;
		try {
			list = dao.selectList("review.listReview", map);
			
			for(Review r : list) {
				String memberIdWithStar = r.getMemberId().substring(0, 4).concat("****");
				r.setMemberIdWithStar(memberIdWithStar);
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	@Override
	public Review readReview(int reviewCode) throws Exception {
		Review dto = null;
		try {
			dto = dao.selectOne("review.readReview", reviewCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteReview(int reviewCode) throws Exception {
		int result = 0;
		try {
			deleteReviewLike(reviewCode);
			result = dao.deleteData("review.deleteReview", reviewCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	
	@Override
	public int deleteReviewLike(int reviewCode) throws Exception {
		int result = 0;
		try {
			result = dao.deleteData("review.deleteReviewLike", reviewCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int likeCount(int reviewCode) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("review.likeCount", reviewCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
