package com.v5b7.web.sqlExport.web;


import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.v5b7.web.sqlExport.utils.ExportUtil;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sqlExport")
public class sqlExportController {

    // @RequestMapping(value="/csv",method={RequestMethod.GET, RequestMethod.POST},produces = "application/json; charset=utf-8")
    @RequestMapping(value="/csvtest",method={RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public void exportSqlToCSVTest(HttpServletResponse response) {
        List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
        String sTitle = "投资日期,订单号,姓名,购买产品,金额,状态";
        String fName = "sql_";
        String mapKey = "createDate,no,realname,productName,money,state";
        // dataList = new ArrayList<>();
        Map<String, Object> map = null;
        map = new HashMap<String, Object>();
        map.put("createDate", "test1");
        map.put("no", "test2");
        map.put("realname", "test3");
        map.put("productName", "test4");
        map.put("money", "test5");
        map.put("state", "test6");
        dataList.add(map);
        try {
            final OutputStream os = response.getOutputStream();
            ExportUtil.responseSetProperties(fName, response);
            ExportUtil.doExport(dataList, sTitle, mapKey, os);
            return;
        } catch (Exception e) {
        }
    }

    @RequestMapping(value="/csv",method={RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public void exportSqlToCSV(HttpServletResponse response) {
        List<Map<String, Object>> dataList= new ArrayList<Map<String,Object>>();
        String sTitle = "投资日期,订单号,姓名,购买产品,金额,状态";
        String fName = "sql_";
        String mapKey = "createDate,no,realname,productName,money,state";
        // dataList = new ArrayList<>();
        Map<String, Object> map = null;
        map = new HashMap<String, Object>();
        map.put("createDate", "test1");
        map.put("no", "test2");
        map.put("realname", "test3");
        map.put("productName", "test4");
        map.put("money", "test5");
        map.put("state", "test6");
        dataList.add(map);
        try {
            final OutputStream os = response.getOutputStream();
            ExportUtil.responseSetProperties(fName, response);
            ExportUtil.doExport(dataList, sTitle, mapKey, os);
            return;
        } catch (Exception e) {
        }
    }
}