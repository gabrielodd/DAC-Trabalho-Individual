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
        //EntityTransaction et = em.getTransaction();
        em.persist(e);
        em.close();
    }
    
    public Volume recupera(Long id) {
        
        em = JPAUtil.getEM();
        //EntityTransaction et = em.getTransaction();
        //et.begin();
        Volume e = em.find(Volume.class, id);
        //et.commit();
        em.close();
        return e;
    }
    
    public void deleta(Long id) {
        
        em = JPAUtil.getEM();
        //EntityTransaction et = em.getTransaction();
        //et.begin();
        Volume e = em.find(Volume.class, id);
        em.remove(e);
        //et.commit();
        em.close();
    }
    
    public List<Volume> buscaCidade(String nome) {
        String jpqlQuery = "SELECT e FROM Volume e where e.cidade = :sn";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        query.setParameter("sn", nome);
        List<Volume> e = query.getResultList();
        em.close();
        return e;
    }
    
    public List<Artigo> buscaArtigos(Volume v) {
        String jpqlQuery = "SELECT a FROM Artigo a WHERE a.volume_id = :v ORDER BY a.ordem_volume";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        query.setParameter("v", v);
        List<Artigo> a = query.getResultList();
        em.close();
        return a;
    }
    
    public List<Volume> buscaTudo() {
        String jpqlQuery = "SELECT e FROM Volume e ORDER BY e.sigla_evento, e.data_inicio";
        em = JPAUtil.getEM();
        Query query = em.createQuery(jpqlQuery);
        List<Volume> e = query.getResultList();
        em.close();
        return e;
    }
}
