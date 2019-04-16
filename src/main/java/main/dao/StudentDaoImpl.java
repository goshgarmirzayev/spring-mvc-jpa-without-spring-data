package main.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import main.entity.Student;
import org.springframework.stereotype.Repository;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Goshgar
 */
@Repository
public class StudentDaoImpl implements StudentDaoInter {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Student getStudentById(int id) {
        Student student = em.find(Student.class, id);
        em.close();
        return student;
    }

    @Override
    public List<Student> getAll() {
        List<Student> list;
        list = em.createQuery("select u from Student u").getResultList();
        return list;
    }
    @Override
    public List<Student> search(String name){
        List<Student> s= em.createQuery("select u from Student u where lower(u.name) like '%"+name+"%'").getResultList();
        return s;
    }

    @Override
    public boolean update(Student student) {
        em.merge(student);
        return true;
    }

    @Override
    public void insert(Student student) {
        em.persist(student);
        em.close();
    }

    @Override
    public void delete(int id) {
        Student student = em.find(Student.class, id);
        em.remove(student);
        em.close();
    }
}
