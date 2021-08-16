/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import modelo.Volume;

/**
 *
 * @author Micro
 */
public class JPAVolumeDAO {
    private EntityManager em;
    
    public JPAVolumeDAO() {
    }
        
    public void salva(Volume e) {
        
        em = JPAUtil.getEM();
        EntityTransaction et = em.getTransaction();
        et.begin();
        em.persist(e);
        et.commit();
        em.close();
    }
    
    public Volume recupera(Long id) {
        
        em = JPAUtil.getEM();
        EntityTransaction et = em.getTransaction();
        et.begin();
        Volume e = em.find(Volume.class, id);
        et.commit();
        em.close();
        return e;
    }
    
    public void deleta(Long id) {
        
        em = JPAUtil.getEM();
        EntityTransaction et = em.getTransaction();
        et.begin();
        Volume e = em.find(Volume.class, id);
        em.remove(e);
        et.commit();
        em.close();
    }
    
    public List<Volume> buscaNome(String nome) {
        String jpqlQuery = "SELECT e FROM Entrada e where e.sobrenome = :sn";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        query.setParameter("sn", nome);
        List<Volume> e = query.getResultList();
        em.close();
        return e;
    }
    
    public List<Volume> buscaTudo() {
        String jpqlQuery = "SELECT e FROM Entrada e";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        List<Volume> e = query.getResultList();
        em.close();
        return e;
    }
}
