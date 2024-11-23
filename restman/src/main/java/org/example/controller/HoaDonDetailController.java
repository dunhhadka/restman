package org.example.controller;

import org.example.dao.HoaDonBanHangDao;
import org.example.dao.HoaDonChiTietDao;
import org.example.dao.KhachHangDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hoa-don-detail")
public class HoaDonDetailController {

    @GetMapping("/{id}")
    public String getHoaDonDetail(@PathVariable int id, Model model) {
        var hoaDon = HoaDonBanHangDao.findById(id);
        if (hoaDon == null) throw new IllegalArgumentException("error");
        var khachHang = KhachHangDao.findById(hoaDon.getKhachHang266ID());
        var hoaDonChiTiets = HoaDonChiTietDao.findByHoaDonId(hoaDon.getId());

        model.addAttribute("khachHang", khachHang);
        model.addAttribute("hoaDon", hoaDon);
        model.addAttribute("hoaDonChiTiets", hoaDonChiTiets);
        return "GDHoaDonChiTiet";
    }
}
