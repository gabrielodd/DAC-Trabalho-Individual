/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import modelo.Evento;
import java.util.List;

public interface EventoDAO {
    void salva(Evento e);

    Evento recupera(Long id);

    List<Evento> buscaNome(String nome);

    List<Evento> buscaTudo();
}
