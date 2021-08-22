/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Micro
 */
@Entity
@XmlRootElement
public class Autor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @ManyToOne
    @JoinColumn(name = "artigo_id")
    private Artigo artigo_id;
    private int ordem_artigo;
    private String email;
    private String primeiro_nome;
    private String nome_meio;
    private String sobrenome;
    private String afiliacao;
    private String afiliacao_ingles;
    private String pais;
    private String registro_orc_id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Artigo getArtigo_id() {
        return artigo_id;
    }

    public void setArtigo_id(Artigo artigo_id) {
        this.artigo_id = artigo_id;
    }

    public int getOrdem_artigo() {
        return ordem_artigo;
    }

    public void setOrdem_artigo(int ordem_artigo) {
        this.ordem_artigo = ordem_artigo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPrimeiro_nome() {
        return primeiro_nome;
    }

    public void setPrimeiro_nome(String primeiro_nome) {
        this.primeiro_nome = primeiro_nome;
    }

    public String getNome_meio() {
        return nome_meio;
    }

    public void setNome_meio(String nome_meio) {
        this.nome_meio = nome_meio;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getAfiliacao() {
        return afiliacao;
    }

    public void setAfiliacao(String afiliacao) {
        this.afiliacao = afiliacao;
    }

    public String getAfiliacao_ingles() {
        return afiliacao_ingles;
    }

    public void setAfiliacao_ingles(String afiliacao_ingles) {
        this.afiliacao_ingles = afiliacao_ingles;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getRegistro_orc_id() {
        return registro_orc_id;
    }

    public void setRegistro_orc_id(String registro_orc_id) {
        this.registro_orc_id = registro_orc_id;
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
        if (!(object instanceof Autor)) {
            return false;
        }
        Autor other = (Autor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Autor[ id=" + id + " ]";
    }
    
}
