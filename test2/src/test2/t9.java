package test2;

import java.util.*;

public class t9 {
//	public static void main(String[] args){
//		  new Second().test();
//		 }
//		 class Second extends t9{
//		  void test(){
//		   System.out.println("test");
//		  }
//		 }
//		}

	
/*
 * 4.컴파일 후 실행시 "210/012"를 출력한다.
 * 
 * 
 * */	
	
	public static void main(String[] args){
		  Stack st = new Stack();
		  Queue q = new LinkedList(); 
		  
		  st.push("0");
		  st.push("1");
		  st.push("2");

		  q.offer("0");
		  q.offer("1");
		  q.offer("2");

		  while(!st.empty()) {
		   System.out.print(st.pop());
		  }
		  System.out.print("/");
		  while(!q.isEmpty()) {
		   System.out.print(q.poll());
		  }
		 }
		}
