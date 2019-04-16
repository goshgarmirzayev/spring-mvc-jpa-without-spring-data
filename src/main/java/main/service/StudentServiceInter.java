/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main.service;

import java.util.List;
import main.entity.Student;

/**
 *
 * @author Goshgar
 */
public interface StudentServiceInter {

    public Student getStudentById(int id);

    public List<Student> getAll();

    public boolean update(Student student);

    public void insert(Student student);

    public void delete(int id);
    public List<Student> search(String name);
}
