[Fórum de discussões IME-USP](https://forum-ime-usp.herokuapp.com/)
===========================

O objetivo desta aplicação é proporcionar aos integrantes do instituto
uma maior interação, permitindo que alunos e professores de diferentes
cursos interajam entre si, compartilhando informações e sanando dúvidas.

Requisitos
----------

- ImageMagick
- Rails 5.2.3
- Ruby 2.6.3

Como iniciar a aplicação
------------------------

Baixe este repositório, extraia o arquivo ZIP e no terminal, dentro da
pasta extraída, execute os comandos:

`sudo apt-get install imagemagick`
(a gem 'paperclip' o exige para redimensionar imagens anexadas)

`sudo gem install bundle`
(caso a gem 'bundle' ainda não esteja instalada)

`bundle install --without production`
(instala todas as gems necessárias para o desenvolvimento e testes)

`rake db:create db:migrate db:seed && rails s`
(cria, migra e povoa o db, em seguida sobe o server web)

Se tudo deu certo, basta acessar localhost:3000 no seu browser.

Caso ocorra algum erro durante a execução de `bundle install`,
experimente executar o seguinte comando e repita o processo:

`gem list | cut -d" " -f1 | xargs gem uninstall -aIx`
(este comando remove todas as gems instaladas no seu sistema)

Privilégios dos diferentes tipos de usuário
-------------------------------------------

- Visitantes: podem ler os posts e comentários do fórum e fazer buscas
- Usuários: podem ler, criar e apagar posts e comentários
- Administradores: podem ler, criar e apagar posts e comentários.
Além disso, também podem controlar os usuários e criar, editar e apagar
fóruns e cursos.

Informações importantes
-----------------------

 - O e-mail do usuário administrador é `admin@admin.com`, e a senha é
`123456789`.

 - A aplicação está rodando em [https://forum-ime-usp.herokuapp.com/](https://forum-ime-usp.herokuapp.com/)
