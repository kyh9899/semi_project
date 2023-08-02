package com.hm.mvc.common.util;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class EncryptUtil {
	/*
	 * 암호화의 방향성
	 *   1) 단방향 : 암호화된 평문은 다시 복호화 할 수 없는 암호화 방식이다. (SHA2(Secure Hash Algorithm 2), MD5(Message-Digest Algorithm 5)) 
	 *   2) 양방향 : 암호화된 평문을 다시 복호화 할 수 있는 암호화 방식이다.
	 *     2-1) 대칭키(비 공개키) 방식 : 암/복호화에 사용하는 키가 동일하다. (AES(Advanced Encryption Standard), DES(Data Encryption Standard))
	 *        - 장점 : 속도가 빠르다.
	 *        - 단점 : 키를 전달하는 과정에서 노출될 가능성이 높다.(키가 노출되면 끝...)
	 *     2-2) 비 대칭키(공개키) 방식 : 암/복호화에 사용하는 키가 서로 다르다. (RSA)
	 *        - 장점 : 암/복호화 키가 다르기 때문에 전달 과정에서 노출되어도 복호화 할 수 없다.
	 *        - 단점 : 속도가 느리다.
	 *   
	 * SHA2(Secure Hash Algorithm 2)
	 *   1) SHA-256
	 *     - SHA-256은 임의의 길이 메시지를 256비트(32바이트)의 축약된 메시지로 만들어내는 해시 알고리즘이다.
	 *     - 많은 분야에서 채택하여 사용하고 있는 암호화 방식. 출력 속도가 빠르다는 장점을 갖고 있다.
	 *   2) SHA-512
	 *     - SHA-512는 임의의 길이 메시지를 512비트(64바이트)의 축약된 메시지로 만들어내는 해시 알고리즘이다.
	 *   3) 암호화 해시 함수의 안정성을 강화하기 위해 추가로 스트레칭, 솔트 2가지 방법을 사용한다.(궁금하면 찾아보세요^^)
	 * 
	 */
	
	// 단방향 암호화(MD2, MD5, SHA, SHA-1, SHA-256, SHA-512를 지원한다.)
	public static String oneWayEnc(String message, String algorithm) {
		byte[] digest;
		String encMessage = "";
		
		try {
			// 메시지 다이제스트란, 입력 값의 길이에 상관없이 수학적인 연산을 항상 동일한 길이의 해시 값을 만들어낸다.
			MessageDigest md = MessageDigest.getInstance(algorithm);
			
			// 평문(Message)을 byte[] 변환하여 메시지 다이제스트로 전달한다.
			md.update(message.getBytes(Charset.forName("UTF-8")));
			
			// 암호화 형식에 맞게 변경하여 byte[]로 반환하는 메소드이다.
			digest = md.digest();
			
			// Base64를 사용하여 byte 형식의 데이터를 문자열로 Encoding 한다.
			encMessage = Base64.getEncoder().encodeToString(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encMessage;
	}
}