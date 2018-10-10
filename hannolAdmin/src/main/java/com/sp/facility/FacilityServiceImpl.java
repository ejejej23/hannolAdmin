package com.sp.facility;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.common.FileManager;
import com.sp.common.dao.CommonDAO;

@Service("facility.facilityService")
public class FacilityServiceImpl implements FacilityService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager filemanager;
	
	@Override
	public int insertFacility(Facility dto, String pathname) {
		int result=0;
		try {
			//dto에 있는 multipartfile을 받는다.(upload1,2)
			MultipartFile mf1= dto.getUpload1();
			MultipartFile mf2= dto.getUpload2();
			
			//파일매니저를 이용해서 파일을 업로드한다 (dofileupload 메소드(업로드할파일명, 경로))->return : save~~파일명
			String saveMainFilename = filemanager.doFileUpload(mf1, pathname);
			String saveLocFilename= filemanager.doFileUpload(mf2, pathname);

			//저장한파일명과 저장된 파일명을 dto에 저장해준다
			if((saveMainFilename != null)) {
				String originalMainFilename = mf1.getOriginalFilename();
				dto.setSaveMainFilename(saveMainFilename);
				dto.setOriginalMainFilename(originalMainFilename);
			}

			if((saveLocFilename!=null)) {
				String originalLocFilename = mf2.getOriginalFilename();		
				dto.setSaveLocFilename(saveLocFilename);
				dto.setOriginalLocFilename(originalLocFilename);
			}

			// 그 dto를 insert해준다
			result = dao.insertData("facility.insertFacility",dto);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	@Override
	public int insertRides(int code) {
		int result=0;
		
		try {
			result = dao.insertData("facility.insertRides",code);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int updateFacility(Facility dto, String pathname) {
		int result = 0;
		try {
			System.out.println("update하러 들어왔다~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");
			
			/*
	// upload1
	String saveMainFilename;
	String originalMainFilename;
	// upload2
	String saveLocFilename;
	String originalLocFilename;
			 * */
			String newsaveMainFilename = filemanager.doFileUpload(dto.getUpload1(), pathname);
			String newsaveLocFilename = filemanager.doFileUpload(dto.getUpload2(), pathname);
			
			if(newsaveMainFilename!=null) {
				if(dto.getSaveMainFilename().length()!=0)
					filemanager.doFileDelete(dto.getSaveMainFilename(), pathname);
				dto.setSaveMainFilename(newsaveMainFilename);
				dto.setOriginalMainFilename(dto.getUpload1().getOriginalFilename());
			} 
			
			if(newsaveLocFilename!=null) {
				if(dto.getSaveLocFilename().length()!=0)
					filemanager.doFileDelete(dto.getSaveLocFilename(), pathname);
				dto.setSaveLocFilename(newsaveLocFilename);
				dto.setOriginalLocFilename(dto.getUpload2().getOriginalFilename());
			}
			
			dao.updateData("facility.updateFacility", dto);
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());

		}
		System.out.println("getList간다~~~~~~~~~~~~~~~~~~~@!!!!!!!!!!!");

		return result;
	}

	@Override
	public int deleteFacility(int num, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public List<Facility> listFacility(Map<String, Object> map,String pathname) {
		List<Facility> list = null;
		try {
			list = dao.selectList("facility.listFacility",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("facility.dataCount",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Facility readFacility(int num) {
		Facility dto=null;
		try {
			dto=dao.selectOne("facility.readFacility",num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Facility readFacility(Facility dto) {
		
		try {
			dto=dao.selectOne("facility.readFacility",dto.getFacilityCode());
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	@Override
	public int readFacilityCode() {
		int result=0;
		try {
			result=dao.selectOne("facility.readFacilityCode");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Facility> selectCreate() {
		List<Facility> list = null;
		try {
			list = dao.selectList("facility.selectCreate");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
