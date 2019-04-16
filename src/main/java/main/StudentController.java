/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import main.service.StudentServiceImpl;

import java.util.List;

import main.entity.Student;
import main.service.StudentServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Goshgar
 */
@Controller
public class StudentController {

    @Autowired
    StudentServiceInter db;

    @RequestMapping("/students")
    public String pageStudentAll(Model model) {
        List<Student> l = db.getAll();
        model.addAttribute("student", new Student());
        model.addAttribute("studentu", new Student());
        model.addAttribute("studentList", l);
        return "student";
    }
    @RequestMapping("/students/search")
    public String pageStudentSearch(@ModelAttribute("students")Student s,Model model) {

        model.addAttribute("studentList",db.search(s.getName()));
        return "redirect:/students";
    }

    @RequestMapping(value = "/students", method = RequestMethod.POST)
    public String pageStudentAdd(@ModelAttribute("student") Student s) {
        db.insert(s);
        return "redirect:/students";
    }

    @RequestMapping(value = "/students/delete")
    public String deleteStudent(@ModelAttribute("student")Student s){
       db.delete(s.getId());
        return "redirect:/students";
    }
    @RequestMapping(value = "/students/update", method=RequestMethod.GET)
    public String pageStudentUpdate(@ModelAttribute("studentu") Student s) {

        db.update(s);
        System.out.println("Added From update");
        return "redirect:/students";
    }
}
//}
