# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# cria alguns usuários
print "Criando usuários"
User.create(name: "Administrador",  email: "admin@admin.com",     password: "123456789", password_confirmation: "123456789", role: "admin", avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg"); print "."
User.create(name: "Kurt Cobain",    email: "kurt@kurt.com",       password: "123456789", password_confirmation: "123456789", role: "user",  avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg"); print "."
User.create(name: "Anthony Kiedis", email: "anthony@anthony.com", password: "123456789", password_confirmation: "123456789", role: "user",  avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg"); print "."
User.create(name: "Gil Brother",    email: "gil@gil.com",         password: "123456789", password_confirmation: "123456789", role: "user",  avatar_file_name: "avatar.jpg", avatar_content_type: "image/jpeg"); print "."
print " OK"

# cria os principais fóruns
print "\nCriando fóruns"
Forum.create(title: "MAE - Estatística",           description: "Fórum para dúvidas em estatística");     print "."
Forum.create(title: "MAC - Ciência da computação", description: "Fórum para dúvidas em computação");      print "."
Forum.create(title: "MAT - Matemática pura",       description: "Fórum para dúvidas em matemática pura"); print "."
print " OK"

# cria cursos de estatística
print "\nCriando cursos"
Course.create(title: "MAE0119 - Introdução à Probabilidade e à Estatística",  description: "Descrição", forum_id: 1); print "."
Course.create(title: "MAE0217 - Estatística Descritiva",                      description: "Descrição", forum_id: 1); print "."
Course.create(title: "MAE0221 - Probabilidade I",                             description: "Descrição", forum_id: 1); print "."
Course.create(title: "MAE0499 - Processos Estocásticos",                      description: "Descrição", forum_id: 1); print "."

# cria cursos de computação
Course.create(title: "MAC0105 - Fundamentos de Matemática para a Computação", description: "Descrição", forum_id: 2); print "."
Course.create(title: "MAC0110 - Introdução à Computação",                     description: "Descrição", forum_id: 2); print "."
Course.create(title: "MAC0121 - Algoritmos e Estruturas de Dados I",          description: "Descrição", forum_id: 2); print "."
Course.create(title: "MAC0210 - Laboratório de Métodos Numéricos",            description: "Descrição", forum_id: 2); print "."

# cria cursos de matemática pura
Course.create(title: "MAT0112 - Vetores e geometria analítica",               description: "Descrição", forum_id: 3); print "."
Course.create(title: "MAT0236 - Funções Diferenciáveis e Séries",             description: "Descrição", forum_id: 3); print "."
Course.create(title: "MAT2453 - Cálculo Diferencial e Integral I",            description: "Descrição", forum_id: 3); print "."
Course.create(title: "MAT2454 - Cálculo Diferencial e Integral II",           description: "Descrição", forum_id: 3); print "."
print " OK"

# cria alguns posts comentados
print "\nCriando posts comentados"
12.times do |course|
  15.times do |n|
    Post.create(title: "Exemplo de post #{n+1}", content: "Exemplo de conteúdo #{n+1}", user_id: 1, course_id: course+1); print "."
    Post.last.comments.create(content: "Algum comentário", course_id: Post.last.course.id, user_id: 2); print "."
    Post.last.comments.create(content: "Bla bla bla...",   course_id: Post.last.course.id, user_id: 3); print "."
    Post.last.comments.create(content: "I don't care",     course_id: Post.last.course.id, user_id: 4); print "."
  end
end
print " OK\n\n"
