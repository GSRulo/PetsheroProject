package model;

import java.io.Serializable;

public class UsuarioNeces implements Serializable {
	
	/**
	 * @date 24/04/2020
	 * @author grulo
	 * @since 0.1
	 * @version 1.0
	 */

	private static final long serialVersionUID = 1L;
	private int fkUsuario;
	private int fkNeces;
	
	public UsuarioNeces() {}

	public UsuarioNeces(int fkUsuario, int fkNeces) {
		this.fkUsuario = fkUsuario;
		this.fkNeces = fkNeces;
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
	
}
