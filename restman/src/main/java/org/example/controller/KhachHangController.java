package org.example.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.dao.KhachHangDao;
import org.example.dao.MonAnDao;
import org.example.model.KhachHang266;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class KhachHangController {

    @GetMapping
    public String getGDDangNhap(HttpServletRequest request, HttpServletResponse response) {
        return "GDDangNhap";
    }

    @ResponseBody
    @GetMapping("/login")
    public String login(@RequestParam("email") String email, @RequestParam("password") String password) {
        var khacHang = new KhachHang266();
        khacHang.setEmail(email);
        khacHang.setMatKhau(password);
        return KhachHangDao.login(khacHang);
    }

    @GetMapping("/thanh-vien/home/{id}")
    public String toTrangChu(@PathVariable int id, Model model) {
        var khacHang = KhachHangDao.findById(id);
        if (khacHang == null) return "GDDangNhap";
        model.addAttribute("khachHang", khacHang);
        model.addAttribute("dsMonAn", MonAnDao.getList());
        return "GDTrangChu";
    }
}
