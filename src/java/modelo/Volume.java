/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Micro
 */
@Entity
@XmlRootElement
public class Volume implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String sigla_evento;
    private String cidade;
    private String descricao_pt;
    private String descricao_en;
    private int numero_edicao;
    private String data_inicio;
    //List<Artigo> artigos = new ArrayList();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSigla_evento() {
        return sigla_evento;
    }

    public void setSigla_evento(String sigla_evento) {
        this.sigla_evento = sigla_evento;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getDescricao_pt() {
        return descricao_pt;
    }

    public void setDescricao_pt(String descricao_pt) {
        this.descricao_pt = descricao_pt;
    }

    public String getDescricao_en() {
        return descricao_en;
    }

    public void setDescricao_en(String descricao_en) {
        this.descricao_en = descricao_en;
    }

    public int getNumero_edicao() {
        return numero_edicao;
    }

    public void setNumero_edicao(int numero_edicao) {
        this.numero_edicao = numero_edicao;
    }

    public String getData_inicio() {
        return data_inicio;
    }

    public void setData_inicio(String data_inicio) {
        this.data_inicio = data_inicio;
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
        if (!(object instanceof Volume)) {
            return false;
        }
        Volume other = (Volume) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Volume[ id=" + id + " ]";
    }
    
}
