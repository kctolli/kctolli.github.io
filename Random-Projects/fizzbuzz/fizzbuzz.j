/*

fizzbuzz.j

Copyright 2021 Kyle Tolliver

This program is free software : you can redistribute it and /or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.If not, see < https://www.gnu.org/licenses/>.

*/

public class Main {
  public static void main(String[] args) {
    for (int i = 1; i < 101; i ++) {
      	if (i % 3 == 0 && i % 5 == 0) { System.out.println("FizzBuzz"); }
		else if (i % 3 == 0) { System.out.println("Fizz"); }
		else if (i % 5 == 0) { System.out.println("Buzz"); }
		else { System.out.println(i); }
    }  
  }
}