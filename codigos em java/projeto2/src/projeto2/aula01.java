package projeto2;
import javax.swing.JOptionPane;

public class aula01 {

	public static void main(String[] args) {
		
		String nome, sexo, codigoEntrada, saldoEntrada;
		int codigo;
		float Saldo;
		
		codigoEntrada = JOptionPane.showInputDialog(null, 
				"informe o seu codigo:",
				"cadrastro de cliente", 2);
		nome = JOptionPane.showInputDialog(null,
				"informe o nome:",
				"cadastro de cliente", 2);
		sexo = JOptionPane.showInputDialog(null,
				"informe o seu sexo:",
				"cadrastro de cliente", 2);
		saldoEntrada = JOptionPane.showInputDialog(null,
				"informe o seu saldo:",
				"cadastro de cliente", 2);
		
		codigo = Integer.parseInt(codigoEntrada);
		
		Saldo = Float.parseFloat(saldoEntrada);
		
		System.out.println("codigo informado: "+ codigo +".\n"
				+ "nome informado: "+ nome +".\n"
				+ "sexo informado: "+ sexo +".\n"
				+ "saldo informado: "+ Saldo +".\n");
		
		if (Saldo > 1500) {
			System.out.println("cliente especial");
		}
		else {
			System.out.println("cliente normal");
		}
	}
}