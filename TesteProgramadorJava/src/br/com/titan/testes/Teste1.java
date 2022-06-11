package br.com.titan.testes;

import java.util.Locale;
import java.util.Scanner;

public class Teste1 {

	public static void main(String[] args) {

		Locale.setDefault(Locale.US);
		Scanner sc = new Scanner(System.in);

		System.out.println("Digite a nota do Aluno: ");
		double nota = sc.nextDouble();

		if (nota >= 7.0 && nota <= 10.0) {
			System.out.println("Aprovado!");
		} else if (nota < 6.9 && nota >= 5.0) {
			System.out.println("Recuperação!");
		} else if (nota < 5.0) {
			System.out.println("Reprovado!");
		} else if (nota > 10.0 || nota < 0.0) {
			System.out.println("Nota invalida, digite novamente.");
		}

		sc.close();

	}

}
