import java.util.Scanner;


public class Main{
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
			
		char[] numbers = scan.nextLine().toCharArray();
		int sum = 0;

		int size = numbers.length;

		for(int i=0;i<size;i++){
			if(numbers[i] == numbers[(i+1) % size]){
				sum += numbers[i] - '0';
			}
		}

		System.out.println(sum);
	}
}
