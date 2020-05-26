package model;

public enum SexoPet {
	MACHO("Macho"), FEMEA("Fêmea"), DESCONHECIDO("Desconhecido");
	
	SexoPet() {};
	
	private String sexo;
	SexoPet(String valor){
		this.sexo = valor;
	}
	
	public static SexoPet getValor(String valor) {
		for(SexoPet sexo: SexoPet.values()) {
			if(sexo.toString().equals(valor.toUpperCase())) {
				return sexo;
			}
		}
		return null;
	}

	public void setValor(String valor) {}
	
	public String getSexo() {
		return this.sexo;
	}
	
}
