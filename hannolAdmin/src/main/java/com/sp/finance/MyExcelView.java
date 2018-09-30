package com.sp.finance;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

@SuppressWarnings("unchecked")
@Service("excelView")
public class MyExcelView extends AbstractXlsxView {
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest req,
			HttpServletResponse resp) throws Exception {
		String filename = (String) model.get("filename");
		for (int i = 1; i <= 4; i++) {
			String sheetName = (String) model.get("sheetName" + i);

			List<String> columnLabels = (List<String>) model.get("columnLabels");
			List<Object[]> columnValues = (List<Object[]>) model.get("columnValues"+i);

			resp.setContentType("application/msexcel");
			resp.setHeader("Content-disposition", "attachment; filename=" + filename);

			Sheet sheet = createSheet(workbook, i-1, sheetName);
			createColumnLabel(workbook, sheet, columnLabels);
			createColumnValue(sheet, columnValues);
		}
	}

	// sheet 생성
	/**
	 * @param workbook
	 * @param sheetIx
	 *            : 쉬트 인덱스(0부터 시작)
	 * @param sheetName
	 * @return
	 */
	private Sheet createSheet(Workbook workbook, int sheetIx, String sheetName) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(sheetIx, sheetName);
		// sheet.setColumnWidth(1, 256*20); // 컬럼폭
		return sheet;
	}

	// 제목(첫번째 row)
	private void createColumnLabel(Workbook workbook, Sheet sheet, List<String> columnLabels) {
		Row labelRow = sheet.createRow(0);

		Cell cell = null;
		for (int idx = 0; idx < columnLabels.size(); idx++) {
			sheet.setColumnWidth(idx, 256 * 15); // 컬럼폭

			cell = labelRow.createCell(idx);
			cell.setCellValue(columnLabels.get(idx));

		}
	}

	// 내용(두번째 row 부터)
	private void createColumnValue(Sheet sheet, List<Object[]> columnValues) {
		Row row;
		Cell cell;

		for (int idx = 0; idx < columnValues.size(); idx++) {
			row = sheet.createRow(idx + 1);

			Object[] values = columnValues.get(idx);
			for (int col = 0; col < values.length; col++) {
				cell = row.createCell(col);
				if (values[col] instanceof Short)
					cell.setCellValue((Short) values[col]);
				else if (values[col] instanceof Integer)
					cell.setCellValue((Integer) values[col]);
				else if (values[col] instanceof Long)
					cell.setCellValue((Long) values[col]);
				else if (values[col] instanceof Float)
					cell.setCellValue((Float) values[col]);
				else if (values[col] instanceof Double)
					cell.setCellValue((Double) values[col]);
				else if (values[col] instanceof Character)
					cell.setCellValue((Character) values[col]);
				else if (values[col] instanceof Boolean)
					cell.setCellValue((Boolean) values[col]);
				else if (values[col] instanceof String)
					cell.setCellValue((String) values[col]);
				else
					cell.setCellValue(values[col].toString());
			}
		}
	}
}
