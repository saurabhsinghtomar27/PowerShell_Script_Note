package JDBC;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
public class leetcode {
    public static void main(String args[]){
        String str="Geeks for Geeks";
        String arr[]=str.split(" ");
        
        // String arr[]=str.split(" ");
        List<String> ls=Arrays.stream(arr).skip(arr.length-1).collect(Collectors.toList());
      System.out.println(ls.get(0).length());
       
    }
}
