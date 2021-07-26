/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author Micro
 */
@Entity
public class Artigo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "volume_id")
    private Volume volume;
    private int ordem_volume;
    private String idioma;
    private String titulo_original;
    private String titulo_ingles;
    private String resumo_original;
    private String resumo_ingles;
    private String palavra_chave_original;
    private String palavra_chave_ingles;
    private int numero_paginas;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Volume getVolume() {
        return volume;
    }

    public void setVolume(Volume volume) {
        this.volume = volume;
    }

    public int getOrdem_volume() {
        return ordem_volume;
    }

    public void setOrdem_volume(int ordem_volume) {
        this.ordem_volume = ordem_volume;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getTitulo_original() {
        return titulo_original;
    }

    public void setTitulo_original(String titulo_original) {
        this.titulo_original = titulo_original;
    }

    public String getTitulo_ingles() {
        return titulo_ingles;
    }

    public void setTitulo_ingles(String titulo_ingles) {
        this.titulo_ingles = titulo_ingles;
    }

    public String getResumo_original() {
        return resumo_original;
    }

    public void setResumo_original(String resumo_original) {
        this.resumo_original = resumo_original;
    }

    public String getResumo_ingles() {
        return resumo_ingles;
    }

    public void setResumo_ingles(String resumo_ingles) {
        this.resumo_ingles = resumo_ingles;
    }

    public String getPalavra_chave_original() {
        return palavra_chave_original;
    }

    public void setPalavra_chave_original(String palavra_chave_original) {
        this.palavra_chave_original = palavra_chave_original;
    }

    public String getPalavra_chave_ingles() {
        return palavra_chave_ingles;
    }

    public void setPalavra_chave_ingles(String palavra_chave_ingles) {
        this.palavra_chave_ingles = palavra_chave_ingles;
    }

    public int getNumero_paginas() {
        return numero_paginas;
    }

    public void setNumero_paginas(int numero_paginas) {
        this.numero_paginas = numero_paginas;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Artigo)) {
            return false;
        }
        Artigo other = (Artigo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Artigo[ id=" + id + " ]";
    }
    
}
