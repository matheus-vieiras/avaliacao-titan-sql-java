package br.com.titan.testes;

import java.io.IOException;
import java.util.Scanner;

public class TesteLacoDo {

	public static void main(String[] args) throws IOException {

		Scanner sc = new Scanner(System.in);

		int sair = 0;

		do {
			System.out.println("1 - Ver o Menu");
			System.out.println("2 - Ler o Menu");
			System.out.println("3 - Repetir o Menu");
			System.out.println("4 - Tudo de novo");
			System.out.println("5 - N�o li pode Repetir");
			System.out.println("0 - Sair");
			sair = sc.nextInt();
			if (sair == 0) {
				System.out.println("Saiu!");
			}
		} while (sair != 0);

		sc.close();

	}

}
