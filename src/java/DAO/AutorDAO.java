/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import modelo.Autor;
import java.util.List;

public interface AutorDAO {
    void salva(Autor e);

    Autor recupera(Long id);

    List<Autor> buscaTudo();
}
