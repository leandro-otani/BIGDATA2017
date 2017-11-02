#!/usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from numpy.linalg import inv

print "2a - Multiplicacao por Escalar"

arraySimples = np.array([1, 2, 3])
vezesCinco = arraySimples * 5

print arraySimples
print vezesCinco

assert np.all(vezesCinco == [5, 10, 15]), 'valor incorreto para vezesCinco'
print "Correto!\n"

print "2b - Multiplicacao elemento-a-elemento e produto interno\n"
u = np.arange(0, 5, .5)
v = np.arange(5, 10, .5)

elementoAelemento = u * v
prodInterno = np.dot(u,v)
print 'u: {0}'.format(u)
print 'v: {0}'.format(v)
print '\nElemento a elemento:\n{0}'.format(elementoAelemento)
print '\nProduto interno:\n{0}'.format(prodInterno)

assert np.all(elementoAelemento == [ 0., 2.75, 6., 9.75, 14., 18.75, 24., 29.75, 36., 42.75]), "Valores incorretos para elementoAelemento"
print "\nTeste elemento a elemento OK"
assert prodInterno==183.75, "Valor incorreto para prodInterno"
print "Teste produto interno OK"

print "\n2c - Multiplicacao de matrizes\n"

A = np.matrix([[1,2,3,4],[5,6,7,8]])
print 'A:\n{0}'.format(A)

At = A.T
print '\nA transposta:\n{0}'.format(At)

AAt = A * At
print '\nAAt:\n{0}'.format(AAt)

AAtInv = inv(AAt);
print '\nAAtInv:\n{0}'.format(AAtInv)

print '\nAAtInv * AAt:\n{0}\n'.format((AAt * AAtInv).round(4))

assert np.all(AAt == np.matrix([[30, 70], [70, 174]])), "Valores incorretos para AAt"
print "Teste matriz vezes transposta OK"
assert np.allclose(AAtInv, np.matrix([[0.54375, -0.21875], [-0.21875, 0.09375]])), "Valor incorreto para AAtInv"
print "Teste matriz vezes inversa == identidade OK"


print "\n2d - Slices\n"

atributos = np.array([1, 2, 3, 4])
print 'atributos:\n{0}'.format(atributos)

ultTres = atributos[-3:]

print '\nUltimos tres:\n{0}'.format(ultTres)

assert np.all(ultTres == [2, 3, 4]), "Valores incorretos para ultTres"
print "\nUltimos 3 elementos OK"

