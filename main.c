#include <stdio.h>
#include <stdlib.h>
#include "tablahash.h"

unsigned hash(void* clave) {
  int* p = clave;
  return *p;
}

int main(void) {
  int x = 42, y = 42, z = 3, w = 4;
  TablaHash *th = tablahash_crear(3, hash);

  tablahash_insertar(th, &y, &z);
  tablahash_insertar(th, &w, &x);

  printf("z : %d\n", *((int *)tablahash_buscar(th, &y)));
  printf("x : %d\n", *((int *)tablahash_buscar(th, &w)));
  printf("Tamaños de la vieja tabla %i\n", th->capacidad);
  tablahash_redimensionar(th);
  printf("Tamaños de la nueva tabla %i\n", th->capacidad);
  printf("z : %d\n", *((int *)tablahash_buscar(th, &y)));
  printf("x : %d\n", *((int *)tablahash_buscar(th, &w)));
  tablahash_insertar(th, &x, &z);
  tablahash_insertar(th, &z, &z);
  printf("z : %d\n", *((int *)tablahash_buscar(th, &x)));
  printf("z : %d\n", *((int *)tablahash_buscar(th, &z)));
  tablahash_eliminar(th, &x);
  tablahash_destruir(th);

  return 0;
}
