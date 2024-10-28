package com.action;

public class TEST {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
  String a = "aabbccbb";  
  String b = "bb";  
  String c = "eeee";  
  while (true) {   
	  int num = a.indexOf(b);   
	  if (num != -1) {    
		  char a_cahr[] = a.toCharArray();    
		  int count = 0;    a = "";    
		  for (int i = 0; i < a_cahr.length; i++) {     
			  if (i >= num && i < num + b.length()) {      
				  if (count == 0) {       
					  a += c;      
					  }      
				  count++;     
				  } else {      
					  a += a_cahr[i];     
					  }    
			  }   
		  } else {    
			  System.out.println("替换后的结果:"+a);    
			  return;   
			  }  
	  } 
  }
	}
