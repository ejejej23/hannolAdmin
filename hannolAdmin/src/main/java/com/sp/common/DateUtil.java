package com.sp.common;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;

@Service("dateUtil")
public class DateUtil {
	/**
	 * String�� ��¥�� Date������ ��ȯ�ϴ� �޼ҵ�
	 * 
	 * @param dateStr ��ȯ�� ��¥
	 * @return ��¥
	 */
	public Date toDate(String dateStr) {
		Date date=null;
		
		try {
			if (dateStr.length() != 8 && dateStr.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + dateStr);
				// �Ʒ� catch���� ��ƹ����� �ǹ� ����.
			}

			dateStr = dateStr.replaceAll("(-|\\.|/)", "");	// -, ., /  ���ش�.
			
			SimpleDateFormat sformat = new SimpleDateFormat("yyyyMMdd");	// String -> Date	// MM�� ��.  mm�� ��
			date = sformat.parse(dateStr);	// parse ���� �ִ�. checked exception. ����ó�� �ʼ�
//			public Date parse(String source) throws ParseException			
		} catch (ParseException e) {
			throw new RuntimeException(e);	
			// ���ܸ� �ٽ� �����µ�, Runtime���� �ٲ㼭 ����. checked�� unchecked�� �ٲ㼭 ������ ������ �θ� ������ �ݵ�� ���� ó���� ���ص� �ȴ�.
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
		return date;
	}

	/**
	 * Date���� String������ ��ȯ�ϴ� �޼ҵ�
	 * 
	 * @param date ��ȯ�� ��¥
	 * @return ��ȯ�� ���ڿ�
	 */
	public String toString(Date date) {
		String str=null;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	// ���� yyyy-MM-dd
        str = sdf.format(date);
		
		return str;
	}
	
	/**
	 * ��������� �̿��Ͽ� ���̸� ����ϴ� �޼ҵ�
	 * 
	 * @param birth ���̸� ����� �������(yyyyMMdd)
	 * @return ����
	 */
	public int toAge(String birth) {
		int age = 0;

		try {
			if (birth.length() != 8 && birth.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + birth);
			}

			String dateStr = birth;
			if (birth.length() == 10) {
				dateStr = birth.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar now = Calendar.getInstance();

			age = now.get(Calendar.YEAR) - cal.get(Calendar.YEAR);
			if ((cal.get(Calendar.MONTH) > now.get(Calendar.MONTH))
					|| (cal.get(Calendar.MONTH) == now.get(Calendar.MONTH)
							&& cal.get(Calendar.DAY_OF_MONTH) > now.get(Calendar.DAY_OF_MONTH))) {
				age--;
			}

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return age;
	}

	/**
	 * ���س�¥�� ��ĥ° �Ǵ� ���� ���ϴ� �޼ҵ�
	 * 
	 * @param date ���س�¥
	 * @param days ��ĥ° �Ǵ� ���� ����� ����
	 * @return     ��ĥ���� ��¥(yyyy-MM-dd)
	 */
	public String toDaysLater(String date, int days) {	// ex)���÷� ���� 100�� ��	// Ŭ���̾�Ʈ�� �Է��� �� String�̹Ƿ�
		String result = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6, 8));

			Calendar cal = Calendar.getInstance();
			cal.set(year, month - 1, day);
			cal.add(Calendar.DATE, days);				// *

			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
			day = cal.get(Calendar.DATE);

			result = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}

	/**
	 * �� ���� ������(�Ͽ���)�� ���ϴ� �޼ҵ�
	 * 
	 * @param date ���س�¥
	 * @return     �� ���� ��������(yyyy-MM-dd)
	 */
	public String toWeekStart(String date) {
		String s = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar sday = (Calendar) cal.clone();	// ��ü�� ���� ����µ� ���� �Ȱ��� ����
			int t = cal.get(Calendar.DAY_OF_WEEK) - 1;
			sday.add(Calendar.DAY_OF_MONTH, t * -1);

			year = sday.get(Calendar.YEAR);
			month = sday.get(Calendar.MONTH) + 1;
			day = sday.get(Calendar.DATE);

			s = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return s;
	}

	/**
	 * �� ���� ��������(�����)�� ���ϴ� �޼ҵ�
	 * 
	 * @param date ���س�¥
	 * @return     �� ���� ����������(yyyy-MM-dd)
	 */
	public String toWeekEnd(String date) {
		String s = "";

		try {
			if (date.length() != 8 && date.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + date);
			}

			String dateStr = date;
			if (date.length() == 10) {
				dateStr = date.replaceAll("(-|\\.|/)", "");
			}

			int year = Integer.parseInt(dateStr.substring(0, 4));
			int month = Integer.parseInt(dateStr.substring(4, 6));
			int day = Integer.parseInt(dateStr.substring(6));

			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			cal.set(Calendar.DATE, day);

			Calendar eday = (Calendar) cal.clone();
			int t = 7 - cal.get(Calendar.DAY_OF_WEEK);
			eday.add(Calendar.DAY_OF_MONTH, t);

			year = eday.get(Calendar.YEAR);
			month = eday.get(Calendar.MONTH) + 1;
			day = eday.get(Calendar.DATE);

			s = String.format("%4d-%02d-%02d", year, month, day);

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return s;
	}

	/**
	 * �ش�⵵�� �츦 ���ϴ� �޼ҵ�
	 * 
	 * @param year �츦 ���� ����
	 * @return     ��
	 */
	public String toTti(int year) {
		String t[] = { "������", "��", "��", "����", "��", "��", "ȣ����", "�䳢", "��", "��", "��", "��" };
		return t[year % 12];
	}

	/**
	 * �������� �Ǻ��ϴ� �޼ҵ�
	 * 
	 * @param year
	 * @return
	 */
	public boolean isLeapYear(int year) {
		return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
	}

	/**
	 * �� ��¥ ������ ���̸� ���ڷ� �����ϴ� �޼ҵ�
	 * 
	 * @param sDate  ���̸� ����� ���۳�¥
	 * @param eDate  ���̸� ����� ���۳�¥
	 * @return       ��¥������ ����(����)
	 */
	public int diffDays(String startDate, String endDate) {
		int result = 0;

		try {
			if (startDate.length() != 8 && startDate.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + startDate);
			}
			if (endDate.length() != 8 && endDate.length() != 10) {
				throw new IllegalArgumentException("Invalid date format(yyyyMMdd, yyyy-MM-dd): " + endDate);
			}

			startDate = startDate.replaceAll("(-|\\.|/)", "");
			endDate = endDate.replaceAll("(-|\\.|/)", "");

			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			Date date1 = format.parse(startDate);
			Date date2 = format.parse(endDate);

			long d = date2.getTime() - date1.getTime();	// long�� - ms return	. 	1000ms = 1s 

			result = (int) (d / (1000 * 60 * 60 * 24));

		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return result;
	}
	
	/**
	 * ��¥�� �ùٸ� ���������� �����ϴ� �޼ҵ�(�ùٸ��� true)
	 * 
	 * @param date  ������ �˾ ��¥
	 * @return      
	 */
	public boolean isDateCheck(String date) {
		try {
			if (date.length() != 8 && date.length() != 10) {
				return false;
			}

			date = date.replaceAll("(-|\\.|/)", "");
			int year = Integer.parseInt(date.substring(0, 4));
			int month = Integer.parseInt(date.substring(4, 6));
			int day = Integer.parseInt(date.substring(6));
			
			if(month<1||month>12)
				return false;
			
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.YEAR, year);
			cal.set(Calendar.MONTH, month - 1);
			
			int lastDay=cal.getActualMaximum(Calendar.DATE);
			if(day<1||day>lastDay)
				return false;

		} catch (Exception e) {
			return false;
		}

		return true;
	}
	
	/**
	 * �ֹι�ȣ�� �ùٸ� ���������� �����ϴ� �޼ҵ�(�ùٸ��� true)
	 * 
	 * @param rrn  �ֹι�ȣ
	 * @return      
	 */
	public boolean isRrnCheck(String rrn) {		// ���� : Ȧ��. ���� : ¦��
		// 1900 ��� �ܱ��� : 5	// ��ȣ�� ��� ����.
		// ������ ���� : �´��� �˻��
		// ������ ���� ���� : �� ������ ���°�� �¾����
		
		/* 234567 892345 
		 * 920429-200000 0 
		 * 2*9 + 3*2 + ...	=> �� �� ���� 11�� ������ �� ���� 11�� ����. �� ���� �� 10���� ������.	=> ������ ����	  
		 */		
		int [] check = {2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5};
		int tot, n, lastNum, chkNum;
		boolean b=false;
		
		try {
			if (rrn.length() != 14 && rrn.length() != 13) {
				return false;
			}
			
			if(toBirth(rrn).length()==0) {
				return false;
			}

			rrn = rrn.replaceAll("-", "");

			tot=0;
			for(int i = 0; i < 12; i++) {
				n = Integer.parseInt(rrn.substring(i, i+1));

				tot = tot+(n * check[i]);
			}

			lastNum = Integer.parseInt(rrn.substring(12));
			chkNum = 11 - tot % 11;
			chkNum = chkNum % 10;
			
			b=lastNum == chkNum;
			
		} catch (Exception e) {
			return false;
		}

		return b;
	}
	
	/**
	 * �ֹι�ȣ�� �̿��Ͽ� ��������� �����ϴ� �޼ҵ�
	 * 
	 * @param rrn  �ֹι�ȣ
	 * @return     �������
	 */
	public String toBirth(String rrn) {
		String birth="";
		int gender;
		
		try {
			if (rrn.length() != 14 && rrn.length() != 13) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
			
			rrn = rrn.replaceAll("-", "");
			gender=Integer.parseInt(rrn.substring(6,7));
			
			// birth=rrn.substring(0, 6);
			birth=rrn.substring(0, 2)+"-"+rrn.substring(2, 4)+"-"+rrn.substring(4, 6);
			if(gender==1||gender==2||gender==5||gender==6) {	// 1900��� ���
				birth="19"+birth;
			} else if(gender==3||gender==4||gender==7||gender==8) {	// 2000��� ���
				birth="20"+birth;
			} else if(gender==0||gender==9) {	// 1800 ��� ���
				birth="18"+birth;
			}
			
			if(! isDateCheck(birth)) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return birth;
	}
	
	/**
	 * �ֹι�ȣ�� �̿��Ͽ� ������ �����ϴ� �޼ҵ�
	 * 
	 * @param rrn  �ֹι�ȣ
	 * @return     ����
	 */
	public String toGender(String rrn) {
		String gender="";
		int s;
		
		try {
			if (isRrnCheck(rrn)) {
				throw new IllegalArgumentException("Invalid rrn format: " + rrn);
			}
			
			rrn = rrn.replaceAll("-", "");
			s=Integer.parseInt(rrn.substring(6,7));
			
			gender="����";
			if(s%2==0)
				gender="����";
			
		} catch (IllegalArgumentException e) {
			throw e;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return gender;
	}

}
