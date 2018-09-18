package com.sp.ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("ticket.ticketService")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<String> gubunList() throws Exception {
		List<String> list = null;
		try {
			list = dao.selectList("ticket.listGubun");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int insertTicket(Ticket dto) throws Exception {
		int result = 0;
		try {
			int seq = dao.selectOne("ticket.seq");
			dto.setGoodsCode(seq);
			dao.insertData("ticket.insertTicket", dto);
			dao.insertData("ticket.insertTicketInfo", dto);
			result = 1;
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<Ticket> listTicket(Map<String, Object> map) throws Exception {
		List<Ticket> list = null;
		try {
			list = dao.selectList("ticket.listTicket", map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result = dao.selectOne("ticket.dataCount", map);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public Ticket readTicket(long goodsCode) throws Exception {
		Ticket ticket = null;
		try {
			ticket = dao.selectOne("ticket.readTicket", goodsCode);
		} catch (Exception e) {
			throw e;
		}
		return ticket;
	}

	@Override
	public int updateTicket(Ticket dto) throws Exception {
		int result = 0;
		try {
			result = dao.updateData("ticket.updateTicket", dto);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

}
