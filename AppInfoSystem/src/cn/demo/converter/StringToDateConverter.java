package cn.demo.converter;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class StringToDateConverter implements Converter<String,Date>{

	private String dataPattern;
	
	public StringToDateConverter(){}
	public StringToDateConverter(String dataPattern){
		this.dataPattern=dataPattern;
	}
	
	@Override
	public Date convert(String arg0) {
		// TODO Auto-generated method stub
		Date date=null;
		try{
			date=new SimpleDateFormat(dataPattern).parse(arg0);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return date;
	}

}
