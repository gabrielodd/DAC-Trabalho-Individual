/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import DAO.JPAArtigoDAO;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import modelo.Autor;
import DAO.JPAAutorDAO;
import modelo.Artigo;


/**
 *
 * @author Micro
 */
@Stateless
@Path("autor")
public class AutorFacadeREST extends AbstractFacade<Autor> {

    @PersistenceContext(unitName = "WebServicePU")
    private EntityManager em;

    public AutorFacadeREST() {
        super(Autor.class);
    }

    @POST
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void create(@FormParam("email") String email, @FormParam("ordem_artigo") int ordem_artigo,
    @FormParam("primeiro_nome") String primeiro_nome, @FormParam("nome_meio") String nome_meio, 
    @FormParam("sobrenome") String sobrenome, @FormParam("afiliacao") String afiliacao,
    @FormParam("afiliacao_ingles") String afiliacao_ingles, @FormParam("pais") String pais,
    @FormParam("registro_orc_id") String registro_orc_id, @FormParam("artigo") Long artigo_id) {
        JPAAutorDAO dao = new JPAAutorDAO();
        JPAArtigoDAO artigo_dao = new JPAArtigoDAO();
        Autor e = new Autor();
        e.setEmail(email);
        e.setPrimeiro_nome(primeiro_nome);
        e.setNome_meio(nome_meio);
        e.setSobrenome(sobrenome);
        e.setAfiliacao(afiliacao);
        e.setAfiliacao_ingles(afiliacao_ingles);
        e.setRegistro_orc_id(registro_orc_id);
        e.setPais(pais);
        e.setOrdem_artigo(ordem_artigo);
        Artigo artigo = artigo_dao.recupera(artigo_id);
        e.setArtigo_id(artigo);
        dao.salva(e);
    }

    @POST
    @Path("edit")
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void edit(@FormParam("id") Long id, @FormParam("primeiro_nome") String primeiro_nome, 
      @FormParam("nome_meio") String nome_meio, @FormParam("sobrenome") String sobrenome,
      @FormParam("afiliacao") String afiliacao, @FormParam("afiliacao_en") String afiliacao_en,
      @FormParam("pais") String pais, @FormParam("registro_orc_id") String registro_orc_id, @FormParam("ordem_artigo") int ordem_artigo){
        Autor a = super.find(id);
        if(!primeiro_nome.isEmpty()){
            a.setPrimeiro_nome(primeiro_nome);
        }
        if(!nome_meio.isEmpty()){
            a.setNome_meio(nome_meio);
        }
        if(!sobrenome.isEmpty()){
            a.setSobrenome(sobrenome);
        }
        if(!afiliacao.isEmpty()){
            a.setAfiliacao(afiliacao);
        }
        if(!afiliacao_en.isEmpty()){
            a.setAfiliacao_ingles(afiliacao_en);
        }
        if(!pais.isEmpty()){
            a.setPais(pais);
        }
        if(!registro_orc_id.isEmpty()){
            a.setRegistro_orc_id(registro_orc_id);
        }
        if(ordem_artigo != 0){
            a.setOrdem_artigo(ordem_artigo);
        }
        super.edit(a);
    }

    @POST
    @Path("delete/{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Autor find(@PathParam("id") Long id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Autor> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Autor> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces(MediaType.TEXT_PLAIN)
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }
    
}