package crypt;
import javax.swing.*;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Random ;


public class AES {
	byte[] skey = new byte[1000];
	String skeyString;
	static byte[] raw;
	static byte key[]=null;
	
	static byte data[]=null;
	String inputMessage,encryptedData,decryptedMessage;

	public AES() {
		/*try {
		generateSymmetricKey();

		inputMessage="sajid";
		byte[] ibyte = inputMessage.getBytes();
		byte[] ebyte=encrypt(raw, ibyte);
		String encryptedData = new String(ebyte);
		System.out.println("Encrypted message "+encryptedData);
		JOptionPane.showMessageDialog(null,"Encrypted Data "+"\n"+encryptedData);

		byte[] dbyte= decrypt(raw,ebyte);
		String decryptedMessage = new String(dbyte);
		System.out.println("Decrypted message "+decryptedMessage);

		JOptionPane.showMessageDialog(null,"Decrypted Data "+"\n"+decryptedMessage);
		}
		catch(Exception e) {
			System.out.println(e);
		}*/

	}
    public static byte[]  generateSymmetricKey() {
		byte[] knumb=null;
        try {
			Random r = new Random();
			int num = r.nextInt(10000);
			String knum = String.valueOf(num);
            knumb = knum.getBytes();
		   //skey=getRawKey(knumb);
           // skey=getRawKey(knum);
            //skeyString = new String(skey);
//System.out.println("AESSymmetric key = "+skeyString);
        }
        catch(Exception e) {
            System.out.println(e);
        }return knumb;
    }
    public static byte[] getRawKey(byte[] seed) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seed);
        kgen.init(128, sr); // 
        SecretKey skey = kgen.generateKey();
        raw = skey.getEncoded();
        return raw;
    }
    public static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

     public static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }


	public void  setKey(byte[] key){
	this.key=key;
	System.out.print("key="+key);
                            }
public  void setData(byte[] data){

	this.data=data;

}
public  byte[] getKey(){
	System.out.print("key="+key);
	return key;
	}
public  byte[] getData(){
	return this.data;
}

}
