package model;
import java.io.Serializable;
/**
 * @date 06/04/2020
 * @author grulo
 * @since 0.1
 * @version 1.0
 */

public class Usuario implements Serializable{

	private static final long serialVersionUID = 1L;
	private int idUsuario;
	private String nome;
	private String tipoUsuario;
	private String documento;
	private String email;
	private String tel;
	private String senha;

	
	public Usuario() {}

	public Usuario(int idUsuario, String nome, String tipoUsuario, String documento, String email, String tel, String senha) {
		this.idUsuario = idUsuario;
		this.nome = nome;
		this.tipoUsuario = tipoUsuario;
		this.documento = documento;
		this.email = email;
		this.tel = tel;
		this.senha = senha;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(String tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
}
