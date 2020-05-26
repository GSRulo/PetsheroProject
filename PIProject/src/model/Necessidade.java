package model;
import java.io.Serializable;
import java.sql.Timestamp;
/**
 * @date 06/04/2020
 * @author grulo
 * @since 0.1
 * @version 1.0
 */

public class Necessidade implements Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String titulo;
	private String descricao;
	private Status status;
	private float vlArrecadar;
	private String banco;
	private String agencia;
	private String conta;
	private Timestamp dataCriacao;
	
	private int fkUsuario;
	private int fkNeces;
	
	/**
	 * Dados vindo da tabela de usuários
	 * */
	private String email;
	private String nome;
	private String telefone;
	private String documento;
	
	public Necessidade() {}

	public Necessidade(int id, String titulo, String descricao, Status status, float vlArrecadar, String banco,
			String agencia, String conta, Timestamp data_criacao) {
		this.id = id;
		this.titulo = titulo;
		this.descricao = descricao;
		this.status = status;
		this.vlArrecadar = vlArrecadar;
		this.banco = banco;
		this.agencia = agencia;
		this.conta = conta;
		this.dataCriacao = data_criacao;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public float getVlArrecadar() {
		return vlArrecadar;
	}

	public void setVlArrecadar(float vlArrecadar) {
		this.vlArrecadar = vlArrecadar;
	}

	public String getBanco() {
		return banco;
	}

	public void setBanco(String banco) {
		this.banco = banco;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public String getConta() {
		return conta;
	}

	public void setConta(String conta) {
		this.conta = conta;
	}
	

	public Timestamp getDataCriacao() {
		return dataCriacao;
	}

	public void setDataCriacao(Timestamp data_criacao) {
		this.dataCriacao = data_criacao;
	}
	
	public int getFkUsuario() {
		return fkUsuario;
	}

	public void setFkUsuario(int fkUsuario) {
		this.fkUsuario = fkUsuario;
	}

	public int getFkNeces() {
		return fkNeces;
	}

	public void setFkNeces(int fkNeces) {
		this.fkNeces = fkNeces;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}
	
	
}
