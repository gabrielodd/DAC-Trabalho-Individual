package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Volume;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-09-12T04:57:32")
@StaticMetamodel(Artigo.class)
public class Artigo_ { 

    public static volatile SingularAttribute<Artigo, String> palavra_chave_ingles;
    public static volatile SingularAttribute<Artigo, Integer> numero_paginas;
    public static volatile SingularAttribute<Artigo, Volume> volume_id;
    public static volatile SingularAttribute<Artigo, String> titulo_ingles;
    public static volatile SingularAttribute<Artigo, Integer> ordem_volume;
    public static volatile SingularAttribute<Artigo, String> titulo_original;
    public static volatile SingularAttribute<Artigo, String> idioma;
    public static volatile SingularAttribute<Artigo, Long> id;
    public static volatile SingularAttribute<Artigo, String> resumo_original;
    public static volatile SingularAttribute<Artigo, String> resumo_ingles;
    public static volatile SingularAttribute<Artigo, String> palavra_chave_original;

}