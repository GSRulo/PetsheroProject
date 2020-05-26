package model;
import java.io.Serializable;
import java.sql.Timestamp;
/**
 * @date 06/04/2020
 * @author grulo
 * @since 0.1
 * @version 1.0
 */

public class Reports implements Serializable{

	private static final long serialVersionUID = 1L;
	private int idReports;
	private Status status;
	private String titulo;
	private String descricao;
	private int fkUsuario;
	private Timestamp dataCriacao;

	public Reports() {}

	public Reports(int idReports, Status status, String titulo, String descricao, int fkUsuario, Timestamp dataCriacao) {
		this.idReports = idReports;
		this.status = status;
		this.titulo = titulo;
		this.descricao = descricao;
		this.fkUsuario = fkUsuario;
		this.dataCriacao = dataCriacao;
	}

	public int getIdReports() {
		return idReports;
	}

	public void setIdReports(int idReports) {
		this.idReports = idReports;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public int getFkUsuario() {
		return fkUsuario;
	}

	public void setFkUsuario(int fkUsuario) {
		this.fkUsuario = fkUsuario;
	}

	public Timestamp getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Timestamp dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

}
