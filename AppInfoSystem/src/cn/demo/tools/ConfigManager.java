package cn.demo.tools;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//璇诲彇閰嶇疆鏂囦欢鐨勫伐鍏风被-鍗曚緥妯″紡
public class ConfigManager {
	private static ConfigManager configManager = new ConfigManager();
	private static Properties properties;
	//绉佹湁鏋勯�犲櫒-璇诲彇鏁版嵁搴撻厤缃枃浠�
	private ConfigManager(){
		String configFile = "database.properties";
		properties = new Properties();
		InputStream is = 
				ConfigManager.class.getClassLoader().getResourceAsStream(configFile);
		try {
			properties.load(is);
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*//鍏ㄥ眬璁块棶鐐�-(鎳掓眽妯″紡)
	public static synchronized ConfigManager getInstance(){
		if(configManager == null){
			configManager = new ConfigManager();
		}
		return configManager;
	}*/
	
	//楗挎眽妯″紡
	public static ConfigManager getInstance(){
		return configManager;
	}
	
	public String getValue(String key){
		return properties.getProperty(key);
	}
}
