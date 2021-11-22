package test2;

public class t1 {
	/*
	 * 행렬 곱셈을 하는 코드이다.
	 * 행렬 x와 y를 곱하기 위해서는 x의 열과 y의 행의 길이가 같아야 한다.
	 * 만약 같지 않은경우 IllegalArgumentException 예외를 발생시킨다.
	 * 같으면 각 성분들을 곱한 값을 result에 합산하고 반환하여 z에 저장한다. 
	 * {12+18+24, 21+6+3}
	 * {20+81+64, 35+27+8}
	 * 
	 * print 메소드에 z를 파라미터로 넘기면 2 by 2행렬을 출력한다.
	 * {54,30,}
	 * {165,70,}
	 * 
	 * 
	 * */
	public static void main(String[] args){
		int x[][] = {{3, 2, 3},{5, 9, 8}};
		int y[][] = {{4, 7},{9, 3},{8, 1}};
		  
		int z[][] = Matrix.multiply(x, y);

		Matrix.print(z);
	}
}

	class Matrix{
		public static int[][] multiply(int[][] m1, int[][] m2){
		int m1Rows = m1.length;
		int m1Cols = m1[0].length;
		int m2Rows = m2.length;
		int m2Cols = m2[0].length;
			  
		if(m1Cols != m2Rows){
			throw new IllegalArgumentException();
		}  
			  
		int[][] result = new int[m1Rows][m2Cols];
			  
		for(int i=0; i<m1Rows; i++){
			for(int j=0; j<m2Cols; j++){
				for(int k=0; k<m1Cols; k++){
					result[i][j] += m1[i][k]*m2[k][j]; // 2 by 2가 저장됨
			    }
			}
		}
		return result;
	}
		 
		public static void print(int[][] a){
			int rows = a.length; //2
			int cols = a[0].length; //2
			for(int i=0; i<rows; i++){
				System.out.print("{");
				for(int j=0; j<cols; j++){
					System.out.print(a[i][j]+",");
				}
				System.out.println("}");
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
//	public static void main(String[] args){
//		final int SUN =1;
//		final int MON =2;
//		final int TUE =3;
//		final int WED =4;
//		final int THU =5;
//		final int FRI =6;
//		final int SAT =7;
//		
//		/*
//		 * final 변수는 처음 초기화된 값을 변경할 수 없다 즉 상수값이 된다.
//		 * 객체 변수에 사용하는 경우 초기화 되면 다른 객체를 생성하여 변경할 수 없다. 
//		 * 메소드의 파라미터에 사용하는 경우 메소드 안에서 파라미터를 변경할 수 없다.
//		 * 이외에도 메소드나 클래스에 final을 사용하면 오버라이드나 상속이 되지 않는다. 
//		 *
//		 */
//		
//		int start = 1; // 시작일자
//		int end = 31; // 끝 일자
//		int startWeek = THU; // 일자가 시작되는 위치
//		System.out.println(" SU MO TU WE TH FR SA"); // 월화수목금토일 출력
//		  
//		for(int i=1; i<startWeek; i++){ // 1 보다 5(THU)가 큰 경우 반복한다. 총 4번 반복되고 다음 for문 실행시 1이 TH 부터 출력된다.
//			System.out.print("   "); //"공백3칸"
//		}
//		  
//		for(int i=start, n=startWeek ; i <= end; i++, n++) { // i 보다 31이 크거나 같을경우 즉 1부터 31까지 1씩 증가하며 반복된다.
//			// n은 일자가 출력되는 위치이고 출력될때마다 1씩 증가된다. 
//			System.out.print((i < 10)? " 0"+i : " "+i); //(i < 10)? "공백두칸"+i : "공백한칸"+i 
//		    if(n%7==0) System.out.println(); // n이 나머지가 0인 경우 해당일자가 토요일(SA)이므로 줄바꿈한다. 
//		}
//	}}

