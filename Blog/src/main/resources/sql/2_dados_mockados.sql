use blog;

INSERT INTO usuarios (nome, email, senha, moderador) VALUES
('Moderador', 'moderador@blog.com', '1234', 1),
('Usuário', 'usuario@blog.com', '1234', 0);

-- select * from usuarios;

insert into postagens (titulo, texto, usuarios_id) values 
('Lorem Ipsum 1','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 2','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 3','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 4','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 5','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 6','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 7','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 8','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 9','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 10','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 11','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 12','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 13','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1),
('Lorem Ipsum 14','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum, quam odio. Nisi dolore, velit, placeat similique laudantium impedit corporis id omnis accusantium eaque minima doloremque fuga enim rerum, aliquam ut?',1);

insert into comentarios (texto, postagens_id, usuarios_id) values
('primeiro comentário',1,2);

insert into comentarios (texto, ativo, postagens_id, usuarios_id) values
('comentário ativo',1,1,2);

-- select * from comentarios;