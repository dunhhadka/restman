package org.example.controller;

import org.example.dao.HoaDonBanHangDao;
import org.example.dao.KhachHangDao;
import org.example.dao.ThongKeKhachHangDao;
import org.example.model.ThongKeKhachHang266;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping
public class ThongKeKhachHangController {

    @GetMapping("doanh-thu-khach-hang")
    public String getGDTrangThongKe() {
        return "GDThongKeDTKhachHang";
    }

    @ResponseBody
    @GetMapping("doanh-thu-khach-hang/thoi-gian")
    public List<ThongKeKhachHang266> thongKe(
            @RequestParam(required = false) LocalDate startDate,
            @RequestParam(required = false) LocalDate endDate
    ) {
        return ThongKeKhachHangDao.thongKe(startDate, endDate);
    }

    @GetMapping("/doanh-thu-chi-tiet/customer-details")
    public String getThongKeChiTiet(
            @RequestParam int id,
            @RequestParam(required = false) LocalDate startDate,
            @RequestParam(required = false) LocalDate endDate,
            Model model
    ) {
        var khachHang = KhachHangDao.findById(id);
        var hoaDons = HoaDonBanHangDao.findByKhachHangIdAndCondition(id, startDate, endDate);
        model.addAttribute("khachHang", khachHang);
        model.addAttribute("hoaDons", hoaDons);
        return "GDChiTietThongKeKhachHang";
    }
}
