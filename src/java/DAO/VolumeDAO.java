/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import modelo.Volume;
import modelo.Artigo;
import java.util.List;

public interface VolumeDAO {
    void salva(Volume e);

    Volume recupera(Long id);

    List<Volume> buscaCidade(String nome);

    List<Artigo> buscaArtigos(Volume v);
    
    List<Volume> buscaTudo();
}