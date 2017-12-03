import java.util.Scanner;

public class Main{
  public static void main(String[] args){
    Scanner scan = new Scanner(System.in);

    int num = scan.nextInt();
    int[][] matrix = new int[20][20];
    int curNum = 0;
    int i = 9;
    int j = 9;
    int lado = 3;

    matrix[i][j] = 1;

    while(curNum <= num){
      j += 1;
      curNum = addAndCheck(matrix, i,j, num);

      for(int d=1;d<lado-1;d++){
        i--;
        curNum = addAndCheck(matrix, i,j, num);
      }

      for(int d=1;d<lado;d++){
        j--;
        curNum = addAndCheck(matrix, i,j, num);
      }

      for(int d=1;d<lado;d++){
        i++;
        curNum = addAndCheck(matrix, i,j, num);
      }

      for(int d=1;d<lado;d++){
        j++;
        curNum = addAndCheck(matrix, i,j, num);
      }

      lado += 2;
    }
  }

  public static int sum(int[][] matrix, int i, int j){
    return matrix[i][j-1] + matrix[i][j+1] + matrix[i+1][j-1] + matrix[i+1][j+1] + matrix[i+1][j]
     + matrix[i-1][j-1] + matrix[i-1][j] + matrix[i-1][j+1];
  }

  public static void check(int num, int cur){
    if(cur > num){
      System.out.println(cur);
      System.exit(0);
    }
  }

  public static int addAndCheck(int[][] matrix, int i, int j, int num){
      matrix[i][j] = sum(matrix, i,j);
      check(num, matrix[i][j]);
      return matrix[i][j];
  }
}