package test2;

public class t1 {
	/*
	 * ��� ������ �ϴ� �ڵ��̴�.
	 * ��� x�� y�� ���ϱ� ���ؼ��� x�� ���� y�� ���� ���̰� ���ƾ� �Ѵ�.
	 * ���� ���� ������� IllegalArgumentException ���ܸ� �߻���Ų��.
	 * ������ �� ���е��� ���� ���� result�� �ջ��ϰ� ��ȯ�Ͽ� z�� �����Ѵ�. 
	 * {12+18+24, 21+6+3}
	 * {20+81+64, 35+27+8}
	 * 
	 * print �޼ҵ忡 z�� �Ķ���ͷ� �ѱ�� 2 by 2����� ����Ѵ�.
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
					result[i][j] += m1[i][k]*m2[k][j]; // 2 by 2�� �����
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
//		 * final ������ ó�� �ʱ�ȭ�� ���� ������ �� ���� �� ������� �ȴ�.
//		 * ��ü ������ ����ϴ� ��� �ʱ�ȭ �Ǹ� �ٸ� ��ü�� �����Ͽ� ������ �� ����. 
//		 * �޼ҵ��� �Ķ���Ϳ� ����ϴ� ��� �޼ҵ� �ȿ��� �Ķ���͸� ������ �� ����.
//		 * �̿ܿ��� �޼ҵ峪 Ŭ������ final�� ����ϸ� �������̵峪 ����� ���� �ʴ´�. 
//		 *
//		 */
//		
//		int start = 1; // ��������
//		int end = 31; // �� ����
//		int startWeek = THU; // ���ڰ� ���۵Ǵ� ��ġ
//		System.out.println(" SU MO TU WE TH FR SA"); // ��ȭ��������� ���
//		  
//		for(int i=1; i<startWeek; i++){ // 1 ���� 5(THU)�� ū ��� �ݺ��Ѵ�. �� 4�� �ݺ��ǰ� ���� for�� ����� 1�� TH ���� ��µȴ�.
//			System.out.print("   "); //"����3ĭ"
//		}
//		  
//		for(int i=start, n=startWeek ; i <= end; i++, n++) { // i ���� 31�� ũ�ų� ������� �� 1���� 31���� 1�� �����ϸ� �ݺ��ȴ�.
//			// n�� ���ڰ� ��µǴ� ��ġ�̰� ��µɶ����� 1�� �����ȴ�. 
//			System.out.print((i < 10)? " 0"+i : " "+i); //(i < 10)? "�����ĭ"+i : "������ĭ"+i 
//		    if(n%7==0) System.out.println(); // n�� �������� 0�� ��� �ش����ڰ� �����(SA)�̹Ƿ� �ٹٲ��Ѵ�. 
//		}
//	}}

