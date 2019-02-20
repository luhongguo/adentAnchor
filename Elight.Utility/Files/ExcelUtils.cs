using Elight.Utility.Extension;
using Elight.Utility.Network;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using OfficeOpenXml;
using OfficeOpenXml.Drawing;
using OfficeOpenXml.Style;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NPOI.SS.Converter;
using System.Web;
using Elight.Utility.Log;

namespace Elight.Utility.Files
{
    public class ExcelUtils
    {
        public static string ExcelContentType
        {
            get
            {
                return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            }
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <param name="headDict"></param>
        /// <param name="sheetName"></param>
        /// <returns></returns>
        public static byte[] ExportExcel<T>(List<T> data, Dictionary<string, string> headDict, string sheetName = "", bool showSrNo = false)
        {
            DataTable dt = ListToDataTable<T>(data);
            byte[] result = null;
            List<string> keyList = new List<string>();
            if (showSrNo)
            {
                keyList.Add("RowNum");
                dt.Columns.Add("RowNum");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["RowNum"] = i + 1;
                }

            }
            //通过键的集合取
            foreach (string key in headDict.Keys)
            {
                keyList.Add(key);
            }
            using (ExcelPackage package = new ExcelPackage())
            {
                ExcelWorksheet sheet = package.Workbook.Worksheets.Add(sheetName.IsNullOrEmpty() ? "Sheet1" : sheetName);
                if (showSrNo)
                {
                    headDict.Add("RowNum", "序号");
                }
                for (int i = 0; i < keyList.Count; i++)
                {
                    sheet.Cells[1, i + 1].Value = headDict[keyList[i]];
                }
                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int j = 0; j < keyList.Count; j++)
                        {

                            sheet.Cells[i + 2, j + 1].Value = dt.Rows[i][keyList[j]].ToString();
                        }
                    }
                }
                ExcelRange cells = sheet.Cells[1, 1, 1 + dt.Rows.Count, keyList.Count];
                cells.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                cells.Style.Border.Right.Style = ExcelBorderStyle.Thin;
                cells.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                cells.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                cells.Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;//水平居中
                cells.Style.VerticalAlignment = ExcelVerticalAlignment.Center;//垂直居中
                cells.AutoFitColumns();//自适应列宽
                result = package.GetAsByteArray();
            }
            return result;
        }

        public static DataTable ImportExcel(string filePath)
        {
            DataTable dt = new DataTable();
            using (FileStream fsRead = System.IO.File.OpenRead(filePath))
            {
                IWorkbook wk = null;
                //获取后缀名
                string extension = filePath.Substring(filePath.LastIndexOf(".")).ToString().ToLower();
                //判断是否是excel文件
                if (extension == ".xlsx" || extension == ".xls")
                {
                    //判断excel的版本
                    if (extension == ".xlsx")
                    {
                        wk = new XSSFWorkbook(fsRead);
                    }
                    else
                    {
                        wk = new HSSFWorkbook(fsRead);
                    }

                    //获取第一个sheet
                    ISheet sheet = wk.GetSheetAt(0);
                    //获取第一行
                    IRow headrow = sheet.GetRow(0);
                    //创建列
                    int colCount = headrow.Cells.Count;
                    for (int i = 0; i < headrow.Cells.Count; i++)
                    {
                        DataColumn datacolum = new DataColumn("Col" + (i + 1));
                        dt.Columns.Add(datacolum);
                    }
                    dt.Columns.Add("OrderCode");
                    //读取每行,从第二行起
                    for (int r = 1; r <= sheet.LastRowNum; r++)
                    {
                        DataRow dr = dt.NewRow();
                        //获取当前行
                        IRow row = sheet.GetRow(r);
                        //读取每列
                        for (int j = 0; j < colCount; j++)
                        {
                            ICell cell = row.GetCell(j); //一个单元格
                            dr[j] = GetCellValue(cell); //获取单元格的值
                        }
                        dr["OrderCode"] = r;
                        dt.Rows.Add(dr); //把每行追加到DataTable
                    }
                }

            }
            return dt;
        }

        //对单元格进行判断取值
        private static string GetCellValue(ICell cell)
        {
            if (cell == null)
                return string.Empty;
            switch (cell.CellType)
            {
                case CellType.Blank: //空数据类型 这里类型注意一下，不同版本NPOI大小写可能不一样,有的版本是Blank（首字母大写)
                    return string.Empty;
                case CellType.Boolean: //bool类型
                    return cell.BooleanCellValue.ToString();
                case CellType.Error:
                    return cell.ErrorCellValue.ToString();
                case CellType.Numeric: //数字类型
                    if (HSSFDateUtil.IsCellDateFormatted(cell))//日期类型
                    {
                        return cell.DateCellValue.ToString();
                    }
                    else //其它数字
                    {
                        return cell.NumericCellValue.ToString();
                    }
                case CellType.Unknown: //无法识别类型
                default: //默认类型
                    return cell.ToString();//
                case CellType.String: //string 类型
                    return cell.StringCellValue;
                case CellType.Formula: //带公式类型
                    try
                    {
                        HSSFFormulaEvaluator e = new HSSFFormulaEvaluator(cell.Sheet.Workbook);
                        e.EvaluateInCell(cell);
                        return cell.ToString();
                    }
                    catch
                    {
                        return cell.NumericCellValue.ToString();
                    }
            }
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data">数据</param>
        /// <param name="headDict">头部信息</param>
        /// <param name="imgColumnList">图片列</param>
        /// <param name="sheetName">Sheet名</param>
        /// <param name="showSrNo">是否要加上序号</param>
        /// <returns></returns>
        public static byte[] ExportExcel<T>(List<T> data, Dictionary<string, string> headDict, List<string> imgColumnList, string sheetName = "", bool showSrNo = false)
        {
            if (imgColumnList == null)
            {
                imgColumnList = new List<string>();
            }
            DataTable dt = ListToDataTable<T>(data);
            byte[] result = null;
            List<string> keyList = new List<string>();
            if (showSrNo)
            {
                keyList.Add("RowNum");
                dt.Columns.Add("RowNum");
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i]["RowNum"] = i + 1;
                }

            }
            //通过键的集合取
            foreach (string key in headDict.Keys)
            {
                keyList.Add(key);
            }
            IWorkbook workbook = new XSSFWorkbook();
            //设置宽度
            ICellStyle style = workbook.CreateCellStyle();
            style.BorderBottom = BorderStyle.Thin;
            style.BorderLeft = BorderStyle.Thin;
            style.BorderRight = BorderStyle.Thin;
            style.BorderTop = BorderStyle.Thin;
            style.VerticalAlignment = VerticalAlignment.Center;//垂直居中
            style.Alignment = HorizontalAlignment.Center;//水平对齐;

            if (showSrNo)
            {
                headDict.Add("RowNum", "序号");
            }
            ISheet sheet = sheetName.IsNullOrEmpty() ? workbook.CreateSheet("Sheet1") : workbook.CreateSheet(sheetName);
            //表头  
            IRow row = sheet.CreateRow(0);
            for (int i = 0; i < keyList.Count; i++)
            {
                ICell cell = row.CreateCell(i);
                cell.SetCellValue(headDict[keyList[i]]);
                cell.CellStyle = style;
            }
            //数据  
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                IRow row1 = sheet.CreateRow(i + 1);
                for (int j = 0; j < keyList.Count; j++)
                {
                    if (imgColumnList.Contains(keyList[j]))
                    {
                        //插入图片
                        byte[] bytes = HttpMethods.GetImage(dt.Rows[i][keyList[j]].ToString());
                        if (bytes != null)
                        {
                            ICell cell = row1.CreateCell(j);
                            cell.CellStyle = style;
                            try
                            {
                                int pictureIdx = workbook.AddPicture(bytes, NPOI.SS.UserModel.PictureType.PNG);
                                IDrawing patriarch = sheet.CreateDrawingPatriarch();
                                XSSFClientAnchor anchor = new XSSFClientAnchor(0, 0, 100, 100, j, i + 1, j + 1, i + 2);
                                //##处理照片位置，【图片左上角为（col, row）第row+1行col+1列，右下角为（ col +1, row +1）第 col +1+1行row +1+1列，宽为100，高为50
                                XSSFPicture pict = (XSSFPicture)patriarch.CreatePicture(anchor, pictureIdx);
                            }
                            catch
                            {
                                cell.SetCellValue(dt.Rows[i][keyList[j]].ToString());
                            }
                        }
                    }
                    else
                    {
                        ICell cell = row1.CreateCell(j);
                        cell.SetCellValue(dt.Rows[i][keyList[j]].ToString());
                        cell.CellStyle = style;
                    }
                }
            }
            //自适应列宽
            for (int i = 0; i < keyList.Count; i++)
            {
                sheet.AutoSizeColumn(i, true);
            }
            using (MemoryStream ms = new MemoryStream())
            {
                workbook.Write(ms);
                result = ms.GetBuffer();
                ms.Close();
            };
            return result;
        }



        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="dataTable">数据源</param>
        /// <param name="heading">工作簿Worksheet</param>
        /// <param name="showSrNo">//是否显示行编号</param>
        /// <param name="columnsToTake">要导出的列</param>
        /// <returns></returns>
        public static byte[] ExportExcel(DataTable dataTable, string heading = "", bool showSrNo = false, params string[] columnsToTake)
        {
            byte[] result = null;
            using (ExcelPackage package = new ExcelPackage())
            {
                ExcelWorksheet workSheet = package.Workbook.Worksheets.Add(string.Format("{0}Data", heading));
                int startRowFrom = string.IsNullOrEmpty(heading) ? 1 : 3; //开始的行
                                                                          //是否显示行编号
                if (showSrNo)
                {
                    DataColumn dataColumn = dataTable.Columns.Add("#", typeof(int));
                    dataColumn.SetOrdinal(0);
                    int index = 1;
                    foreach (DataRow item in dataTable.Rows)
                    {
                        item[0] = index;
                        index++;
                    }
                }
                //Add Content Into the Excel File
                workSheet.Cells["A" + startRowFrom].LoadFromDataTable(dataTable, true);
                // autofit width of cells with small content 
                int columnIndex = 1;
                foreach (DataColumn item in dataTable.Columns)
                {
                    ExcelRange columnCells = workSheet.Cells[workSheet.Dimension.Start.Row, columnIndex, workSheet.Dimension.End.Row, columnIndex];
                    int maxLength = columnCells.Max(cell => cell.Value.ToString().Count());
                    if (maxLength < 150)
                    {
                        workSheet.Column(columnIndex).AutoFit();
                    }
                    columnIndex++;
                }
                // format header - bold, yellow on black 
                using (ExcelRange r = workSheet.Cells[startRowFrom, 1, startRowFrom, dataTable.Columns.Count])
                {
                    r.Style.Font.Color.SetColor(System.Drawing.Color.White);
                    r.Style.Font.Bold = true;
                    r.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    r.Style.Fill.BackgroundColor.SetColor(System.Drawing.ColorTranslator.FromHtml("#1fb5ad"));
                }
                // format cells - add borders 
                using (ExcelRange r = workSheet.Cells[startRowFrom + 1, 1, startRowFrom + dataTable.Rows.Count, dataTable.Columns.Count])
                {
                    r.Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    r.Style.Border.Right.Style = ExcelBorderStyle.Thin;

                    r.Style.Border.Top.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Bottom.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Left.Color.SetColor(System.Drawing.Color.Black);
                    r.Style.Border.Right.Color.SetColor(System.Drawing.Color.Black);
                }
                // removed ignored columns 
                for (int i = dataTable.Columns.Count - 1; i >= 0; i--)
                {
                    if (i == 0 && showSrNo)
                    {
                        continue;
                    }
                    if (!columnsToTake.Contains(dataTable.Columns[i].ColumnName))
                    {
                        workSheet.DeleteColumn(i + 1);
                    }
                }
                if (!String.IsNullOrEmpty(heading))
                {
                    workSheet.Cells["A1"].Value = heading;
                    workSheet.Cells["A1"].Style.Font.Size = 20;

                    workSheet.InsertColumn(1, 1);
                    workSheet.InsertRow(1, 1);
                    workSheet.Column(1).Width = 5;
                }
                result = package.GetAsByteArray();
            }
            return result;
        }
        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <param name="heading"></param>
        /// <param name="isShowSlNo"></param>
        /// <param name="ColumnsToTake"></param>
        /// <returns></returns>
        public static byte[] ExportExcel<T>(List<T> data, string heading = "", bool isShowSlNo = false, params string[] ColumnsToTake)
        {
            return ExportExcel(ListToDataTable<T>(data), heading, isShowSlNo, ColumnsToTake);
        }


        /// <summary>
        /// List转DataTable
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <returns></returns>
        public static DataTable ListToDataTable<T>(List<T> data)
        {
            PropertyDescriptorCollection properties = TypeDescriptor.GetProperties(typeof(T));
            System.Data.DataTable dataTable = new DataTable();
            for (int i = 0; i < properties.Count; i++)
            {
                PropertyDescriptor property = properties[i];
                dataTable.Columns.Add(property.Name, Nullable.GetUnderlyingType(property.PropertyType) ?? property.PropertyType);
            }
            object[] values = new object[properties.Count];
            foreach (T item in data)
            {
                for (int i = 0; i < values.Length; i++)
                {
                    values[i] = properties[i].GetValue(item);
                }
                dataTable.Rows.Add(values);
            }
            return dataTable;
        }

        public static object lockObj = new object();

        public static string Excel2html(HttpRequestBase request, string strFile)
        {
            //资源锁，为了保证该资源只能存在一个
            lock (lockObj)
            {
                string temp = request.MapPath("/Uploads/Temp/");
                temp = temp.Replace("\\", "/");
                if (!temp.EndsWith("/")) temp += "/";
                temp = temp + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls";
                temp = temp.Replace("/", "\\");
                //将strFile另存为xls  可能为旧版的xls  也可能是xlsx  统一转成03 xp版的xls文件
                try
                {
                    object oMissing = Type.Missing;
                    var app = new Microsoft.Office.Interop.Excel.Application();
                    var wb = app.Workbooks.Open(strFile, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing, oMissing);
                    wb.CheckCompatibility = false;
                    app.DisplayAlerts = false;
                    wb.DoNotPromptForConvert = true;
                    wb.SaveAs(temp, Microsoft.Office.Interop.Excel.XlFileFormat.xlExcel8, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                    app.Quit();
                    //垃圾回收 
                    //GC.Collect();
                    //System.Runtime.InteropServices.Marshal.ReleaseComObject(wb);
                    //wb = null;
                    //GC.Collect();
                    //依据时间杀灭进程
                    System.Diagnostics.Process[] process = System.Diagnostics.Process.GetProcessesByName("EXCEL");
                    foreach (System.Diagnostics.Process p in process)
                    {
                        LogHelper.WriteLog("正在关闭Excel");
                        p.Kill();
                    }
                    GC.Collect();
                }
                //转换失败
                catch (Exception ex)
                {
                    LogHelper.WriteLog("1");
                    LogHelper.WriteLog(ex.Message);
                    try { File.Delete(temp); } catch { }
                    return "";
                }
                //文档转换成功，利用NPOI将Excel转为html
                string html = "";
                try
                {
                    HSSFWorkbook workbook = ExcelToHtmlUtils.LoadXls(temp);
                    ExcelToHtmlConverter excelToHtmlConverter = new ExcelToHtmlConverter();
                    excelToHtmlConverter.OutputColumnHeaders = false;
                    excelToHtmlConverter.OutputHiddenColumns = false;
                    excelToHtmlConverter.OutputHiddenRows = false;
                    excelToHtmlConverter.OutputLeadingSpacesAsNonBreaking = false;
                    excelToHtmlConverter.OutputRowNumbers = false;
                    excelToHtmlConverter.UseDivsToSpan = false;
                    //excelToHtmlConverter.ProcessWorkbook(workbook);
                    // 处理的Excel文件
                    excelToHtmlConverter.ProcessWorkbook(workbook);
                    //添加表格样式
                    excelToHtmlConverter.Document.InnerXml =
                        excelToHtmlConverter.Document.InnerXml.Insert(
                            excelToHtmlConverter.Document.InnerXml.IndexOf("<head>", 0) + 6,
                            @"<style>table, td, th{border:1px solid green;}th{background-color:green;color:white;}</style>"
                        );
                    //方法一
                    html = excelToHtmlConverter.Document.InnerXml;
                }
                catch (Exception exp)
                {
                    LogHelper.WriteLog("2");
                    LogHelper.WriteLog(exp.Message);
                    html = "";
                }
                finally
                {
                    //没问题，最后将临时文件删除
                    try { File.Delete(temp); } catch { }
                }
                return html;
            }
        }


        public static string Excel2html2(string strFile)
        {
            //资源锁，为了保证该资源只能存在一个
            lock (lockObj)
            {
                //文档转换成功，利用NPOI将Excel转为html
                string html = "";
                try
                {
                    HSSFWorkbook workbook = ExcelToHtmlUtils.LoadXls(strFile);
                    ExcelToHtmlConverter excelToHtmlConverter = new ExcelToHtmlConverter();
                    excelToHtmlConverter.OutputColumnHeaders = false;
                    excelToHtmlConverter.OutputHiddenColumns = false;
                    excelToHtmlConverter.OutputHiddenRows = false;
                    excelToHtmlConverter.OutputLeadingSpacesAsNonBreaking = false;
                    excelToHtmlConverter.OutputRowNumbers = false;
                    excelToHtmlConverter.UseDivsToSpan = false;
                    // 处理的Excel文件
                    excelToHtmlConverter.ProcessWorkbook(workbook);
                    //添加表格样式
                    excelToHtmlConverter.Document.InnerXml =
                        excelToHtmlConverter.Document.InnerXml.Insert(
                            excelToHtmlConverter.Document.InnerXml.IndexOf("<head>", 0) + 6,
                            @"<style>table, td, th{border:1px solid green;}th{background-color:green;color:white;}</style>"
                        );
                    //方法一
                    html = excelToHtmlConverter.Document.InnerXml;
                    html += @"<style>tr:nth-of-type(1){background: #fcf;white-space: no-wrap;}</style>";
                    html += @"<script>var col = document.getElementsByTagName('col');for(i=0;i<col.length;i++){col[i].setAttribute('width','70');}</script>";
                }
                catch
                {
                    html = "";
                }
                return html;
            }
        }

        public static string Excel2html3(string strFile)
        {
            //资源锁，为了保证该资源只能存在一个
            lock (lockObj)
            {
                //文档转换成功，利用NPOI将Excel转为html
                string html = "";
                try
                {
                    HSSFWorkbook workbook = ExcelToHtmlUtils.LoadXls(strFile);
                    ExcelToHtmlConverter excelToHtmlConverter = new ExcelToHtmlConverter();
                    excelToHtmlConverter.OutputColumnHeaders = false;
                    excelToHtmlConverter.OutputHiddenColumns = false;
                    excelToHtmlConverter.OutputHiddenRows = false;
                    excelToHtmlConverter.OutputLeadingSpacesAsNonBreaking = false;
                    excelToHtmlConverter.OutputRowNumbers = false;
                    excelToHtmlConverter.UseDivsToSpan = false;
                    // 处理的Excel文件
                    excelToHtmlConverter.ProcessWorkbook(workbook);
                    //添加表格样式
                    excelToHtmlConverter.Document.InnerXml =
                        excelToHtmlConverter.Document.InnerXml.Insert(
                            excelToHtmlConverter.Document.InnerXml.IndexOf("<head>", 0) + 6,
                            @"<style>table, td, th{border:1px solid green;}th{background-color:green;color:white;}</style>"
                        );
                    //方法一
                    html = excelToHtmlConverter.Document.InnerXml;
                    html += @"<style>tr:nth-of-type(1){background: #fcf;white-space: no-wrap;}</style>";
                    html += @"<script>var col = document.getElementsByTagName('col');for(i=0;i<col.length;i++){col[i].setAttribute('width','220');}</script>";
                }
                catch
                {
                    html = "";
                }
                return html;
            }
        }
    }
}
