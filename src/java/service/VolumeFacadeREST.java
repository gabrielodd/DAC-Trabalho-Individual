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
import modelo.Volume;
import DAO.JPAVolumeDAO;
import java.net.URISyntaxException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import javax.ws.rs.core.Response;


/**
 *
 * @author Micro
 */
@Stateless
@Path("volume")
public class VolumeFacadeREST extends AbstractFacade<Volume> {

    @PersistenceContext(unitName = "WebServicePU")
    private EntityManager em;

    public VolumeFacadeREST() {
        super(Volume.class);
    }

    @POST
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void create(@FormParam("sigla") String sigla, @FormParam("cidade") String cidade,
    @FormParam("desc_pt") String desc_pt, @FormParam("desc_en") String desc_en, @FormParam("num_edicao") int num_edicao
    ,@FormParam("data_inicio") String data_inicio
    ) {
        JPAVolumeDAO dao = new JPAVolumeDAO();
        Volume e = new Volume();
        e.setSigla_evento(sigla);
        e.setCidade(cidade);
        e.setDescricao_pt(desc_pt);
        e.setDescricao_en(desc_en);
        e.setNumero_edicao(num_edicao);
        e.setData_inicio(data_inicio);
        dao.salva(e);
    }

    @POST
    @Path("edit")
    @Consumes({MediaType.APPLICATION_FORM_URLENCODED})
    public void edit(@FormParam("id") Long id, @FormParam("sigla") String sigla, @FormParam("numero_edicao") int numero_edicao,
            @FormParam("desc_pt") String desc_pt, @FormParam("desc_en") String desc_en, 
            @FormParam("data") String data, @FormParam("cidade") String cidade){
        Volume a = super.find(id);
        if(!sigla.isEmpty()){
            a.setSigla_evento(sigla);
        }
        if(!desc_pt.isEmpty()){
            a.setDescricao_pt(desc_pt);
        }
        if(!desc_en.isEmpty()){
            a.setDescricao_en(desc_en);
        }
        if(!cidade.isEmpty()){
            a.setCidade(cidade);
        }
        if(!data.isEmpty()){
            a.setData_inicio(data);
        }
        if(numero_edicao != 0){
            a.setNumero_edicao(numero_edicao);
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
    public String find(@PathParam("id") Long id, HttpServletRequest request){
        Volume ab = super.find(id);
        return "<html><body><strong>Sigla: </strong>" + ab.getSigla_evento() + "<br><strong>Numero da Edicao: </strong>"
                + ab.getNumero_edicao() + "<br><strong>Data: </strong>" + ab.getData_inicio() + "<br><a href='http://localhost:8080/WebService/edit_volume.jsp'>Editar</a></body></html>";
    }

    @GET
    @Override
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Volume> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
    public List<Volume> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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
