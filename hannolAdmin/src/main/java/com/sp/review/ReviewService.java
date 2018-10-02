package com.sp.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public int dataCount() throws Exception;
	public List<Review> listReview (Map<String, Object> map) throws Exception;
	public Review readReview(int reviewCode) throws Exception;
	public int deleteReview(int reviewCode) throws Exception;
	public int deleteReviewLike(int reviewCode) throws Exception;

	public int likeCount(int reviewCode) throws Exception;
}
