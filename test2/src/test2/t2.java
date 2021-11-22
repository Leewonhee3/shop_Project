package test2;

import java.util.*;

public class t2 {
	public static void main(String[] args){
	 /*
	  * 컬렉션은 list와 set의 상위 클래스이다.
	  * 이터레이터는 컬렉션의 요소들을 접근할 수 있다.
	  * hasNext - 다음 요소값이 있는 경우 참 아닌경우 거짓 반환
	  * next - 다음 요소값을 반환 
	  * romove - next로 반환된 값을 삭제
	  * 
	  * set은 중복된 값을 제거한다.
	  * 따라서 첫번째 for문에서 set에 저장되는 값은 1,2,9,7,4,6,0이다.
	  *  
	  * set의 값을 리스트에 저장하고 리스트를 오름차순으로 정렬한다.
	  * 단 예제의 set값을 list에 저장할때 해시코드 값에 따라 순서가 정해지므로 정렬하지 않아도 같은 결과가 나온다. 
	  * 셋에 숫자가 아닌 다른 글자를 넣고 정렬하지 않으면 해시코드 값에 따른 순서로 저장되어 출력된다.
	  * {"1", "2","hi", "9", "7", "4", "6", "1", "7", "0"};
	  * 예시로 중간에 hi라는 문자열을 넣으면
	  * 
	  * 정렬했을때와 안했을때의 차이를 알 수 있다.
	  * 
	  * 01hi24679 - sort x
	  * 0124679hi - sort o
	  * 
	  * 만약 list가 set으로 바뀌는 경우 인덱스가 없기 때문에 get으로 값에 접근할 수 없다.
	  * 이터레이터는 list와 set의 상위 클래스인 컬렉션의 값을 접근할 수 있기 때문에 list도 next()를 사용하여 접근이 가능하다.
	  * 
	  * 
	  * 예제의 출력결과는 
	  *  
	  * 0124679
	  * 
	  * 이다.
	  */
		String[] arr = {"1", "2", "9", "7", "4", "6", "1", "7", "0"};
		Set set = new HashSet();
		for(String s:arr){ // 향상된 for문은 이터레이터를 사용한다.
			set.add(s);
		}
  
		List list = new LinkedList(set);
  
		Collections.sort(list); // 컬렉션의 요소를 오름차순한다.
		Iterator it = list.iterator();
  
		while(it.hasNext()){
			System.out.print(it.next());
		}
	}
}
