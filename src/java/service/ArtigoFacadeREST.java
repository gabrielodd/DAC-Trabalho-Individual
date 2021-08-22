/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

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
import modelo.Artigo;
import DAO.JPAArtigoDAO;
import DAO.JPAVolumeDAO;
import modelo.Volume;

/**
 *
 * @author Micro
 */
@Stateless
@Path("artigo")
public class ArtigoFacadeREST extends AbstractFacade<Artigo> {

    @PersistenceContext(unitName = "WebServicePU")
    private EntityManager em;

    public ArtigoFacadeREST() {
        super(Artigo.class);
    }

    @POST
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void create(@FormParam("idioma") String idioma, @FormParam("ordem_volume") int ordem_volume,
    @FormParam("titulo_original") String titulo_original, @FormParam("titulo_ingles") String titulo_ingles, 
    @FormParam("resumo_original") String resumo_original, @FormParam("resumo_ingles") String resumo_ingles,
    @FormParam("pc_original") String pc_original, @FormParam("pc_ingles") String pc_ingles,
    @FormParam("numero_paginas") int numero_paginas, @FormParam("volume") Long volume_id) {
        
        JPAArtigoDAO dao = new JPAArtigoDAO();
        JPAVolumeDAO volume_dao = new JPAVolumeDAO();
        Artigo a = new Artigo();
        a.setIdioma(idioma);
        a.setOrdem_volume(ordem_volume);
        a.setTitulo_ingles(titulo_ingles);
        a.setTitulo_original(titulo_original);
        a.setResumo_ingles(resumo_ingles);
        a.setResumo_original(resumo_original);
        a.setPalavra_chave_ingles(pc_ingles);
        a.setPalavra_chave_original(pc_original);
        a.setNumero_paginas(numero_paginas);
        Volume volume = volume_dao.recupera(volume_id);
        a.setVolume_id(volume);
        dao.salva(a);
    }

    @PUT
    @Path("{id}")
    @Consumes({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public void edit(@PathParam("id") Long id, Artigo entity) {
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Long id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public Artigo find(@PathParam("id") Long id) {
        return super.find(id);
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Artigo> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Artigo> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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

