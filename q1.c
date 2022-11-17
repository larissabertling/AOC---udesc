//TRADUÇÃO PRIMEIRA QUESTÃO RECUPERAÇÃO AOC


#include <stdio.h>

int main() {
    // OBJETIVO DO PROGRAMA:
    // Somar todos os numeros abaixo de um certo numero
    // neste caso: numero = 10
    // Saída: 9 + 8 + 7 + 6 + 5 + 4 + 3 + 2 + 1 + 0 = 45
    // inicializações para representar
    // w = registrador w
    // d = registrador d
    // mem[100] = memória interna
    int w,d, mem08;

    //movlw 10
    w = 10;
    // movwf 0x08
    mem08 = w;
    // movlw 0
    w = 0;

    // loop: decfsz 0x08, 1
    // enquanto o que está em 0x08 for diferente de zero,
    // decremente-o em 1
    while (mem08 > 0) {
        mem08--;
        // continue:
        // addwf 0x08, 0
        // o valor de w é somado com o que está em 0x08 e armazenado em d
        // se d = 0 entao é armazenado em w; w += 0x08
        d = 0;
        if (d == 0) {
            w += mem08;
        }
    }

    // fim:
    mem08 = w;
    // END
    return 0;
}
