package main.service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import main.dao.StudentDaoImpl;
import main.dao.StudentDaoInter;
import main.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Goshgar
 */
@Service
@Transactional
public class StudentServiceImpl implements StudentServiceInter {

    @Autowired
    StudentDaoInter studentDao;

    @Override
    public Student getStudentById(int id) {
        return studentDao.getStudentById(id);
    }

    @Override
    public List<Student> search(String name){
       return studentDao.search(name);
    }
    @Override
    public List<Student> getAll() {
        return studentDao.getAll();
    }

    @Override
    public boolean update(Student student) {
        studentDao.update(student);
        return true;
    }

    @Override
    public void insert(Student student) {
        studentDao.insert(student);
    }

    @Override
    public void delete(int id) {
        studentDao.delete(id);
    }
}
