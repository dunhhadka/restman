package org.example.controller;

import org.example.dao.MonAnDao;
import org.example.model.MonAn266;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MonAnController {
    @ResponseBody
    @GetMapping("/get-by-key")
    public List<MonAn266> getByKey(@RequestParam(required = false) String key) {
        return MonAnDao.getByKey(key);
    }

    @GetMapping("/mon-an-detail/{id}")
    public String getMonAnDetail(@PathVariable int id, Model model) {
        var monAn = MonAnDao.getDetailById(id);
        model.addAttribute("monAn", monAn);
        return "GDChiTietMonAn";
    }
}
