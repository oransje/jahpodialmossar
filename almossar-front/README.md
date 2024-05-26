# jahpodialmossar Frontend

Todo o código Elm está em `src/Main.elm` e depende da biblioteca [elm/html][html].

[html]: https://package.elm-lang.org/packages/elm/html/latest

## Instruções de compilação

Com o Elm instalado, [Install Elm](https://guide.elm-lang.org/install/elm.html), você pode compilar o código Elm em JavaScript.


Execute o seguinte comando a partir da raiz deste projeto:

```bash
elm make src/Main.elm --output=elm.js
```

Then open `index.html` in your browser!

Isso irá compilar o código Elm em JavaScript e criar um arquivo `elm.js` que é referenciado por `index.html`.

### API

O caminho para a API esta hardcoded na função `getData` em `src/Main.elm`. 
Para mudar o caminho da API, mude a variável `url` para o caminho desejado.
