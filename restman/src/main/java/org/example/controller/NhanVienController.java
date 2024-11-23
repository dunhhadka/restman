package org.example.controller;

import org.example.dao.NhanVienDao;
import org.example.model.NhanVien266;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @GetMapping("/login")
    public String toDangNhap() {
        return "GDDangNhapNhanVien";
    }

    @ResponseBody
    @PostMapping("/login")
    public String dangNhp(@RequestParam String email, @RequestParam String password) {
        var nhaVien = new NhanVien266();
        nhaVien.setEmail(email);
        nhaVien.setMatKhau(password);
        return NhanVienDao.login(nhaVien);
    }

    @GetMapping("/trang-chu/{id}")
    public String toTrangChu(@PathVariable int id, Model model) {
        var nhanVien = NhanVienDao.findById(id);
        model.addAttribute("nhanVien", nhanVien);
        return "GDTrangChuNhanVien";
    }
}
