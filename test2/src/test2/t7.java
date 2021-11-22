package test2;

import java.util.*;

public class t7 {
	/*
	 * 출력결과
	 * 
	 * true
       true
       false
       true
	   false
	 * 
	 * Integer, String은 equals()를 오버라이딩하여 참조주소가 아닌 값을 비교한다.
	 * 그러나 StringBuffer는 오버라이딩하지 않기 때문에 참조주소를 비교하여 false가 나온 것이다.
	 * toString()을 사용하여 equals()를 하면 해결된다.
	 * 마찬가지로 Date도 getTime()을 사용하여 참조주소가 아닌 값을 비교하면 해결된다.
	 * 
	 * 
	 * */
	public static void main(String[] args) {
		Integer i1 = new Integer(1);  
		Integer i2 = new Integer(1);  
		  
		String s1 = new String("one");
		String s2 = new String("one");
		  
		StringBuffer sf1 = new StringBuffer("one"); //StringBuffer는 equals에 대한 오버라이딩이 없기때문에 sf1주소 == sf2주소를 비교하게 된다
		StringBuffer sf2 = new StringBuffer("one");
		  
		Date d1 = new Date(); // get메소드로 값을 반환하지 않으면 d1주소 == d4주소를 비교하게 된다.
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

