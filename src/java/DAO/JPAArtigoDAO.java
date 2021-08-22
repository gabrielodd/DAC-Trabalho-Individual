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
import modelo.Artigo;

/**
 *
 * @author Micro
 */
public class JPAArtigoDAO {
    private EntityManager em;
    
    public JPAArtigoDAO() {
    }
        
    public void salva(Artigo a) {
        
        em = JPAUtil.getEM();
        //EntityTransaction et = em.getTransaction();
        em.persist(a);
        em.close();
    }
    
    public Artigo recupera(Long id) {
        
        em = JPAUtil.getEM();
        //EntityTransaction et = em.getTransaction();
        //et.begin();
        Artigo a = em.find(Artigo.class, id);
        //et.commit();
        em.close();
        return a;
    }
    
    public void deleta(Long id) {
        
        em = JPAUtil.getEM();
        //EntityTransaction et = em.getTransaction();
        //et.begin();
        Artigo a = em.find(Artigo.class, id);
        em.remove(a);
        //et.commit();
        em.close();
    }

    public List<Artigo> buscaTudo() {
        String jpqlQuery = "SELECT a FROM Artigo a";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        List<Artigo> a = query.getResultList();
        em.close();
        return a;
    }
}
