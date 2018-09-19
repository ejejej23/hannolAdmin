package com.sp.guide;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("guide.guideService")
public class GuideServiceImpl implements GuideService {
	@Autowired
	CommonDAO dao;

	@Override
	public List<Guide> staffList() throws Exception {
		List<Guide> list = null;
		try {
			list = dao.selectList("guide.staffList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertGuide(Guide dto) throws Exception {
		int result = 0;
		try {

			// 시작일과 종료일 차이 구하기
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date start = formatter.parse(dto.getStartDate());
			Date end = formatter.parse(dto.getEndDate());

			long diff = end.getTime() - start.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);

			// 하루씩 더해주면서 insert 진행
			Calendar cal = new GregorianCalendar(Locale.KOREA);

			for (int i = 0; i <= diffDays; i++) {
				// 날짜마다 하나만 해야함
				cal.setTime(start);
				cal.add(Calendar.DAY_OF_YEAR, i);
				String temp = formatter.format(cal.getTime());

				dto.setWorkDate(temp);
				dao.insertData("guide.insertGuide", dto);
			}

			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
			throw e;
		}
		return result;
	}

	@Override
	public String getName(int usersCode) throws Exception {
		String result = null;
		try {
			result = dao.selectOne("guide.getName", usersCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Guide> guideList() throws Exception {
		List<Guide> list=null;
		try {
			list = dao.selectList("guide.guideList");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Guide readInfo(int schCode) throws Exception {
		Guide dto=null;
		try {
			dto = dao.selectOne("guide.readInfo", schCode);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
