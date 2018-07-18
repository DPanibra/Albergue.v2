package model.entity;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.IdentityType;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable(identityType = IdentityType.APPLICATION)
public class Comunicados {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY) private Long id;
	@Persistent private Date created;
	@Persistent private String asunto;
	@Persistent private String text;
	@Persistent private String tutoresReceptores;
	public Comunicados(Date created, String asunto,String text, String tutoresReceptores) {
		this.asunto=asunto;
		this.created = created;
		this.text = text;
		this.tutoresReceptores = tutoresReceptores;
	}
	public Long getId(){
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public String getAsunto() {
		return asunto;
	}
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getTutoresReceptores() {
		return tutoresReceptores;
	}
	public void setTutoresReceptores(String tutoresReceptores) {
		this.tutoresReceptores = tutoresReceptores;
	}
	
}