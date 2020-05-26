package model;

import java.io.InputStream;
import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Base64;

/**
 * @date 06/04/2020
 * @author grulo
 * @since 0.1
 * @version 1.0
 */

public class Adocao implements Serializable{

	private static final long serialVersionUID = 1L;
	private int idAdocao;
	private int idAdotante;
	private SexoPet sexoPet;
	private String cor;
	private String idade;
	private String tamanho;
	private String tipo;
	private String descricao;
	private Status status;
	private InputStream foto;
	private int fkUsuario;
	private Timestamp dataCriacao;
	private Timestamp dataAdocao;
	
	/**
	 * DADOS USUARIO PARA O JOIN
	 * */
	private String nome;
	private String email;
	private String telefone;
	
	public Adocao() {}

	public Adocao(int idAdocao, int idAdotante, String idade, String cor, SexoPet sexoPet, String tamanho, String tipo, String descricao, Status status, InputStream foto,
			int fkUsuario,Timestamp dataCriacao, Timestamp dataAdocao) {
		this.idAdocao = idAdocao;
		this.idAdotante = idAdotante;
		this.idade = idade;
		this.cor = cor;
		this.sexoPet = sexoPet;
		this.tamanho = tamanho;
		this.tipo = tipo;
		this.descricao = descricao;
		this.status = status;
		this.foto = foto;
		this.fkUsuario = fkUsuario;
		this.dataCriacao = dataCriacao;
		this.dataAdocao = dataAdocao;
	}

	public Timestamp getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Timestamp dataCriacao) {
		this.dataCriacao = dataCriacao;
	}

	public Timestamp getDataAdocao() {
		return dataAdocao;
	}

	public void setDataAdocao(Timestamp dataAdocao) {
		this.dataAdocao = dataAdocao;
	}

	public int getIdAdocao() {
		return idAdocao;
	}

	public void setIdAdocao(int idAdocao) {
		this.idAdocao = idAdocao;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public InputStream getFoto() {
		return foto;
	}

	public void setFoto(InputStream foto) {
		this.foto = foto;
	}

	public int getFkUsuario() {
		return fkUsuario;
	}

	public void setFkUsuario(int fkUsuario) {
		this.fkUsuario = fkUsuario;
	}
	
	public int getIdAdotante() {
		return idAdotante;
	}

	public void setIdAdotante(int idAdotante) {
		this.idAdotante = idAdotante;
	}

	public SexoPet getSexoPet() {
		return sexoPet;
	}

	public void setSexoPet(SexoPet sexoPet) {
		this.sexoPet = sexoPet;
	}

	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	public String getTamanho() {
		return tamanho;
	}

	public void setTamanho(String tamanho) {
		this.tamanho = tamanho;
	}
	
	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}
	
	public String getBase64Image(){
		try {
			return Base64.getEncoder().encodeToString(this.foto.readAllBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	
	
}
