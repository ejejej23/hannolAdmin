package com.sp.ticket;

import java.util.List;
import java.util.Map;

public interface TicketService {
	public List<String> gubunList() throws Exception;
	public int insertTicket(Ticket dto) throws Exception;
	public List<Ticket> listTicket(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public Ticket readTicket(long goodsCode) throws Exception;
	public int updateTicket(Ticket dto) throws Exception;
}
