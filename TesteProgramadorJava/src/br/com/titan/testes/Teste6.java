package br.com.titan.testes;

import java.util.Locale;
import java.util.Scanner;

public class Teste6 {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);
		Locale.setDefault(Locale.US);

		System.out.println("Digite o valor da dívida: ");
		double valorTotalDivida = sc.nextDouble();
		System.out.println("Digite a quantidade de meses:");
		int qntMeses = sc.nextInt();
		double juros = (valorTotalDivida * 0.01);

		if (qntMeses > 5) {
			System.out.println("Valor maximo excedido. Tente novamente");
		} else {
			System.out.println("Valor total com juros:");
			double total = (valorTotalDivida + juros);
			System.out.println(total);

			System.out.println("Valor parcelado:");
			double parcela = (valorTotalDivida + juros) / qntMeses;
			System.out.println(parcela);

			sc.close();
		}

	}

}
