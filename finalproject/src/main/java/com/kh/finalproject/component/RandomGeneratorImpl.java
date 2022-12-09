package com.kh.finalproject.component;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class RandomGeneratorImpl implements RandomGenerator {
	
	private Random r = new Random();

	@Override
	public String generateSerial(int size) {//size는 자리수
		int range = (int)Math.pow(10, size);//제곱 구하는 명령
		int number = r.nextInt(range);
		
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i < size; i++) {
			buffer.append("0");
		}
		
		Format f = new DecimalFormat(buffer.toString());
		String serial = f.format(number);
		return serial;
	}
	
	
}
