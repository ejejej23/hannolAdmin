package com.sp.assets;

import java.util.List;
import java.util.Map;

import com.sp.ticket.Ticket;

public interface AssetsService {
	public List<Map<String, Object>> themeList();
	
	public int assetsDataCount(Map<String, Object> map);
	public List<Assets> assetsCountList(Map<String, Object> map);
	public int searchRentCount(int num);
	public int searchAssetsCode(int num);
	public Ticket searchTicket(int num);
	public int searchReservationCheck(Map<String, Object> map);
	public int insertRent(Assets dto);
	
	public int assetsReservationDataCount (Map<String, Object> map);
	public List<Assets> assetsReservationList (Map<String, Object> map);
	
	public int rentalOkCount (Map<String, Object> map);
	public List<Assets> rentalOkList (Map<String, Object> map);
	
	public int rentUpdate (Map<String, Object> map);
	
	
	

}
