package model;

public enum Status {
	
	ABERTO("Aberto"), ENCERRADO("Encerrado");
	
	Status() {}
	
	private String status;
	Status(String valor) {
		this.status = valor;
	}

	public static Status getValor(String valor) {
		for(Status status: Status.values()) {
			if(status.toString().equals(valor.toUpperCase())) {
				return status;
			}
		}
		return null;
	}

	public void setValor(String valor) {
	}
	
	public String getNameStatus() {
		return this.status;
	}
}
