/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import modelo.Artigo;
import java.util.List;

public interface ArtigoDAO {
    void salva(Artigo e);

    Artigo recupera(Long id);

    List<Artigo> buscaNome(String nome);

    List<Artigo> buscaTudo();
}
