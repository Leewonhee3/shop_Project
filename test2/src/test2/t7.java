package test2;

import java.util.*;

public class t7 {
	/*
	 * ��°��
	 * 
	 * true
       true
       false
       true
	   false
	 * 
	 * Integer, String�� equals()�� �������̵��Ͽ� �����ּҰ� �ƴ� ���� ���Ѵ�.
	 * �׷��� StringBuffer�� �������̵����� �ʱ� ������ �����ּҸ� ���Ͽ� false�� ���� ���̴�.
	 * toString()�� ����Ͽ� equals()�� �ϸ� �ذ�ȴ�.
	 * ���������� Date�� getTime()�� ����Ͽ� �����ּҰ� �ƴ� ���� ���ϸ� �ذ�ȴ�.
	 * 
	 * 
	 * */
	public static void main(String[] args) {
		Integer i1 = new Integer(1);  
		Integer i2 = new Integer(1);  
		  
		String s1 = new String("one");
		String s2 = new String("one");
		  
		StringBuffer sf1 = new StringBuffer("one"); //StringBuffer�� equals�� ���� �������̵��� ���⶧���� sf1�ּ� == sf2�ּҸ� ���ϰ� �ȴ�
		StringBuffer sf2 = new StringBuffer("one");
		  
		Date d1 = new Date(); // get�޼ҵ�� ���� ��ȯ���� ������ d1�ּ� == d4�ּҸ� ���ϰ� �ȴ�.
		Date d2 = new GregorianCalendar(2011, 7, 15).getTime();
		Date d3 = new GregorianCalendar(2011, 7, 15).getTime();
		Date d4 = new Date();
		  
		System.out.println(i1.equals(i2));
		System.out.println(s1.equals(s2));
		System.out.println(sf1.toString().equals(sf2.toString()));
		System.out.println(d2.equals(d3));
		System.out.println(d1.equals(d4));
		
	}
	
}

