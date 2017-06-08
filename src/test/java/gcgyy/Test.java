package gcgyy;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFShape;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class Test {
	
	private DecimalFormat df = new DecimalFormat("0");  
	
	HashMap<String, HSSFPictureData> picMap = new HashMap<>();

	public static void main(String[] args) throws Exception {
		Test test = new Test();
		test.execute();
	}

	private HSSFWorkbook workbook;
	
	public void execute() throws Exception {

		File file = new File("H:\\昌诺.xls");
		workbook = new HSSFWorkbook(new FileInputStream(file));
		HSSFSheet sheet = workbook.getSheetAt(2);
		
		// 获取所有图片
		List<HSSFPictureData> pictures = workbook.getAllPictures();
		for (HSSFShape shape: sheet.getDrawingPatriarch().getChildren()) {
			HSSFClientAnchor anchor = (HSSFClientAnchor) shape.getAnchor();
			
			if (shape instanceof HSSFPicture) {
				HSSFPicture pic = (HSSFPicture) shape;
				String location = anchor.getRow1() + "-" + anchor.getCol1();
				
				int pictureIndex = pic.getPictureIndex() - 1;
				HSSFPictureData picData = pictures.get(pictureIndex);
				
				picMap.put(location, picData);
			}
		}
		
		HSSFCell cell = null;

		// 企业名称
		cell = sheet.getRow(1).getCell(1);
		if (cell != null) {
			String name = cell.getStringCellValue();
			System.out.println("企业名称-->" + name);
		}

		// 企业地址
		cell = sheet.getRow(2).getCell(1);
		if (cell != null) {
			String address = cell.getStringCellValue();
			System.out.println("企业地址-->" + address);
		}

		// 所属区域
		cell = sheet.getRow(3).getCell(1);
		if (cell != null) {
			String area = cell.getStringCellValue();
			System.out.println("所属区域-->" + area);
		}

		// 主要产品
		cell = sheet.getRow(4).getCell(1);
		if (cell != null) {
			String mainProduct = cell.getStringCellValue();
			System.out.println("主要产品-->" + mainProduct);
		}

		// 产业类别
		cell = sheet.getRow(5).getCell(1);
		if (cell != null) {
			String type = cell.getStringCellValue();
			System.out.println("产业类别-->" + type);
		}

		// 投产时间
		cell = sheet.getRow(6).getCell(1);
		if (cell != null) {
			Date date = cell.getDateCellValue();
			System.out.println("投产时间-->" + date);
		}

		// 企业负责人
		cell = sheet.getRow(7).getCell(1);
		if (cell != null) {
			String principal = cell.getStringCellValue();
			System.out.println("企业负责人-->" + principal);
		}

		// 企业联系人
		cell = sheet.getRow(8).getCell(1);
		if (cell != null) {
			String user = cell.getStringCellValue();
			System.out.println("企业联系人-->" + user);
		}

		// 联系电话
		cell = sheet.getRow(9).getCell(1);
		if (cell != null) {
			String telephone = null;
			if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
				telephone = df.format(cell.getNumericCellValue());
			} else {
				telephone = cell.getStringCellValue();
			}
			System.out.println("联系电话-->" + telephone);
		}

		// 企业法人
		cell = sheet.getRow(10).getCell(1);
		if (cell != null) {
			String representative = cell.getStringCellValue();
			System.out.println("企业法人-->" + representative);
		}

		// 主要股东
		cell = sheet.getRow(11).getCell(1);
		if (cell != null) {
			String shareholder = cell.getStringCellValue();
			System.out.println("主要股东-->" + shareholder);
		}

		// 注册资金
		cell = sheet.getRow(12).getCell(1);
		if (cell != null) {
			String temp = cell.getStringCellValue();
			temp = temp.replaceAll("万元", "").replaceAll("万", "");
			Double registeredCapital = Double.valueOf(temp);
			System.out.println("注册资金-->" + registeredCapital);
		}

		// 主要变更记录
		cell = sheet.getRow(13).getCell(1);
		if (cell != null) {
			String alterRecording = cell.getStringCellValue();
			System.out.println("主要变更记录-->" + alterRecording);
		}

		// 挂点人
		cell = sheet.getRow(14).getCell(1);
		if (cell != null) {
			String pointUser = cell.getStringCellValue();
			System.out.println("挂点人-->" + pointUser);
		}

		// 国税识别码
		cell = sheet.getRow(15).getCell(1);
		if (cell != null) {
			String nationalTaxNumber = cell.getStringCellValue();
			System.out.println("国税识别码-->" + nationalTaxNumber);
		}

		// 国税纳税人名称
		cell = sheet.getRow(16).getCell(1);
		if (cell != null) {
			String nationalTaxUser = cell.getStringCellValue();
			System.out.println("国税纳税人名称-->" + nationalTaxUser);
		}

		// 地税识别码
		cell = sheet.getRow(17).getCell(1);
		if (cell != null) {
			String localTaxNumber = cell.getStringCellValue();
			System.out.println("地税识别码-->" + localTaxNumber);
		}

		// 地税纳税人名称
		cell = sheet.getRow(18).getCell(1);
		if (cell != null) {
			String localTaxUser = cell.getStringCellValue();
			System.out.println("地税纳税人名称-->" + localTaxUser);
		}

		// 企业产品
		HSSFRow row = sheet.getRow(21);
		for (int k = 1; k < row.getLastCellNum(); k++) {
			// 产品名称
			cell = sheet.getRow(21).getCell(k);
			if (cell != null) {
				String name = cell.getStringCellValue();
				System.out.println("产品名称-->" + name);
			}
			
			// 产品图片
			String location = "22-" + k;
			HSSFPictureData pic = picMap.get(location);
			
			if (pic != null) {
				String ext = pic.suggestFileExtension();
				byte[] data = pic.getData();
				
				String filepath = "H:\\" + k;
				
				switch (ext) {
				case "jpeg":
					filepath += ".jpg";
					break;
				case "png":
					filepath += ".png";
					break;
				default: 
					
					break;
				}
				
				FileOutputStream out = new FileOutputStream(filepath);  
	            out.write(data);  
	            out.close();
			}
			
			// 联系电话
			cell = sheet.getRow(23).getCell(k);
			if (cell != null) {
				String telephone = null;
				if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
					telephone = df.format(cell.getNumericCellValue());
				} else {
					telephone = cell.getStringCellValue();
				}
				System.out.println("联系电话-->" + telephone);
			}
			
			// 规格参数
			cell = sheet.getRow(24).getCell(k);
			if (cell != null) {
				String specification = cell.getStringCellValue();
				System.out.println("规格参数-->" + specification);
			}
			
			// 产品介绍
			cell = sheet.getRow(25).getCell(k);
			if (cell != null) {
				String introduction = cell.getStringCellValue();
				System.out.println("产品介绍-->" + introduction);
			}
		}
		
	}
}
