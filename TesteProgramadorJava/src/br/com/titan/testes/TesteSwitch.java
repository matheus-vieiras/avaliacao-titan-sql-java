package br.com.titan.testes;

import java.util.Scanner;

public class TesteSwitch {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		double valor1, valor2, total;
		int count;

		System.out.println("Informe o primeiro valor:");
		valor1 = sc.nextDouble();

		System.out.println("Informe o segundo valor:");
		valor2 = sc.nextDouble();

		System.out.println("Informe o que deseja fazer:");
		System.out.println("1 - Soma");
		System.out.println("2 - Subtração");
		System.out.println("3 - Multiplicação");
		System.out.println("4 - Divisão");

		count = sc.nextInt();
		switch (count) {

		case 1:
			total = valor1 + valor2;
			System.out.println(total);
			break;

		case 2:
			total = valor1 - valor2;
			System.out.println(total);
			break;

		case 3:
			total = valor1 * valor2;
			System.out.println(total);
			break;

		case 4:
			total = valor1 / valor2;
			System.out.println(total);
			break;

		default:
			System.out.println("Informe um valor valido");

		}

		sc.close();

	}

}
