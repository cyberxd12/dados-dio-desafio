package aula2;
import javax.swing.JOptionPane;

public class aula2 {

	public static void main(String[] args) {
		
		String[] nome = new String[5];
		String encontrar;
		int a = 0;
		
		for(int i = 0; i < 5; i++) {
			nome[i] = JOptionPane.showInputDialog(null,"insira o nome: ",
					                              "cadrastro", 1);
		}
		encontrar = JOptionPane.showInputDialog(null,"insira o nome para exibir: ",
				                                "encontrar", 1);
		for(int i = 0; i < 5; i++) {
			if(nome[i].equals(encontrar)) {
				a = 1;
			}
		}
		if(a == 1) {
			JOptionPane.showMessageDialog(null,"pessoa encontrada", "resultado", 2);
		}
		else {
			JOptionPane.showMessageDialog(null,"pessoa nao encontrada", "resultado", 0);
		}
	}

}