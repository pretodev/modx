# Modulex

Um framework para desenvolvimento de aplicativos escalaveis e modulares.

### Motivacao

Sempre utilizei o Getx em meus projetos, porem, acho ele muito inchado com recursos que quebram padrao utilizado pelo flutter.
Alem disso, o getx pattern eh muito verboso e complicado de mexer, nao permitindo um padrao modularizado consistente.

O Modulex permite implementar um padrao de modularizacao consistente, alem de limitar o uso de Getx evitando a quebra de padrao, deixando disponivel apenas
Injecao de dependencia, gerenciamento de rotas e gerencia de estado com Rx. Ele tambem adiciona gerencia de estado assincrona com RxAsync e RxnAsync.

### Uso

**Adicione o modulex ao app**

```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
).modularize();
```

**Criando paginas**

Paginas sao componentes roteaveis da aplicacao