package com.v5b7.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/index",method={RequestMethod.GET, RequestMethod.POST})
public class IndexController {

    @RequestMapping
    @ResponseBody
	public String index() {
		return "test";
	}
}