package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Artigo;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-09-12T04:57:32")
@StaticMetamodel(Autor.class)
public class Autor_ { 

    public static volatile SingularAttribute<Autor, String> afiliacao_ingles;
    public static volatile SingularAttribute<Autor, Integer> ordem_artigo;
    public static volatile SingularAttribute<Autor, String> afiliacao;
    public static volatile SingularAttribute<Autor, Long> id;
    public static volatile SingularAttribute<Autor, String> primeiro_nome;
    public static volatile SingularAttribute<Autor, String> nome_meio;
    public static volatile SingularAttribute<Autor, String> sobrenome;
    public static volatile SingularAttribute<Autor, String> email;
    public static volatile SingularAttribute<Autor, String> registro_orc_id;
    public static volatile SingularAttribute<Autor, Artigo> artigo_id;
    public static volatile SingularAttribute<Autor, String> pais;

}